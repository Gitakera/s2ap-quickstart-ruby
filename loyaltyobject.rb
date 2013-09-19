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