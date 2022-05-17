import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class InstrumentTile extends StatelessWidget {
  final String productCode;
  final String imageUrl;

  const InstrumentTile(
      {Key? key, required this.productCode, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        // color: Colors.lightGreen,
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
      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,
      left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  productCode,
                  style: const TextStyle(
                      color: AppColors.textColorLight,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0),
                ),
               const  Spacer(),
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.height / 10,
              width:  MediaQuery.of(context).size.width / 7,
              child: Image.network(imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
