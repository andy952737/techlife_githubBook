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

