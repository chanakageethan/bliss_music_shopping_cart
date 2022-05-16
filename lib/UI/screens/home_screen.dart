import 'package:bliss_music_shopping_cart/UI/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(child: body()),
      ),
    );
  }

  Widget body() => Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "BLISS",
                  style: TextStyle(
                      color: AppColors.mainHeadingColor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 35.0),
                ),
                const Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(blurRadius: 2.0, color: Colors.transparent)
                      ],
                      borderRadius: BorderRadius.circular(75.0)),
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              "Hello,",
              style: TextStyle(
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              "Sudesh Kumara,",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              padding: const EdgeInsets.only(bottom: 20, top: 5),
              child: Container(
                // margin: const EdgeInsets.only(left: 18, right: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8, // 20%
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const TextField(
                            // controller: searchInputController,
                            autofocus: false,
                            keyboardAppearance: Brightness.light,
                            // onChanged: (text) => _searchTyping(),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Search Your Model',
                              hintStyle: TextStyle(
                                  color: AppColors.textColorLight,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1, // 20%
                        child: Container(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.buttonColor,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              // onTap: () => _onTapSearch(),
                              child: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "By Category",
              style: TextStyle(
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
            ),
          ],
        ),
      );
}
