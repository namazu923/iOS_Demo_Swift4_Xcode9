'use strict';

var wkAddParagraph = function() {
    var para=document.createElement("p");
    var node=document.createTextNode("New Paragraph");
    para.appendChild(node);
    
    document.getElementById("div_1").appendChild(para);
};

var wkChangeColorToBlue = function() {
    var message = {
        'method' : 'wkNativeChangeColorToBlue',
        'param_1' : 'nil',
    };
    window.webkit.messageHandlers.wkCallNativeMethod.postMessage(message);
};

var wkChangeColorToRed = function() {
    var message = {
        'method' : 'wkNativeChangeColorToRed',
        'param_1' : 'nil',
    };
    window.webkit.messageHandlers.wkCallNativeMethod.postMessage(message);
};

var wkAlert = function() {
    alert("WKWebView Alert");
};
