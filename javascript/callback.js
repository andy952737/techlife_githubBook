// https://eyesofkids.gitbooks.io/javascript-start-from-es6/content/part4/callback.html
// addEventListener 
 
function callback(){
     console.log('hello!')
}
const el = document.getElementById('myButton')
el.addEventListener('click', callback, false)

//
function success(data){
    console.log();
}
function failure(err) { 
  console.error(error);
}
ajax('http://sample.url', success, failure);
 
//Load event
function setup(){
	var textInput;
	textInput = document.getElementById('username');
	textInput.focus();
}
window.addEventListener('load', setup, false);
// window.addEventListener(type: DOMString, callback: EventListener, capture?: boolean)
/* event: 
	focus
	blur 
	click 
	mouse 
	load 
	mousemove 
	keyboard
	form 
	mutation
	html5
*/

