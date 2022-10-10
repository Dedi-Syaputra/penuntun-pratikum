import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme.dart';

class CardMenu extends StatelessWidget {
  final String image, title, action;
  final Object? argumentsmapel;

  const CardMenu({
    Key? key,
    required this.image,
    this.argumentsmapel,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, action, arguments: argumentsmapel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 90,
              height: 90,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
                height: 0.9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
