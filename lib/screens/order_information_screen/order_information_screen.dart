import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/repo/firestore_methods.dart';
import 'package:ecommerce_flutter/screens/order_information_screen/get_order_data.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  List<String> orderId = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: FirestoreDataService().getDocId(orderId),
                    builder: ((context, snapshot) {
                      return ListView.builder(
                          itemCount: orderId.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: GetOrderData(documentId: orderId[index]),
                            );
                          });
                    })))
          ],
        ),
      ),
    );
  }
}
