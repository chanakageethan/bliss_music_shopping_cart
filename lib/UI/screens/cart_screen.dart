import 'package:bliss_music_shopping_cart/Provider/cart_provider.dart';
import 'package:bliss_music_shopping_cart/UI/widgets/custom_app_bar_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/instrument.dart';
import '../utils/app_colors.dart';
import '../utils/commonFunctions.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  final isCartActive = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      appBar: const CustomAppBarCommon(
        isBackButtonNeeded: true,
        color: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: (provider.getCartItemList.isNotEmpty)
            ? cartView(context, provider.totalPrice)
            : emptyCartView(context),
      ),
    );
  }

  Widget cartView(BuildContext context, double totalPrice) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // const CartItemTile(
            //   color: Colors.green,
            //   imageUrl:
            //       "https://thumbs.static-thomann.de/thumb/orig/pics/bdb/245039/2422612_800.webp",
            //   model: "test",
            //   price: 100.0,
            // ),
            // const CartItemTile(
            //   color: Colors.yellow,
            //   imageUrl:
            //       "https://thumbs.static-thomann.de/thumb/orig/pics/bdb/245039/2422612_800.webp",
            //   model: "test",
            //   price: 100.0,
            // ),

            SingleChildScrollView(
              child: Consumer<CartProvider>(
                  builder: (_, provider, __) => SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: provider.getCartItemList.length,
                          itemBuilder: (context, index) {
                            Instrument cartItem =
                                provider.getCartItemByIndex(index);
                            return Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: CartItemTile(
                                color: CommonFunctions.getColorByCategory(cartItem.category),
                                imageUrl: cartItem.image,
                                model: cartItem.model,
                                price: cartItem.price,
                                id: cartItem.id,
                              ),
                            );
                          },
                        ),
                      )),
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
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        color: AppColors.textColorLight,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  const Spacer(),
                  Text(
                    "Rs." + totalPrice.toString(),
                    style: const TextStyle(
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
