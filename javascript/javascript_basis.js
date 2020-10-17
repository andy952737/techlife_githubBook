/*.Java Script基礎語法 */

//建立變數
var greeting = 'Howdy';
var message = 'please check your order:';
var wellcome = greeting + message;

//建立變數儲存名牌資訊
var sign = 'House';
var tiles = sign.length;
var subTotal = tiles * 5;

//取得具有ID屬性的元件
var el = document.getElementById('greeting');
//var el = $("#greeting");
el.textContent = wellcome;

//宣告函式
function getSize(width, height, depth){
	var area = width * height;
	var volume = width * height * depth;
	var sizes = [area, volume];
	return sizes;
}
var areaOne = getSize(3, 2, 3)[0];
var volumeOne = getSize(3, 2, 3)[1];

//宣告物件
// var hotel = {}
// var hotel = new Object();
var hotel = {
	name: 'Quay',
	rooms: 40,
	booked: 25,
	gym: ture, 
	roomTypes: ['twin', 'double', 'suite'],
	checkAvailability: function(){
		return this.rooms - this.booked;
	}
};
var hotelName = hotel.name;
var roomsFree = hotel.checkAvailability();
// var hotel = new Object(name, rooms, booked);
// hotel.name = name; 
// hotel.checkAvailability: function(){
// 	return this.name;
// }; 

//變更物件 
var hotel.name = 'Park';
var hotel['name'] = 'Park';
delete hotel.name;  
hotel.name = '';

//this應用
var shape {
	width: 600,
	height: 400,
	getArea: function(){
		return this.width * this.height;
	}
};

//array陣列
var hotels = ['Quay', 'Park']
hotel[1]; //  => Park

//全域物件 string物件
length 
toUpperCase()
toLowerCase()
charAt(pos: int)
indexOf(searchString: string, position?: int)
lastIndexOf(searchString: string, position?: int)
substring(start: int, end: int)
split(separator: string, limit: int)
trim()
replace(searchValue: string, replaceValue: string)

//建立亂數
Math.PI;
Math.round(x: number)
Math.sqrt(x: number)
Math.ceil(x: number)
Math.floor(x: number)
Math.random()

//時間
var today new Date();
getDate()
getDay()
getFullYear()
getHours()
getMilliseconds()
getMinutes()
getMonth()
getSeconds()
getTime()
getTimezoneOffset()
toDateString()
toString(radix?: int)

//決策與迴圈
if (score > 50) {
	document.write('You passed!');
} else if (score > 100) {
	document.write('100!');
} else {
	document.write('Try again...');
}

var msg;
var level = 2;
switch (leve) {
	case 1:
		msg = 'Good luck on the first test';
		break;
	default:
		// statements_def
		break;
}

// 初始化, 條件, 更新
for (var i = Things.length - 1; i >= 0; i--) {
	Things[i]
} 

var i = 1;
var msg = '';
do{
	msg 
	i++;
} while (i < 1);
document.getElementById('answer').innerHTML = msg;

while (i < 11) {
	// statement
	i++;
}
document.getElementById('answer').innerHTML = msg;

//存取元件
getElementById('id');
getElementsByTagName('li');
getElementsByClassName('class');
querySelector('li.hot');
querySelectorAll('li.hot');

//建立及變更屬性
var firstItem = document.getElementById('one');
firstItem.className = 'complete';

var fourthItem = document.getElementsByTagName('li').item(3);
fourthItem.setAttribute('class', 'cool');

//移除屬性
var firstItem = document.getElementById('one');
if (firstItem.hasAttribute('class')){
	firstItem.removeAttribute('class');
}

//XSS標籤元件的字元跳脫與管控
//Javascript
//可使用 
//textContent 或 innerText
//不可使用
//innerHTML

//jQuery
//可使用
//.text();
//不可使用
//.html();

//









