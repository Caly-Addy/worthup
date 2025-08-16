import 'package:flutter/material.dart';
import 'coconut_husk_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/coconut_husk.jpg',
      'name': 'Coconut Husk',
      'price': 'GHC 30 per bag',
      'qty': '5 bags',
      'favorite': false,
    },
    {
      'image': 'assets/images/rice_straw.jpg',
      'name': 'Rice Straw',
      'price': 'GHC 50 per bundle',
      'qty': '3 bundles',
      'favorite': true,
    },
    {
      'image': 'assets/images/palm_kernel.jpg',
      'name': 'Palm Kernel',
      'price': 'GHC 100 per stack',
      'qty': '10 stacks',
      'favorite': false,
    },
    {
      'image': 'assets/images/dried_corn_cobs.jpg',
      'name': 'Dried Corn Cobs',
      'price': 'GHC 25 per crate',
      'qty': '4 crates',
      'favorite': false,
    },
  ];

  Color mainGreen = const Color(0xFF4F7942);
  Color cardBg = const Color(0xFFF7F7F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(Icons.person, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Welcome back 👋',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F3E7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Color(0xFF4F7942),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                product['image'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 14.0,
                                horizontal: 0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product['price'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Qty: ${product['qty']}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  product['favorite']
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: product['favorite']
                                      ? Colors.red
                                      : Colors.black54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    products[index]['favorite'] =
                                        !products[index]['favorite'];
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 12.0,
                                  bottom: 8.0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (product['name'] == 'Coconut Husk') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CoconutHuskDetailsPage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                      color: mainGreen,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
