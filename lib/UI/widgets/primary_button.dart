import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function callback;

  const PrimaryButton({Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      width: double.infinity,
      // color: AppColors.darkBlue,
      decoration: const BoxDecoration(
          // border: Border.all(
          // color: Colors.white,
          // ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: Colors.white
          // color: Colors.white,
          ),
      child: TextButton(
        onPressed: () => callback(),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 17.0)),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: AppColors.buttonColor,
        ),
      ),
    );
  }
}
