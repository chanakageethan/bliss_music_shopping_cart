import 'package:flutter/material.dart';





class CustomAppBar extends StatelessWidget   implements  PreferredSizeWidget {
  final bool  isBackButtonNeeded;
  final Color color;
  const CustomAppBar({Key? key,required this.isBackButtonNeeded,required this.color}) : super(key: key);
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
            Stack(
              children:  [
                  const  Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30.0,
                ),
                Container(
                  height: 15,
                  width: 15,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                  ),
                  child: const Center(
                    child: Text(
                      "4",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 10.0),
                    ),
                  ),
                ),
              ],
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

}
