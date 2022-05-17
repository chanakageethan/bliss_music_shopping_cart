import 'package:flutter/material.dart';
class CartItemTile extends StatelessWidget {
  final String model;
  final String   imageUrl;
  final double price;
  final Color  color;


  const CartItemTile({Key? key,required this.model,required this.imageUrl,required this.color,required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
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
        children:  [
          SizedBox(
            height:  MediaQuery.of(context).size.height / 10,
            width:  MediaQuery.of(context).size.width / 7,
            child: Image.network(imageUrl),
          ),
          Text(model),
        ],
      ),
    );
  }
}
