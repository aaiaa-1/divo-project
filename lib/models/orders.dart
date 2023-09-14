class Product {
  final int id, price;
  final String title, deliveryPerson, image, date;
  final String? description; // Add a nullable description property

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.deliveryPerson,
    required this.image,
    required this.date,
    this.description,
  });
}

// List of products
// Only for now that we have static data
List<Product> products = [
  Product(
    id: 1,
    price: 56,
    title: "Big Tasty Best Off",
    deliveryPerson: "John Snow",
    image: "assets/images/Item_1.jpeg",
    date: "2015-07-01 17:36:29",
  ),
  Product(
    id: 2,
    price: 68,
    title: "McChicken  Best Off",
    deliveryPerson: "Daaenarys Targaryan",
    image: "assets/images/Item_2.jpeg",
    date: "2023-09-07 10:30:00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 3,
    price: 39,
    title: "Mc Wrap miel Best Off",
    deliveryPerson: "Arya Stark ",
    image: "assets/images/Item_3.jpeg",
    date: "2023-09-07 14:15:00",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
