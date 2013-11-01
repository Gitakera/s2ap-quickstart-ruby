=begin
/**
 * Copyright 2013 Google Inc.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *
 * @author Maru Ahues Bouza <mahues@google.com>
 * @version 1.0
 *
 */
=end
require 'google/api_client'
require 'sinatra'
require 'json'
require 'jwt'

require './wobs_constants'
require './loyaltyclass'
require './loyaltyobject'
require './offerclass'
require './offerobject'

include WalletConstants

before do request.body.rewind
    @input = JSON.parse request.body.read  if (request.body && request.body.size > 0)
end

configure do
  # Creates new Google API client instance to authorize service account
  client = Google::APIClient.new
  key = Google::APIClient::PKCS12.load_key(KEYFILE, MERCHANT_SECRET)
  asserter = Google::APIClient::JWTAsserter.new(
     CLIENT_EMAIL,
     'https://www.googleapis.com/auth/wallet_object.issuer',
     key)
  client.authorization = asserter.authorize() 
  # Reads WOBS discovery file
  doc = File.read('wobs-discovery.json')
  # Registers API client using discovered file
  client.register_discovery_document('walletobjects', 'v1', doc) 
  # Gets the discovered api from the client and sets as walletobjects
  walletobjects = client.discovered_api('walletobjects', 'v1')
  set :api_client, client
  set :walletobjects, walletobjects
end

def api_client; settings.api_client; end
def walletobjects; settings.walletobjects; end  
  
get "/" do
  File.read("index.html")
end

get "/jwt/:type" do |typ|
  jwt = {
    "iss"=> CLIENT_EMAIL,
    "aud" => "google",
    "typ" => "savetowallet",
    "iat"=> Time.now.utc.to_i,
    "payload" => {
      "loyaltyObjects" => Array.new,
      "offerObjects" => Array.new,
      "loyaltyClasses" => Array.new,
      "offerClasses" => Array.new
    },
    "origins"=> ORIGINS
  }
  case typ when "loyalty"
    loyaltyobject = LoyaltyObject.generate_object(MERCHANT_ID,LOYALTY_CLASS_ID,LOYALTY_OBJECT_ID)
    jwt['payload']['loyaltyObjects'].push(loyaltyobject)
  when "offer"
    offerobject = OfferObject.generate_object(MERCHANT_ID,OFFER_CLASS_ID,OFFER_OBJECT_ID)
    jwt['payload']['offerObjects'].push(offerobject)
  end
  private_key = Google::APIClient::PKCS12.load_key(KEYFILE, MERCHANT_SECRET)
  jwtEncoded = JWT.encode(jwt, private_key, "RS256")
end

post "/insert/:type" do |typ|
  case typ when "loyalty"
    api_object = LoyaltyClass.generate_class(MERCHANT_ID,LOYALTY_CLASS_ID)
    object_id = LOYALTY_CLASS_ID
    api_method = walletobjects.loyaltyclass.insert
  when "offer"
    api_object = OfferClass.generate_class(MERCHANT_ID,OFFER_CLASS_ID)
    object_id = OFFER_CLASS_ID
    api_method = walletobjects.offerclass.insert
  end
  # Makes an API call to insert a new loyalty or offer class
  result = api_client.execute(
    :api_method => api_method,
    :body_object => api_object
  )
  if (result.error?)
    message = "Error inserting: #{typ} #{result.error_message}" 
  else
    message = "Successfully inserted: #{typ} #{object_id}"
  end
  return [
    200,
    [["Content-Type", "application/json"]],
    assemble_json_body(result, message)
  ]
end

post "/webservice" do
  #merchant needs to create the wallet object if successful return object otherwise return response error
  success = true
  if(!success)  
    error_action = (@input['params']['linkingId']) ? "link" : "signup"
    jwt = {
      "iss" => CLIENT_EMAIL,
      "aud" => "google",
      "typ" => "loyaltywebservice",
      "iat" =>  Time.now.utc.to_i,
      "payload" => {
        "webserviceResponse" => {
          "message" => "Sorry we can't complete this #{error_action}",
          "result" => "rejected"
        },
      },
    }
  else
    jwt = {
      "iss" => CLIENT_EMAIL,
      "aud" => "google",
      "typ" => "loyaltywebservice",
      "iat" =>  Time.now.utc.to_i,
      "payload" => {
        "webserviceResponse" => {
          "result" => "approved"
        },
        "loyaltyObjects" => Array.new,
        "offerObjects" => Array.new
      },
    }
    loyalty_object_id = (@input['params']['linkingId']) ? @input['params']['linkingId'] : LOYALTY_OBJECT_ID
    loyalty_object = LoyaltyObject.generate_object(MERCHANT_ID, LOYALTY_CLASS_ID, LOYALTY_OBJECT_ID)
    jwt['payload']['loyaltyObjects'].push(loyalty_object)
  end
  # Loads a key from PKCS12 file using the private key and merchant secret
  private_key = Google::APIClient::PKCS12.load_key(KEYFILE, MERCHANT_SECRET)
  jwt_encoded = JWT.encode(jwt, private_key, "RS256")
end

get "/list-classes/:type" do |typ|
  case typ when "loyalty"
    api_method = walletobjects.loyaltyclass.list
  when "offer"
    api_method = walletobjects.offerclass.list
  end
  # Makes an API call to list loyalty or offer classes based on issuerId
  result = api_client.execute(
    :api_method => api_method,
    :parameters => {'issuerId' => MERCHANT_ID }
  )
  return [
    200,
    [["Content-Type", "application/json"]],
    assemble_json_body(result, "")
  ]
