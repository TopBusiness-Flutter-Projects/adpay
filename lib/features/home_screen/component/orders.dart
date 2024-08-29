import 'package:flutter/cupertino.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

import 'custom_network_image.dart';
class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  bool showNewOrders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الطلبات'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showNewOrders = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: showNewOrders ? Colors.orange : Colors.grey,
                ),
                child: Text('الطلبات الجديدة'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showNewOrders = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !showNewOrders ? Colors.orange : Colors.grey,
                ),
                child: Text('الطلبات المكتملة'),
              ),
            ],
          ),
          Expanded(
            child: showNewOrders
                ? ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return OrderCard();
              },
            )
                : Center(
              child: Text('لا توجد طلبات مكتملة'),
            ),
          ),
        ],
      ),
    );

  }
}


class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('#4984200'),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('03:23 Pm'),
                Icon(Icons.access_time),
                Text('03/03/2024'),
                Icon(Icons.calendar_today),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('< التفاصيل'),
                Row(
                  children: [
                    Text('600 ريال،'),
                    SizedBox(width: 4),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}