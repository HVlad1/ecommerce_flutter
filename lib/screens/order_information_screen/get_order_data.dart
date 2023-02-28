import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetOrderData extends StatelessWidget {
  final String documentId;
  const GetOrderData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference orders = FirebaseFirestore.instance.collection('checkout');
    return FutureBuilder<DocumentSnapshot>(
      future: orders.doc(documentId).get(),
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          // return Column(children: [
          //   Text('Customer name: ${data['customerName']}'),
          //   Text('Customer email: ${data['customerEmail']}'),
          // ],);
          return ExpansionTile(
            title: Text('Order nr. $documentId'),
            children: [Container(
              color: Colors.red,
              child: ListTile(
                title: Text('Total: ${data['total']}'),
                subtitle: Text('Subtotal: ${data['subtotal']}'),
                ),
            ),
          ]);
        }
        return const Text('loading');
      }
    ));
  }
}