end

get "/list-objects/:type" do |typ|
  case typ when "loyalty"
    api_method = walletobjects.loyaltyobject.list
    class_id = "#{MERCHANT_ID}.#{LOYALTY_CLASS_ID}"
  when "offer"
    api_method = walletobjects.offerobject.list
    class_id = "#{MERCHANT_ID}.#{OFFER_CLASS_ID}"
  end
  # Makes an API call to list loyalty or offer objects based on classId
  result = api_client.execute(
    :api_method => api_method,
    :parameters => {'classId' => class_id }
  )
  return [
    200,
    [["Content-Type", "application/json"]],
    assemble_json_body(result, "")
  ]
end

get "/get/:type" do |typ|
  case typ when "loyaltyclass"
    api_method = walletobjects.loyaltyclass.get
    resource_id = "#{MERCHANT_ID}.#{LOYALTY_CLASS_ID}"
  when "offerclass"
    api_method = walletobjects.offerclass.get
    resource_id = "#{MERCHANT_ID}.#{OFFER_CLASS_ID}"
  when "loyaltyobject"
    api_method = walletobjects.loyaltyobject.get
    resource_id = "#{MERCHANT_ID}.#{LOYALTY_OBJECT_ID}"
  when "offerobject"
    api_method = walletobjects.offerobject.get
    resource_id = "#{MERCHANT_ID}.#{OFFER_OBJECT_ID}"
  end
  # Makes an API call to get class or object based on type received in the request
  result = api_client.execute(
    :api_method => api_method,
    :parameters => {'resourceId' => resource_id }
  )
  return [
    200,
    [["Content-Type", "application/json"]],
    assemble_json_body(result, "")
  ]
end

get "/update/:type" do |typ|
  case typ when "loyaltyclass"
    api_get_method = walletobjects.loyaltyclass.get
    api_update_method = walletobjects.loyaltyclass.update
    resource_id = "#{MERCHANT_ID}.#{LOYALTY_CLASS_ID}"
  when "offerclass"
    api_get_method = walletobjects.offerclass.get
    api_update_method = walletobjects.offerclass.update
    resource_id = "#{MERCHANT_ID}.#{OFFER_CLASS_ID}"
  when "loyaltyobject"
    api_get_method = walletobjects.loyaltyobject.get
    api_update_method = walletobjects.loyaltyobject.update
    resource_id = "#{MERCHANT_ID}.#{LOYALTY_OBJECT_ID}"
  when "offerobject"
    api_get_method = walletobjects.offerobject.get
    api_update_method = walletobjects.offerobject.update
    resource_id = "#{MERCHANT_ID}.#{OFFER_OBJECT_ID}"
  end
  # Makes API Call to get class or object based on type received in the request
  get_result = api_client.execute(
    :api_method => api_get_method,
    :parameters => {'resourceId' => resource_id }
  )
  obj_class_toupdate = JSON.parse(get_result.body)
  obj_class_toupdate["version"] = obj_class_toupdate["version"].to_i + 1
  obj_class_toupdate["programName"] = "Program Name Updated" if obj_class_toupdate["programName"]
  obj_class_toupdate["title"] = "Title Updated"  if obj_class_toupdate["title"]
  obj_class_toupdate["loyaltyPoints"]["balance"]["string"] = "1000" if obj_class_toupdate["loyaltyPoints"]
  obj_class_toupdate["reviewStatus"] = "underReview" if obj_class_toupdate["reviewStatus"]
  # Makes API Call to update class or object based on type received in the request
  update_result = api_client.execute(
    :api_method => api_update_method,
    :parameters => {'resourceId' => resource_id, 'strict' => 'true' },
    :body_object => obj_class_toupdate
  )
  return [
    200,
    [["Content-Type", "application/json"]],
    assemble_json_body(update_result, "")
  ]
end

get "/add-message/:type" do |typ|
  case typ when "loyaltyclass"
    api_method = walletobjects.loyaltyclass.addmessage
    resource_id = "#{MERCHANT_ID}.#{LOYALTY_CLASS_ID}"
  when "offerclass"
    api_method = walletobjects.offerclass.addmessage
    resource_id = "#{MERCHANT_ID}.#{OFFER_CLASS_ID}"
  when "loyaltyobject"
    api_method = walletobjects.loyaltyobject.addmessage
    resource_id = "#{MERCHANT_ID}.#{LOYALTY_OBJECT_ID}"
  when "offerobject"
    api_method = walletobjects.offerobject.addmessage
    resource_id = "#{MERCHANT_ID}.#{OFFER_OBJECT_ID}"
  end
  add_message = {
    "message" => {
      "actionUri" => {
        "uri" => "http://www.google.com/drive"
      },
      "body" => "Welcome to Drive Rewards!2",
      "header" => "Welcome",
      "image" => {
        "sourceUri" => {
          "uri" => "http://www.google.com/images/icons/product/drive-128.png"
        }
      } 
    }
  }
  # Makes API Call to add message to class or object based on type received in the request
  update_result = api_client.execute(
    :api_method => api_method,
    :parameters => {'resourceId' => resource_id, 'strict' => 'true' },
    :body_object => add_message
  )
  return [
    200,
    [["Content-Type", "application/json"]],
    assemble_json_body(update_result, "")
  ]
end

private

def assemble_json_body(result, message)
  # Assemble some JSON our client-side code can work with.
  json = {}
  if result.status != 200
    json["status"] = "error"
  else
    json["status"] = "success"
  end
  json["message"] = "#{message}"
  json["response"] = ::JSON.parse(result.body)
  return ::JSON.generate(json)
end
