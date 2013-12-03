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
      "issuerName" => "Baconrista",
      "kind" => "walletobjects#loyaltyClass",
      "locations"=> [{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.422601,
        "longitude" => -122.085286
      }],
      "textModulesData"=> [
        {
          "header"=> "Rewards details",
          "body"=> "Welcome to Baconrista rewards.  For every 5 coffees purchased " +
                   "you'll receive a free bacon fat latte"
        }
      ],
      "linksModuleData"=> {
        "uris"=> [
          {
            "kind"=> "walletobjects#uri",
            "uri"=> "http://www.baconrista.com/",
            "description"=> "Baconrista"
          }
        ]
      },
      "infoModuleData"=> {
        "hexFontColor"=> "#FF3300",
        "hexBackgroundColor"=> "#ABABAB"
      },
      "imageModulesData"=> [
        {
          "mainImage"=> {
            "kind"=> "walletobjects#image",
            "sourceUri"=> {
              "kind"=> "walletobjects#uri",
              "uri"=> "http://farm8.staticflickr.com/7401/11177116434_d8e600bba6_o.jpg",
              "description"=> "Coffee beans"
            }
          }
        }
      ],
      "messages"=> [{
        "actionUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://baconrista.com"
        },
        "body" => "Welcome to Banconrista Rewards!",
        "header" => "Featuring our new bacon donuts.",
        "image" => {
          "kind" => "walletobjects#image",
          "sourceUri" => {
            "kind" => "walletobjects#uri",
            "uri" => "http://farm8.staticflickr.com/7302/11177240353_115daa5729_o.jpg"
          }
        },
        "kind" => "walletobjects#walletObjectMessage"
      }],
      "programLogo" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://farm8.staticflickr.com/7340/11177041185_a61a7f2139_o.jpg"
        }
      },
      "programName" => "Baconrista Rewards",
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
