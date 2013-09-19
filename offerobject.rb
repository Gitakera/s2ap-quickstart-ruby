module OfferObject
  
  def OfferObject.generate_object(issuerId, classId, objectId)
    offer_object = {
      "kind" => "walletobjects#offerObject",
      "classId" => "#{issuerId}.#{classId}",
      "id" => "#{issuerId}.#{objectId}",
      "version" => "1",
      "state" => "active",
      "issuerData" => {
        "kind" => "walletobjects#typedValue"
      },
      "barcode" => {
        "kind" => "walletobjects#barcode",
        "type" => "upcA",
        "value" => "123456789012",
        "label" => "User Id",
        "alternateText" => "12345"
      }
    }      
  end
end