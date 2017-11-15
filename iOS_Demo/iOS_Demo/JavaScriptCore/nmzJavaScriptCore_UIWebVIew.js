'use strict';

var uiAddParagraph = function() {
    var para=document.createElement("p");
    var node=document.createTextNode("New Paragraph");
    para.appendChild(node);

    document.getElementById("div_1").appendChild(para);
};

var uiChangeColorToBlue = function() {
    uiCallNativeMethod.uiNativeChangeColorToBlue();
};

var uiChangeColorToRed = function() {
    uiCallNativeMethod.uiNativeChangeColorToRed();
};

var uiAlert = function() {
    alert("UIWebView Alert");
};
