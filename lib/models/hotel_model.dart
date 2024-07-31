class Hotel{
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({ required this.imageUrl, required this.name, required this.address, required this.price});
}

final List<Hotel> hotels = [

  Hotel(imageUrl: 'assets/images/hotel0.jpg',
      name: 'Hotel 0',
      address: '44 Private Street',
      price: 150),
  Hotel(imageUrl: 'assets/images/hotel1.jpg',
      name: 'Hotel 1',
      address: '12 Rainbow Street',
      price: 200),
  Hotel(imageUrl: 'assets/images/hotel2.jpg',
      name: 'Hotel 2',
      address: '166 Classic Avenue',
      price: 300),

];