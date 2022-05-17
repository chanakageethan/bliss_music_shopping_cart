import 'package:bliss_music_shopping_cart/UI/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body(context)),
      appBar: const CustomAppBar(
        isBackButtonNeeded: true,
        color: AppColors.backgroundColor,
      ),
    );
  }

  Widget body(BuildContext context) => SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              color: AppColors.backgroundColor,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.network(
                        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                  ),
                ],
              ),
            ),
            //

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.6,
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
              ),
            )
          ],
        ),
      );
}
