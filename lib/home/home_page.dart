import 'dart:developer';
import 'dart:math' as math;

import 'package:dashboard_ecommerce_app/home/fakedata.dart';
import 'package:dashboard_ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  final SupabaseClient supabaseClient;
  const HomePage({super.key, required this.supabaseClient});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bags> bags = productBags;
  List<Shoes> shose = productShoes;
  List<Clothes> clothes = productClothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              try {
                for (var i = 0; i < shose.length; i++) {
                  final imageUrl = widget.supabaseClient.storage
                      .from('storShose')
                      .getPublicUrl('Shoes ${i + 1}.png');

                  final bag = Bags(
                    productId: const Uuid().v4(),
                    productName: 'Shoes ${i + 1}',
                    productImage: imageUrl,
                    price: math.Random().nextInt(1000).toDouble(),
                    productDescription: 'Description ${i + 1}',
                  );
                  await widget.supabaseClient
                      .from('shoes')
                      .insert(bag.toJson());
                }
              } on PostgrestException catch (e) {
                log(e.toString());
              }
            },
            child: const Text('Uplode'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final response =
                    await widget.supabaseClient.from('shoes').select();

                setState(() {
                  bags = response.map((e) {
                    return Bags(
                      productId: e['productId'],
                      productName: e['productName'],
                      productImage: e['productImage'],
                      price: e['price'],
                      productDescription: e['productDescription'],
                    );
                  }).toList();
                });
              } on PostgrestException catch (e) {
                log(e.toString());
              }
            },
            child: const Text('Get Data'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bags.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(bags[index].productImage),
            ),
            title: Text(bags[index].productName),
            subtitle: Text(bags[index].productDescription),
            trailing: Text('\$${bags[index].price}'),
          );
        },
      ),
    );
  }
}
