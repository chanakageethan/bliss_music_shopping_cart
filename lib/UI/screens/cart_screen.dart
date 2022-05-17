import 'package:bliss_music_shopping_cart/UI/widgets/custom_app_bar_common.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  final isCartActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarCommon(
        isBackButtonNeeded: true,
        color: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: (isCartActive) ? cartView(context) : emptyCartView(context),
      ),
    );
  }

  Widget cartView(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const CartItemTile(
              color: Colors.green,
              imageUrl:
                  "https://thumbs.static-thomann.de/thumb/orig/pics/bdb/245039/2422612_800.webp",
              model: "test",
              price: 100.0,
            ),
            const CartItemTile(
              color: Colors.yellow,
              imageUrl:
                  "https://thumbs.static-thomann.de/thumb/orig/pics/bdb/245039/2422612_800.webp",
              model: "test",
              price: 100.0,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.09,
                  right: MediaQuery.of(context).size.width * 0.09),
              child: const Divider(thickness: 2, color: AppColors.buttonColor),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.09,
                  right: MediaQuery.of(context).size.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: AppColors.textColorLight,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  Spacer(),
                  Text(
                    "Rs." + "1570.0",
                    style: TextStyle(
                        color: AppColors.textColorLight,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
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
              child:
                  PrimaryButton(text: "Check out", callback: () => checkout()),
            ),
          ],
        ),
      );

  Widget emptyCartView(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            Icon(
              Icons.add_shopping_cart,
              color: AppColors.buttonColor,
              size: MediaQuery.of(context).size.width / 3,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const Text(
              "Your cart is curently empty!",
              style: TextStyle(
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                right: MediaQuery.of(context).size.width / 10,
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              child: PrimaryButton(
                  text: "Brows Items", callback: () => showHomeScreen(context)),
            ),
          ],
        ),
      );

  showHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  checkout() {}
}
