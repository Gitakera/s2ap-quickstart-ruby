module OfferClass
  
  def OfferClass.generate_class(issuerId, classId)
    offer_class = { 
      "kind" => "walletobjects#offerClass",
      "id" => "#{issuerId}.#{classId}",
      "version" => "1",
      "issuerName" => "Google Drive",
      "issuerData" => {
      "kind" => "walletobjects#typedValue"
      },
      "renderSpecs" => [{
        "viewName" => "g_list",
        "templateFamily" => "1.offer1_list"
      },{
        "viewName" => "g_expanded",
        "templateFamily" => "1.offer1_expanded"
      }],
      "allowMultipleUsersPerObject"=>true,
        "homepageUri" => {
        "kind" => "walletobjects#uri",
        "uri" => "http://www.google.com/drive",
        "description" => "Website"
      },
      "locations"=>[{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.442087,
        "longitude" => -122.161446
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.429379,
        "longitude" => -122.12272999999999
        },{
        "kind" => "walletobjects#latLongPoint",
        "latitude" => 37.333646,
        "longitude" => -121.884853
      }],
      "reviewStatus" => "underReview",
      "review" => {
        "comments" => "Real auto approval by system"
      },
      "title" => "20% faster upload of one file",
      "redemptionChannel" => "both",
      "provider" => "Google Drive Deals",
      "titleImage" => {
        "kind" => "walletobjects#image",
        "sourceUri" => {
          "kind" => "walletobjects#uri",
          "uri" => "http://www.google.com/images/icons/product/drive-128.png"
        }
      },
      "details" => "20% faster upload of one file"
  }
  end
end