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
      "issuerName" => "Baconrista Coffee",
      "issuerData" => {
      "kind" => "walletobjects#typedValue"
      },
      "renderSpecs" => [{
        "viewName" => "g_list",
        "templateFamily" => "1.offer_list"
      },{
        "viewName" => "g_expanded",
        "templateFamily" => "1.offer_expanded"
      }],
      "title" => "20% off on one bacon fat latte",
      "redemptionChannel" => "both",
      "provider" => "Baconrista Deals",
      "titleImage" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://farm4.staticflickr.com/3723/11177041115_6e6a3b6f49_o.jpg"
        }
      },
      "allowMultipleUsersPerObject"=>true,
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
      "reviewStatus" => "underReview",
      "review" => {
        "comments" => "Real auto approval by system"
      },
      "textModulesData" => [
        {
          "header" => "Details",
          "body" => "20% off one cup of coffee at all Baconrista Coffee locations. " +
                    "Only one can be used per visit."
        },
        {
          "header" => "About Baconrista",
          "body" => "Since 2013, Baconrista Coffee has been committed to making high " +
                    "quality bacon coffee. Visit us in our stores or online at www.baconrista.com"
        }
      ],
      "linksModuleData" => {
        "uris" => [
          {
            "kind" => "walletobjects#uri",
            "uri" => "http://www.baconrista.com/",
            "description" => "Baconrista"
          },
          {
            "kind" => "walletobjects#uri",
            "uri" => "https://maps.google.com/?q=Google+Headquarters,+Amphitheatre+Parkway,+Mountain+View,+CA",
            "description" => "Store Location"
          }
        ]
      },
      "imageModulesData" => [
        {
          "mainImage" => {
            "kind" => "walletobjects#image",
            "sourceUri" => {
              "kind" => "walletobjects#uri",
              "uri" => "http://farm8.staticflickr.com/7401/11177116434_d8e600bba6_o.jpg",
              "description" => "Coffee beans"
            }
          }
        }
      ],
  }
  end
end
