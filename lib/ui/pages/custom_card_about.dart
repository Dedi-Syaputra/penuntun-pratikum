import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme.dart';

class CardAbout extends StatelessWidget {
  final String image;

  const CardAbout({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
        image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
