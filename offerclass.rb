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
module OfferClass
  
  def OfferClass.generate_class(issuerId, classId)
    offer_class = { 
      "kind" => "walletobjects#offerClass",
      "id" => "#{issuerId}.#{classId}",
      "version" => "1",
      "issuerName" => "Google Drive",
      "issuerData" => {
      "kind" => "walletobjects#typedValue"
      },
      "renderSpecs" => [{
        "viewName" => "g_list",
        "templateFamily" => "1.offer1_list"
      },{
        "viewName" => "g_expanded",
        "templateFamily" => "1.offer1_expanded"
      }],
      "allowMultipleUsersPerObject"=>true,
        "homepageUri" => {
        "kind" => "walletobjects#uri",
        "uri" => "http://www.google.com/drive",
        "description" => "Website"
      },
      "locations"=>[{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.442087,
        "longitude" => -122.161446
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.429379,
        "longitude" => -122.12272999999999
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.333646,
        "longitude" => -121.884853
      }],
      "reviewStatus" => "underReview",
      "review" => {
        "comments" => "Real auto approval by system"
      },
      "title" => "20% faster upload of one file",
      "redemptionChannel" => "both",
      "provider" => "Google Drive Deals",
      "titleImage" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://www.google.com/images/icons/product/drive-128.png"
        }
      },
      "details" => "20% faster upload of one file"
  }
  end
end
