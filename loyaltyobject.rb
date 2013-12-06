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
      "accountName" => "Jane Doe",
      "barcode" => {
        "alternateText" => "12345",
        "label" => "User Id",
        "type" => "qrCode",
        "value" => "28343E3"
      },
      "classId" => "#{issuerId}.#{classId}",
      "id" => "#{issuerId}.#{objectId}",
      "textModulesData" => [{
        "header" => "Jane's Baconrista Rewards",
        "body" => "You are 5 coffees away from receiving a free " +
                  "bacon fat latte"
      }],
      "linksModuleData" => {
        "uris" => [
          {
            "kind" => "walletobjects#uri",
            "uri" => "http://www.baconrista.com/myaccount?id=1234567890",
            "description" => "My Baconrista Account"
          }]
      },
      "infoModuleData" => {
        "hexFontColor" => "#FFFFFF",
        "hexBackgroundColor" => "#FC058C",
        "labelValueRows" => [{
          "hexFontColor" => "#000000",
          "hexBackgroundColor" => "#BBCCFC",
          "columns" => [{
            "label" => "Member Name",
            "value" => "Jane Doe"
          }, {
            "label" => "Membership #",
            "value" => "1234567890"
          }]
        }, {
          "hexFontColor" => "#EDEDDD",
          "hexBackgroundColor" => "#FFFB00",
          "columns" => [{
            "label" => "Next Reward in",
            "value" => "2 coffees"
          }, {
            "label" => "Member Since",
            "value" => "01/15/2013"
          }]
        }],
        "showLastUpdateTime" => "true"
      },
      "loyaltyPoints" => {
        "balance" => {
          "string" => "500"
        },
        "label" => "Points",
          "pointsType" => "points"
      },
      "messages" => [{
        "actionUri" => {
          "uri" => "http://baconrista.com"
        },
        "header" => "Jane, welcome to Banconrista Rewards!",
        "body" => "Thanks for joining our program. Show this message to " +
                  "our barista for your first free coffee on us!",
        "image" => {
          "sourceUri" => {
            "uri" => "http://farm4.staticflickr.com/3723/11177041115_6e6a3b6f49_o.jpg"
          }
        }
      }],
      "state" => "active",
      "version" => 1
    }
  end
end
