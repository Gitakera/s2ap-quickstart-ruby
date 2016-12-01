/**
 * Save to Wallet success handler
 */
var successHandler = function(params){
  console.log("Object added successfully" + params);
}

/**
 * Save to Wallet failure handler
 */
var failureHandler = function(params){
  console.log("Object insertion failed" + params);
}

/**
 * Initialization function
 */
function init(){
  document.getElementById("loyalty").addEventListener("click", function(){
    $.post("insert/loyalty", function(data){
        console.log(data);
        console.log("Status: " + data.status);
        console.log("Message: " + data.message);
        $("#result").html(data.message);
    })
  });

  document.getElementById("offer").addEventListener("click", function(){
    $.post("insert/offer", function(data){
        console.log(data);
        console.log("Status: " + data.status);
        console.log("Message: " + data.message);
        $("#result").html(data.message);
    })
  });

  /*document.getElementById("giftcard").addEventListener("click", function(){
    $.post("insert/giftcard", function(data){
        console.log(data);
        console.log("Status: " + data.status);
        console.log("Message: " + data.message);
        $("#result").html(data.message);
    })
  });*/

  $.when($.get("jwt/loyalty", function(data){
	  console.log(data);
    saveToAndroidPay = document.createElement("g:savetoandroidpay");
    saveToAndroidPay.setAttribute("jwt", data);
    saveToAndroidPay.setAttribute("onsuccess","successHandler");
    saveToAndroidPay.setAttribute("onfailure","failureHandler");
    document.querySelector("#loyaltysave").appendChild(saveToAndroidPay);}),
    $.get("jwt/offer", function(data){
    console.log(data);
    saveToAndroidPay = document.createElement("g:savetoandroidpay");
    saveToAndroidPay.setAttribute("jwt", data);
    saveToAndroidPay.setAttribute("onsuccess","successHandler");
    saveToAndroidPay.setAttribute("onfailure","failureHandler");
    document.querySelector("#offersave").appendChild(saveToAndroidPay);})/*,
    $.get("jwt/giftcard", function(data){
    console.log(data);
    saveToAndroidPay = document.createElement("g:savetoandroidpay");
    saveToAndroidPay.setAttribute("jwt", data);
    saveToAndroidPay.setAttribute("onsuccess","successHandler");
    saveToAndroidPay.setAttribute("onfailure","failureHandler");
    document.querySelector("#giftcardsave").appendChild(saveToAndroidPay);})*/).done(function(){
        script = document.createElement("script");
        script.src = "https://apis.google.com/js/plusone.js";
        document.head.appendChild(script);
    });
}


$(window).ready(function(){
  init();
});
