local javascriptText = [[
window.Unity = {
  call: function(msg) {
    window.location.href = SBestH5SDK.urlScheme + '://webgame?itentdata=' + msg
  }
}

window.SBestH5SDK = {
 callUnityFunction : function(funcName, params){
    var data = {
        from: "SBestH5SDK",
        funcName: funcName,
        params: params,
    }
    Unity.call(JSON.stringify(data))
 },

 closeView : function(data){
    this.callUnityFunction('closeView', 'closeView');
 },

 setUrlScheme : function(urlScheme){
    this.urlScheme = urlScheme
 },
}


]]


return javascriptText