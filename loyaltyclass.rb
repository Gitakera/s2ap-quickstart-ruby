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