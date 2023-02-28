import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:ecommerce_flutter/screens/cart_screen/order_summary.dart';
import 'package:ecommerce_flutter/screens/order_information_screen/get_order_data.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  List<String> orderId = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('checkout')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              orderId.add(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      body: Center(
        child: Column(
          children: [
            // const OrderSummary(),
            Expanded(
                child: FutureBuilder(
                    future: getDocId(),
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


