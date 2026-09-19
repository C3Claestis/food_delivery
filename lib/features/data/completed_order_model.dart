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