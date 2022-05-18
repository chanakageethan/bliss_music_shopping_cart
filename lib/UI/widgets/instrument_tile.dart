import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/main_provider.dart';
import '../utils/app_colors.dart';
import '../utils/commonFunctions.dart';

class InstrumentTile extends StatelessWidget {
  final String productCode;
  final String imageUrl;
  final String itemId;
  final String category;

  const InstrumentTile(
      {Key? key, required this.productCode, required this.imageUrl,required this.itemId,required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        color: CommonFunctions.getColorByCategory(category),
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
                mainProvider.getIsFavorite(itemId) ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24.0,
                ):
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24.0,
                )
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
