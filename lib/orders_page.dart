import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int selectedTab = 0; // 0: Pending, 1: Delivered

  final List<Map<String, String>> pendingOrders = [
    {
      'image': 'assets/images/coconut_husk.jpg',
      'name': 'Coconut Husk',
      'price': 'GHC 30 per bag',
      'qty': '2 bags',
      'date': '23rd May, 2025',
    },
    {
      'image': 'assets/images/rice_straw.jpg',
      'name': 'Rice Straw',
      'price': 'GHC 50 per bundle',
      'qty': '1 bundle',
      'date': '17th June, 2025',
    },
  ];

  final List<Map<String, String>> deliveredOrders = [
    {
      'image': 'assets/images/dried_corn_cobs.jpg',
      'name': 'Dried Corn Cobs',
      'price': 'GHC 25 per crate',
      'qty': '1 crate',
      'date': '2nd March, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Color mainGreen = const Color(0xFF4F7942);
    Color inactiveBg = const Color(0xFFF3F3F3);
    Color cardBg = const Color(0xFFF7F7F7);

    List<Map<String, String>> orders = selectedTab == 0
        ? pendingOrders
        : deliveredOrders;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Orders',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: selectedTab == 0 ? mainGreen : inactiveBg,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Pending',
                          style: TextStyle(
                            color: selectedTab == 0 ? Colors.white : mainGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: selectedTab == 1 ? mainGreen : inactiveBg,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Delivered',
                          style: TextStyle(
                            color: selectedTab == 1 ? Colors.white : mainGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: orders.isEmpty
                    ? Center(
                        child: Text(
                          selectedTab == 0
                              ? 'No pending orders.'
                              : 'No delivered orders.',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: orders.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 18),
                        itemBuilder: (context, index) {
                          final order = orders[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 8,
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
                                      order['image']!,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          order['name']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          order['price']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Quantity: ${order['qty']}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          selectedTab == 0
                                              ? 'Ordered: ${order['date']}'
                                              : 'Delivered: ${order['date']}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
