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
module LoyaltyObject
  
  def LoyaltyObject.generate_object(issuerId, classId, objectId)
    loyalty_object = {
      "accountId" => "1234567890",
      "accountName" => "John Smith",
      "barcode" => {
        "alternateText" => "12345",
        "label" => "User Id",
        "type" => "qrCode",
        "value" => "28343E3"
      },
      "classId" => "#{issuerId}.#{classId}",
      "id" => "#{issuerId}.#{objectId}",
      "textModuleDatas"=> [{
        "header"=> "Rewards details textModuleDatas",
        "body"=> "Welcome to Baconrista rewards. For every 5 " +
                  "coffees purchased you\"ll receive a free " +
                  "bacon fat latte. "
      }],
      "linksModuleData"=> {
        "uris"=> [
          {
            "kind"=> "walletobjects#uri",
            "uri"=> "http://www.example.com",
            "description"=> "Example"
          },
          {
            "kind"=> "walletobjects#uri",
            "uri"=> "http://www.example2.com",
            "description"=> "Example2"
          }]
      },
      "infoModuleData"=> {
        "hexFontColor"=> "#e7e12f",
        "hexBackgroundColor"=> "#b41515",
        "labelValueRows"=> [{            
            "columns"=> [{     
              "label"=> "Member Name",
              "value"=> "John Smith"
          }, {                    
            "label"=> "Next Reward in",
            "value"=> "2 coffees"
          }]
        }, {                    
            "columns"=> [{     
              "label"=> "Label 2",
              "value"=> "Value 2"
            }, {                  
              "label"=> "Label 3",
              "value"=> "Value 3"
            }]
        }],
        "showLastUpdateTime"=> "true" 
      },
      "loyaltyPoints" => {
        "balance" => {
          "string" => "500"
        },
        "label" => "Points",
          "pointsType" => "rewards"
      },
      "messages" => [{
        "actionUri" => {
          "uri" => "http://baconrista.com"
        },
        "body" => "Welcome to Baconrista Rewards!",
        "header" => "Welcome",
        "image" => {
          "sourceUri" => {
            "uri" => "http://www.google.com/landing/chrome/ugc/chrome-icon.jpg"
          }
        }
      }],
      "state" => "active",
      "version" => 1
    }
  end
end
