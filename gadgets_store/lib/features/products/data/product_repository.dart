import '../domain/product.dart';

class ProductRepository {
  List<Product> getMockProducts() {
    return [
      Product(
        id: '1',
        name: 'iPhone 15 Pro',
        description:
            'Titanium design, A17 Pro chip, and advanced camera system.',
        price: 999.0,
        imageUrl:
            'https://images.unsplash.com/photo-1695048133142-1a20484d2569?q=80&w=500',
        category: 'Mobiles',
      ),
      Product(
        id: '2',
        name: 'Sony WH-1000XM5',
        description:
            'Industry-leading noise canceling with dual processor control.',
        price: 349.0,
        imageUrl:
            'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?q=80&w=500',
        category: 'Accessories',
      ),
      Product(
        id: '3',
        name: 'MacBook Air M3',
        description: 'Supercharged by M3 chip, incredibly thin and fast.',
        price: 1299.0,
        imageUrl:
            'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=500',
        category: 'Laptops',
      ),
      Product(
        id: '4',
        name: 'Apple Watch Ultra 2',
        description: 'The most rugged and capable Apple Watch ever.',
        price: 799.0,
        imageUrl:
            'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=500',
        category: 'Smart Gadgets',
      ),
      Product(
        id: '5',
        name: 'Samsung S24 Ultra',
        description: 'The ultimate Galaxy AI experience with a 200MP camera.',
        price: 1199.0,
        imageUrl:
            'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?q=80&w=500',
        category: 'Mobiles',
      ),
      Product(
        id: '6',
        name: 'Logitech MX Master 3S',
        description:
            'An iconic mouse remastered for ultimate precision and flow.',
        price: 99.0,
        imageUrl:
            'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?q=80&w=500',
        category: 'Accessories',
      ),
      Product(
        id: '7',
        name: 'Dell XPS 15',
        description:
            'Stunning 4K OLED display with powerful performance for creators.',
        price: 1899.0,
        imageUrl:
            'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?q=80&w=500',
        category: 'Laptops',
      ),
      Product(
        id: '8',
        name: 'Oculus Quest 3',
        description:
            'Mixed reality starts here. Dive into extraordinary experiences.',
        price: 499.0,
        imageUrl:
            'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=500',
        category: 'Smart Gadgets',
      ),
      Product(
        id: '9',
        name: 'Keychron K2 Keyboard',
        description: 'Mechanical keyboard for productivity and gaming.',
        price: 89.0,
        imageUrl:
            'https://images.unsplash.com/photo-1595225405013-98993546f797?q=80&w=500',
        category: 'Accessories',
      ),
      Product(
        id: '10',
        name: 'Google Pixel 8 Pro',
        description:
            'The all-pro phone engineered by Google with AI at its core.',
        price: 899.0,
        imageUrl:
            'https://images.unsplash.com/photo-1598327105666-5b89351aff97?q=80&w=500',
        category: 'Mobiles',
      ),
    ];
  }
}
