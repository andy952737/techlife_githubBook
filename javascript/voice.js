
function Voice(){
  var _this = this;
  var handlers = {};
  function controller(){
      _this.startCall = startCall;
      _this.on = on;
  }
  function startCall(){
    setTimeout(function(){ handlers.connected()}, 5000)
  }
  function on(event, handler){
     handlers[event] = handler;
  }
  controller();  
}

function parent(){
    v = new Voice;
    v.on("connected", function(){
      alert("success")
    })
    v.startCall()
}