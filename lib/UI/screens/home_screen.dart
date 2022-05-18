import 'dart:convert';

import 'package:bliss_music_shopping_cart/Provider/main_provider.dart';
import 'package:bliss_music_shopping_cart/UI/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../Provider/cart_provider.dart';
import '../../models/category.dart';
import '../../models/instrument.dart';
import '../utils/commonFunctions.dart';
import '../widgets/category_tile.dart';
import '../widgets/instrument_tile.dart';
import 'cart_screen.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Category> _categoryList = [
    Category(
        categoryName: "guitar",
        color: CommonFunctions.getColorByCategory("guitar"),
        icon: const Icon(
          Icons.music_note_outlined,
          color: Colors.white,
          size: 25,
        )),
    Category(
        categoryName: "piano",
        color: CommonFunctions.getColorByCategory("piano"),
        icon: const Icon(
          Icons.piano,
          color: Colors.white,
          size: 25,
        )),
    Category(
        categoryName: "drums",
        color: CommonFunctions.getColorByCategory("drums"),
        icon: const Icon(
          Icons.music_note,
          color: Colors.white,
          size: 25,
        )),
  ];

  TextEditingController searchInputController = TextEditingController(text: "");

  // List<Instrument> instrumentTest = [];

  fetchData() async {
    var provider = Provider.of<MainProvider>(context, listen: false);
    List<Instrument> instrumentList = [];
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/919a0d45-c054-4452-8175-65538e554272'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      var data = jsonData["result"];
      for (var breakfastPref in data) {
        print(breakfastPref);
        instrumentList.add(Instrument.fromJson(breakfastPref));
      }
      provider.setInstrumentList(instrumentList);
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var provider = Provider.of<MainProvider>(context, listen: false);
        provider.setIsFilter(false);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(child: body()),
      ),
    );
  }

  Widget body() {
    var provider = Provider.of<CartProvider>(context, listen: true);

    return SingleChildScrollView(
      child: Padding(
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                GestureDetector(
                  onTap: () => showCartScreen(context),
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      provider.getCartItemList.isNotEmpty
                          ? Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.05),
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  provider.getCartItemList.length.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
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
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w700,
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
                          child: TextField(
                            controller: searchInputController,
                            autofocus: false,
                            keyboardAppearance: Brightness.light,
                            onChanged: (text) => _searchTyping(),
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Search Your Model',
                              hintStyle: TextStyle(
                                  color: AppColors.textColorLight,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.0),
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
                              onTap: () => _onTapSearch(),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              "By Category",
              style: TextStyle(
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categoryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () =>
                          _selectCategory(_categoryList[index].categoryName),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02),
                        child: CategoryTile(
                            categoryName: _categoryList[index].categoryName,
                            color: _categoryList[index].color,
                            icon: _categoryList[index].icon),
                      ));
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const Text(
              "Most Popular",
              style: TextStyle(
                  color: AppColors.textColorLight,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Consumer<MainProvider>(
                builder: (_, provider, __) => SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.isFilter
                            ? provider.getFilteredList.length
                            : provider.getInstrumentList.length,
                        itemBuilder: (context, index) {
                          Instrument instrument = provider.isFilter
                              ? provider.getFilteredInstrumentByIndex(index)
                              : provider.getInstrumentByIndex(index);
                          return GestureDetector(
                              onTap: () => productOnTap(instrument),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    left: MediaQuery.of(context).size.width *
                                        0.02),
                                child: InstrumentTile(
                                  productCode: instrument.model,
                                  imageUrl: instrument.image,
                                  itemId: instrument.id,
                                  category: instrument.category,
                                ),
                              ));
                        },
                      ),
                    )),
          ],
        ),
      ),
    );
  }

  void productOnTap(Instrument instrument) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsScreen(instrument: instrument)),
    );
  }

  void _selectCategory(String category) {
    var provider = Provider.of<MainProvider>(context, listen: false);
    provider.setIsFilter(true);
    provider.filterByCategory(category);
  }

  void _onTapSearch() {
    FocusManager.instance.primaryFocus?.unfocus();
    var provider = Provider.of<MainProvider>(context, listen: false);
    provider.setIsFilter(true);
    provider.filterByModel(searchInputController.text);
  }

  void _searchTyping() {
    var provider = Provider.of<MainProvider>(context, listen: false);

    if (searchInputController.text.isEmpty) {
      provider.setIsFilter(false);
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  showCartScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }
}
