local javascriptText = [[
if (window && window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.unityControl) {
  window.Unity = {
    call: function(msg) {
      window.webkit.messageHandlers.unityControl.postMessage(msg);
    }
  }
} else {
  window.Unity = {
    call: function(msg) {
      window.location = 'unity:' + msg;
    }
  }
}


window.SBestH5GameSDK = {
  callUnityFunction : function(funcName, params){
    var data = {
        from: "SBestH5GameSDK",
        funcName: funcName,
        params: params,
    }
    Unity.call(JSON.stringify(data))
 },

  payInDiamond : function(data) {
    this.callUnityFunction('on_js_payinmiamond', data);
  },

 payInDiamondFromUnity : function(text) {
    this.payInDiamond(text)
  },


 closeGame : function(data){
    this.callUnityFunction('on_js_closegame', data);
 },
}

window.SBestH5GameTYBYSDK = window.SBestH5GameSDK

]]


return javascriptText