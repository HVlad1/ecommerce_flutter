import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:flutter/material.dart';

class GetOrderData extends StatelessWidget {
  final String documentId;
  const GetOrderData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('checkout');
    return FutureBuilder<DocumentSnapshot>(
        future: orders.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ExpansionTile(
                title: Text('Order nr. $documentId'),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.primary),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total: ${data['total']}',
                              style: const TextStyle(
                                  color: CustomColors.secondary),
                            ),
                            Text(
                              'Subtotal: ${data['subtotal']}',
                              style: const TextStyle(
                                  color: CustomColors.secondary),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              'Delivery address: ${data['customerAddress']['address']} , ${data['customerAddress']['city']}, ${data['customerAddress']['country']}',
                              style: const TextStyle(
                                  color: CustomColors.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]);
          }
          return const Text('loading');
        }));
  }
}
