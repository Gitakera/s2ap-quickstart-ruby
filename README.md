Setup the Ruby JWT Server using Sinatra
------------------------------------------------

Prerequisites:
-------------
1. You have a merchant id and a seller secret hereby referred to as MERCHANT_ID, MERCHANT_SECRET  (also known as seller secret)
2. You have already registered a Client ID for installed applications (https://code.google.com/apis/console/) and have the Client Id and the certificate fingerprint handy. They will be referred to in this README as CLIENT_EMAIL and KEYFILE respectively.


Getting Started
----------------
1. Install Ruby 1.9.3 or later
2. Install the following gems
   gem install google-api-client
   gem install json
   gem install sinatra
   gem install jwt
3. Download or clone the source from Github (https://github.com/googlewallet/walletobjects-quickstart-ruby) in any folder from where you will run the server

Set up the Project
------------------
1. Change the wobs_constants.rb values, here all the constants are self explanatory.
2. Run the server with "ruby wobs_server.rb -p 8080" command
3. Navigate your web browser to http://localhost:8080/ to view the sample application running
