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
module GiftCardClass
  def GiftCardClass.generate_class(issuerId, classId)
    gift_card_class = {
      "kind" => "walletobjects#giftCardClass",
      "id" => "#{issuerId}.#{classId}",
      "issuerName" => "Baconrista",
      "merchantName" => "Baconrista",
      "programLogo" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://farm8.staticflickr.com/7340/11177041185_a61a7f2139_o.jpg"
        }
      },
      "textModulesData" => [
        {
          "header" => "Where to Redeem",
          "body" => "All US gift cards are redeemable in any US and Puerto Rico" +
                    " Baconrista retail locations, or online at Baconrista.com where" +
                    " available, for merchandise or services."
        }
      ],
      "linksModuleData" => {
        "uris" => [
          {
            "kind" => "walletobjects#uri",
            "uri" => "http://www.baconrista.com/",
            "description" => "Baconrista"
          }
        ]
      },
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
      "allowMultipleUsersPerObject" => true,
      "reviewStatus" => "underReview"
    }
  end
end
