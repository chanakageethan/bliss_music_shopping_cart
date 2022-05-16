import 'package:flutter/material.dart';
class CategoryTile extends StatelessWidget {
  final String categoryName;
  final Widget  icon;
  final Color  color;


  const CategoryTile({Key? key,required this.categoryName,required this.icon,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width / 3.5,
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
          icon,
          Text(categoryName),
        ],
      ),
    );
  }
}
