class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}

final List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Classic Burger',
    description:
        'A juicy beef patty with fresh lettuce, tomato, onion, and our secret sauce on a toasted bun.',
    price: 12.99,
    imageUrl:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=500&auto=format&fit=crop',
    rating: 4.9,
  ),
  Product(
    id: '2',
    name: 'Cheese Burger',
    description:
        'The classic burger with a thick slice of melted cheddar cheese and extra pickles.',
    price: 13.50,
    imageUrl:
        'https://images.unsplash.com/photo-1571091718767-18b5b1457add?q=80&w=500&auto=format&fit=crop',
    rating: 4.8,
  ),
  Product(
    id: '3',
    name: 'Bacon Burger',
    description:
        'Smoky bacon, crispy onions, and BBQ sauce top this delicious beef patty.',
    price: 15.00,
    imageUrl:
        'https://images.unsplash.com/photo-1553979459-d2229ba7433b?q=80&w=500&auto=format&fit=crop',
    rating: 4.9,
  ),
  Product(
    id: '4',
    name: 'Veggie Burger',
    description:
        'A flavorful plant-based patty with avocado, sprouts, and vegan mayo.',
    price: 11.50,
    imageUrl:
        'https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=500&auto=format&fit=crop',
    rating: 4.6,
  ),
  Product(
    id: '5',
    name: 'Double Patty Burger',
    description:
        'Two juicy beef patties, double the cheese, and all the fixings for the ultimate hunger.',
    price: 18.00,
    imageUrl:
        'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?q=80&w=500&auto=format&fit=crop',
    rating: 5.0,
  ),
];
