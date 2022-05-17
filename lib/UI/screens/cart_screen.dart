import 'package:bliss_music_shopping_cart/UI/widgets/custom_app_bar_common.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  final isCartActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarCommon(
        isBackButtonNeeded: true,
        color: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: (isCartActive) ? CartView(context) : emptyCartView(context),
      ),
    );
  }

  Widget CartView(BuildContext context) => Container();

  Widget emptyCartView(BuildContext context) => Container(
    width: double.infinity,

    child: Column(
          children:  [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            Icon(
              Icons.add_shopping_cart,
              color: AppColors.buttonColor,
              size: MediaQuery.of(context).size.width / 3,
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.05),
            const Text(
              "Your cart is curently empty!",
              style: TextStyle(
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                right: MediaQuery.of(context).size.width / 10,
                bottom:   MediaQuery.of(context).size.height *0.02,
              ),
              child: PrimaryButton(text: "Brows Items", callback: ()=> showHomeScreen(context)),
            ),
          ],
        ),
  );


  showHomeScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const HomeScreen()),
    );
  }
}
