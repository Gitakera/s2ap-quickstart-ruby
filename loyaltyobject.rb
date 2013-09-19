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
      "issuerData" => {
        "g_expanded" => {
          "infoModule" => {
            "row0" => {
              "col0" => {
                "label" => {
                  "string" => "Member Name"
                },
                "value" => {
                  "string" => "Joe Smith"
                }
              },
              "col1" => {
                "label" => {
                  "string" => "Next Reward In"
                },
                "value" => {
                  "int" => 2
                }
              }
            }
          }
        }
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
          "uri" => "http://google.com/drive"
        },
        "body" => "Welcome to Drive Rewards!",
        "header" => "Welcome",
        "image" => {
          "sourceUri" => {
            "uri" => "http://www.google.com/images/icons/product/drive-128.png"
          }
        }
      }],
      "state" => "active",
      "version" => 1
    }
  end
end
