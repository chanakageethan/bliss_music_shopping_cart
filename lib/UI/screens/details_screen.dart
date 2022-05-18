import 'package:bliss_music_shopping_cart/UI/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/cart_provider.dart';
import '../../models/instrument.dart';
import '../utils/commonFunctions.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/primary_button.dart';
import 'cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Instrument instrument;

  const DetailsScreen({Key? key, required this.instrument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body(context)),
      appBar: CustomAppBar(
        isBackButtonNeeded: true,
        color: CommonFunctions.getColorByCategory(instrument.category),
        itemId: instrument.id,
      ),
    );
  }

  Widget body(BuildContext context) => SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              color: CommonFunctions.getColorByCategory(instrument.category),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.network(instrument.image),
                  ),
                ],
              ),
            ),
            //

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.6,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white
                    // color: Colors.white,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: const Text(
                        "Most Popular",
                        style: TextStyle(
                            color: AppColors.textColorLight,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Brand",
                                style: TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              const Text(
                                "Price",
                                style: TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              const Text(
                                "Color",
                                style: TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              const Text(
                                "Weight",
                                style: TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                instrument.brand,
                                style: const TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                instrument.price.toString(),
                                style: const TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                instrument.colour,
                                style: const TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                instrument.weight,
                                style: const TextStyle(
                                    color: AppColors.textColorLight,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        right: MediaQuery.of(context).size.width / 10,
                        bottom: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: PrimaryButton(
                          text: "Add to cart",
                          callback: () => adToCart(context)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  adToCart(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: false);
    provider.addToCart(instrument);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }
}
