local javascriptText = [[
window.Unity = {
  call: function(msg) {
    window.location.href = SBestH5GameSDK.urlScheme + '://webgame?itentdata=' + msg
  }
}


window.SBestH5GameSDK = {
  urlScheme : null,

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
    this.callUnityFunction('on_js_closegame', 'closeGame');
 },

 setUrlScheme : function(urlScheme){
    this.urlScheme = urlScheme
 },
}

window.SBestH5GameTYBYSDK = window.SBestH5GameSDK

]]


return javascriptText