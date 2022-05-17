import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';





class CustomAppBarCommon extends StatelessWidget   implements  PreferredSizeWidget {
  final bool  isBackButtonNeeded;
  final Color color;

  const CustomAppBarCommon({Key? key,required this.isBackButtonNeeded,required this.color}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(43);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: MediaQuery.of(context).size.width / 4,
        backgroundColor:color,
        elevation: 0,
        // title:
        centerTitle: true,

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
