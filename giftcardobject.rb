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
module GiftCardObject
 def GiftCardObject.generate_object(issuerId, classId, objectId)
    gift_card_object = {
      "kind" => "walletobjects#giftCardObject",
      "classId" => "#{issuerId}.#{classId}",
      "id" => "#{issuerId}.#{objectId}",
      "cardNumber" => "123jkl4889",
      "pin" => "1111",
      "eventNumber" => "123456",
      "balance" => {
        "kind" => "walletobjects#money",
        "micros" => 20000000,
        "currencyCode" => "USD"
      },
      "balanceUpdateTime" => {
        "date" => Time.now.utc.strftime('%FT%H:%M:%S.%LZ')
      },
      "barcode" => {
        "alternateText" => "12345",
        "label" => "Gift Card Id",
        "type" => "qrCode",
        "value" => "28343E3"
      },
      "textModulesData" => [{
        "header" => "Earn double points",
        "body" => "Jane, don't forget to use your Baconrista Rewards when " +
                  "paying with this gift card to earn additional points"
      }],
      "linksModuleData" => {
        "uris" => [
          {
            "kind" => "walletobjects#uri",
            "uri" => "http://www.baconrista.com/mybalance?id=1234567890",
            "description" => "My Baconrista Gift Card Purchases"
          }]
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
      "version" => "1"
    }
  end
end
