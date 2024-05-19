import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

class Hayaa extends StatelessWidget {
  const Hayaa({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text('السلة'),
      ),
      body: Column(
        children: [
          ProductCard(
            title: 'صندوق كبير',
            price: 200,
            quantities: [2, 1],
          ),
          ProductCard(
            title: 'صندوق كبير',
            price: 300,
            quantities: [2, 1],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('إكمال الطلب'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('الغاء'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    //   Scaffold(
    //     body: Center(
    //       child: Container(
    //         padding: EdgeInsets.all(16.0),
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(8.0),
    //           border: Border.all(
    //             color: Colors.pink,
    //             width: 2.0,
    //           ),
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                   'صندوق كبير',
    //                   style: TextStyle(
    //                     fontSize: 18.0,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Row(
    //                   children: [
    //                     Icon(
    //                       Icons.shopping_cart,
    //                       color: Colors.red,
    //                     ),
    //                     Text(
    //                       '300',
    //                       style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: 8.0),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: [
    //                     Icon(
    //                       Icons.shopping_cart,
    //                       color: Colors.red,
    //                     ),
    //                     SizedBox(width: 8.0),
    //                     Text(
    //                       '200',
    //                       style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     SizedBox(width: 16.0),
    //                     Container(
    //                       width: 50.0,
    //                       height: 30.0,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(4.0),
    //                         border: Border.all(
    //                           color: Colors.grey,
    //                           width: 1.0,
    //                         ),
    //                       ),
    //                       child: Center(
    //                         child: Text(
    //                           '2',
    //                           style: TextStyle(
    //                             fontSize: 16.0,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     Icon(
    //                       Icons.shopping_cart,
    //                       color: Colors.red,
    //                     ),
    //                     SizedBox(width: 8.0),
    //                     Text(
    //                       '100',
    //                       style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     SizedBox(width: 16.0),
    //                     Container(
    //                       width: 50.0,
    //                       height: 30.0,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(4.0),
    //                         border: Border.all(
    //                           color: Colors.grey,
    //                           width: 1.0,
    //                         ),
    //                       ),
    //                       child: Center(
    //                         child: Text(
    //                           '1',
    //                           style: TextStyle(
    //                             fontSize: 16.0,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

  }
}
class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final List<int> quantities;

  ProductCard({
    required this.title,
    required this.price,
    required this.quantities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'د.ب ${price.toString()}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityInput(quantity: quantities[0]),
                QuantityInput(quantity: quantities[1]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityInput extends StatelessWidget {
  final int quantity;

  QuantityInput({required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.shopping_cart),
        SizedBox(width: 8.0),
        Text(quantity.toString()),
      ],
    );
  }
}
