import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
class InstrumentTile extends StatelessWidget {
  final String productCode;


  const InstrumentTile({Key? key,required this.productCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
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
        children:   [
          Text(
            productCode,
            style: const TextStyle(
                color: AppColors.textColorLight,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 25.0),
          ),
          const Icon(
            Icons.heart_broken_outlined,
            color: Colors.black,
            size: 25,
          )
        ],
      ),
    );
  }
}
