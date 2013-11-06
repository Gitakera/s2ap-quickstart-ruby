wallet-objects-quickstart-ruby
==============================

This sample demonstrates integration of the basic components of the Wallet Objects API.  Review the [quickstart guide](https://developers.google.com/commerce/wallet/objects/quickstart-rubyd) to run the sample.

This sample showcases several aspects of the API
* Creation of Wallet Classes and Wallet Objects
* Save to Wallet insertion of classes and objects
* The Web Service API

##Creation of Wallet Classes and Wallet Objects
The code for creation of classes and objects can be found in loyaltyclass.rb, loyaltyobject.rb, offerclass.rb, offerobject.rb.  Each Wallet Object type, such as loyalty, is broken out into its own file.  Classes are inserted using the wobs-server.rb.

## Save to Wallet insertion of classes and objects
Save to Wallet is handled on both the client and server.  The index.html file is the landing page for the application and includes app.js.  The app.js file makes a request to the /jwt path to generate Wallet Object type-specific JWTs. The app.js file inserts the appropriate g:wallet tags and the Save to Wallet JavaScript after all of the JWTs are generated.  The JavaScript must be appended after the g:wallet tags because it parses the page to render Save to Wallet buttons when it's completed loading.

## Webservice API
The Webservice API handler is /webservice.  This path handles Webservice requests, generates Loyalty Objects, converts Loyalty Objects to JWTs, and responds with the JWT.  You can configure your discoverable to point to the URL handled by /webservice.
