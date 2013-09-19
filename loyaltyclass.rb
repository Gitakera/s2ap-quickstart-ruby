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
module LoyaltyClass
  
  def LoyaltyClass.generate_class(issuerId, classId)
    loyalty_class = { 
      "accountIdLabel" => "Member Id",
      "accountNameLabel" => "Member Name",
      "allowMultipleUsersPerObject"=> true,
      "homepageUri" => {
        "kind" => "walletobjects#uri",
        "uri" => "https://www.example.com"
      },
      "id" => "#{issuerId}.#{classId}",
      "issuerData" => {
        "g_expanded" => {
          "textModule" => {
            "header" => {
              "string" => "Rewards details"
            },
            "body" => {
              "string" => "Welcome to Drive rewards.  For every 5 files uploaded you'll receive a free byte of space"
            }
          },
          "linksModule" => {
            "uri0" => {
              "uri" => {
                "kind" => "walletobjects#uri",
                "uri" => "http://www.google.com/drive",
                "description" => "Google Drive"
              }
            }
          },
          "infoModule" => {
            "fontColor" => {
              "string" => "#FF3300"
            },
            "backgroundColor" => {
              "string" => "#ABABAB"
            },
            "row0" => {
              "col0" => {
                "label" => {
                  "string" => "Label 0"
                },
                "value" => {
                  "string" => "Value 0"
                }
              },
              "col1" => {
                "label" => {
                  "string" => "Label 1"
                },
                "value" => {
                  "string" => "Value1"
                }
              }
            },
            "row1" => {
              "col0" => {
                "label" => {
                  "string" => "Label 0"
                },
                "value" => {
                  "string" => "Value 0"
                }
              },
              "col1" => {
                "label" => {
                  "string" => "Label 1"
                },
                "value" => {
                  "string" => "Value1"
                }
              }
            }
          }
        }
      },
      "issuerName" => "Google Drive",
      "kind" => "walletobjects#loyaltyClass",
      "locations"=> [{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.422601,
        "longitude" => -122.085286
      }],
      "messages"=> [{
        "actionUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://www.google.com/drive"
        },
        "body" => "Welcome to Drive Rewards!",
        "header" => "Welcome",
        "image" => {
          "kind" => "walletobjects#image",
          "sourceUri" => {
            "kind" => "walletobjects#uri",
            "uri" => "http://www.google.com/images/icons/product/drive-128.png"
          }
        },
        "kind" => "walletobjects#walletObjectMessage"
      }],
      "programLogo" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://www.google.com/images/icons/product/drive-128.png"
        }
      },
      "programName" => "Drive Rewards",
      "renderSpecs"=> [{
        "templateFamily" => "1.loyaltyCard1_list",
        "viewName" => "g_list"
      }, {
        "templateFamily" => "1.loyaltyCard1_expanded",
        "viewName" => "g_expanded"
      }],
      "rewardsTier" => "Gold",
      "rewardsTierLabel" => "Tier",
      "reviewStatus" => "underReview",
      "version" => "1"
    }
  end
end
