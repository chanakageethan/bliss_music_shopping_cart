import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/cart_provider.dart';
import '../../models/instrument.dart';
import '../utils/app_colors.dart';

class CartItemTile extends StatelessWidget {
  final String model;
  final String imageUrl;
  final double price;
  final Color color;
  final String id;

  const CartItemTile(
      {Key? key,
      required this.model,
      required this.imageUrl,
      required this.color,
      required this.price,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 50,
              maxWidth: 50,
              maxHeight: 50,
            ),
            child: Image.network(imageUrl, height: 50, fit: BoxFit.cover),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0),
              ),
              Text(
                price.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              GestureDetector(
                onTap: () => _removeItem(context),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _removeItem(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: false);

    provider.removeItemFromCart(id, price);
  }
}
