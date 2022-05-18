import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/cart_provider.dart';
import '../screens/cart_screen.dart';





class CustomAppBar extends StatelessWidget   implements  PreferredSizeWidget {
  final bool  isBackButtonNeeded;
  final Color color;

  const CustomAppBar({Key? key,required this.isBackButtonNeeded,required this.color}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(43);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: true);
    return AppBar(
        leadingWidth: MediaQuery.of(context).size.width / 4,
        backgroundColor:color,
        elevation: 0,
        // title:
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            const Icon(
              Icons.share,
              color: Colors.white,
              size: 30.0,
            ),
             SizedBox(width: MediaQuery.of(context).size.width *0.02),
            const   Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(width: MediaQuery.of(context).size.width *0.02),
            GestureDetector(
              onTap: ()=>showCartScreen(context),
              child: Stack(
                children:  [
                    const  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30.0,
                  ),

                  provider.getCartItemList.isNotEmpty?
                  Container(
                    height: 15,
                    width: 15,
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child:  Center(
                      child: Text(
                        provider.getCartItemList.length.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                      ),
                    ),
                  ):Container()
                ],
              ),
            ),
          ],
        ),
        leading: isBackButtonNeeded ? GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: const [
                Positioned(
                  top: 8,
                  left: 11,
                  child: Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 25),
                )
              ],
            ),
          ),
        )
            :
        Container()
    );
  }


  showCartScreen(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  CartScreen()),
    );
  }

}
