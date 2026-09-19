class OrderItem {
  final String path;
  final String name;
  final double price;
  final String date;
  final int items;

  OrderItem({
    required this.path,
    required this.name,
    required this.price,
    required this.date,
    required this.items,
  });
}

// Dummy List (Data Sementara)
final List<OrderItem> mockActiveOrders = [
  OrderItem(
    path: 'assets/images/burger.png',
    name: "Classic Beef Cheese Burger",
    price: 42.50,
    date: "18 Sep, 07:30 pm",
    items: 1,
  ),
  OrderItem(
    path: 'assets/images/chicken_curry.png',
    name: "Creamy Spaghetti Carbonara",
    price: 65.00,
    date: "17 Sep, 01:15 pm",
    items: 2,
  ),
  OrderItem(
    path: 'assets/images/esteh.jpg',
    name: "Iced Matcha Oat Latte",
    price: 18.50,
    date: "15 Sep, 10:45 am",
    items: 3,
  ),
  OrderItem(
    path: 'assets/images/sate_barat.png',
    name: "Grilled Salmon Steak",
    price: 88.90,
    date: "12 Sep, 08:00 pm",
    items: 1,
  ),
  OrderItem(
    path: 'assets/images/kopimewah.jpg',
    name: "Glazed Chocolate Donut",
    price: 12.00,
    date: "10 Sep, 03:20 pm",
    items: 4,
  ),
  OrderItem(
    path: 'assets/images/sirupjeruk.jpg',
    name: "Lemon Egg Toast",
    price: 24.75,
    date: "05 Sep, 09:10 am",
    items: 2,
  ),
];

// Dummy List (Data Sementara)
final List<OrderItem> mockCompletedOrders = [
  OrderItem(
    path: 'assets/images/cantelli.jpg',
    name: "Cantelli Da Lopez",
    price: 50.00,
    date: "29 Nov, 01:20 pm",
    items: 2,
  ),
  OrderItem(
    path: 'assets/images/bean_burger.png',
    name: "Bean and Vegetable Burger",
    price: 35.50,
    date: "10 Nov, 06:05 pm",
    items: 1,
  ),
    OrderItem(
    path: 'assets/images/bogdan_ghita.jpg',
    name: "Bogdan Ghita",
    price: 8.00,
    date: "28 Nov, 08:45 pm",
    items: 1,
  ),
    OrderItem(
    path: 'assets/images/coffe_latte.png',
    name: "Coffe Latte",
    price: 29.39,
    date: "8 Mar, 02:15 pm",
    items: 1,
  ),
    OrderItem(
    path: 'assets/images/chicken_curry.png',
    name: "Butter Chicken Curry",
    price: 30.00,
    date: "12 Jun, 10:00 pm",
    items: 1,
  ),
    OrderItem(
    path: 'assets/images/strawberry_cheesecake.png',
    name: "Strawberry Cheesecake",
    price: 28.12,
    date: "29 Feb, 11:02 pm",
    items: 1,
  ),
];