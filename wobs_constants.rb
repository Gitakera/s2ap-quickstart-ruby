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
 * The Config file holds configuration constants for the sample JWT server
 * change these values to ones for your setup before using the sample.
 */
=end

module WalletConstants
# EDIT THIS SECTION
# ------------------------
  SERVICE_ACCOUNT_EMAIL_ADDRESS = "ServiceAccountEmail@developer.gserviceaccount.com" # Email of service account
  ISSUER_ID ="IssuerId"
  SERVICE_ACCOUNT_PRIVATE_KEY = "wobs-privatekey.p12" # Filename of the private key
  APPLICATION_NAME = "Wallet Objects Demo"
  ORIGINS = ["http://localhost:8080/"]
  LOYALTY_CLASS_ID = "LoyaltyClass"
  LOYALTY_OBJECT_ID = "LoyaltyObject"
  OFFER_CLASS_ID = "OfferClass"
  OFFER_OBJECT_ID = "OfferObject"
  SCOPES = "https://www.googleapis.com/auth/wallet_object.issuer"
# ------------------------
end






















