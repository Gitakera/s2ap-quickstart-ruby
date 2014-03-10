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
      "allowMultipleUsersPerObject" => true,
      "id" => "#{issuerId}.#{classId}",
      "issuerName" => "Baconrista",
      "kind" => "walletobjects#loyaltyClass",
      "textModulesData" => [
        {
          "header" => "Rewards details",
          "body" => "\u00B0 \u00ae \u00a9 Welcome to Baconrista rewards.  Enjoy your rewards for being a loyal customer. " +
                   "10 points for every dollar spent.  Redeem your points for free coffee, bacon and more!"
        }
      ],
      "linksModuleData" => {
        "uris" => [
          {
            "kind" => "walletobjects#uri",
            "uri" => "http://maps.google.com/?q=google",
            "description" => "Nearby Locations"
          },
          {
            "kind" => "walletobjects#uri",
            "uri" => "tel:6505555555",
            "description" => "Call Customer Service"
          }
        ]
      },
      "infoModuleData" => {
        "hexFontColor" => "#F8EDC1",
        "hexBackgroundColor" => "#442905"
      },
      "imageModulesData" => [
        {
          "mainImage" => {
            "kind" => "walletobjects#image",
            "sourceUri" => {
              "kind" => "walletobjects#uri",
              "uri" => "http://farm4.staticflickr.com/3738/12440799783_3dc3c20606_b.jpg",
              "description" => "Coffee beans"
            }
          }
        }
      ],
      "messages" => [{
        "actionUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://baconrista.com"
        },
        "header" => "Welcome to Banconrista Rewards!",
        "body" => "Featuring our new bacon donuts.",
        "image" => {
          "kind" => "walletobjects#image",
          "sourceUri" => {
            "kind" => "walletobjects#uri",
            "uri" => "http://farm8.staticflickr.com/7302/11177240353_115daa5729_o.jpg"
          }
        },
        "kind" => "walletobjects#walletObjectMessage"
      }],
      "locations"=>[{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.424015499999996,
        "longitude" => -122.09259560000001
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.424354,
        "longitude" => -122.09508869999999
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.7901435,
        "longitude" => -122.39026709999997
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 40.7406578,
        "longitude" => -74.00208940000002
      }],
      "programLogo" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://farm8.staticflickr.com/7340/11177041185_a61a7f2139_o.jpg"
        }
      },
      "programName" => "Baconrista Rewards",
      "renderSpecs" => [{
        "templateFamily" => "1.loyalty_list",
        "viewName" => "g_list"
      }, {
        "templateFamily" => "1.loyalty_expanded",
        "viewName" => "g_expanded"
      }],
      "rewardsTier" => "Gold",
      "rewardsTierLabel" => "Tier",
      "reviewStatus" => "underReview",
      "version" => "1"
    }
  end
end
