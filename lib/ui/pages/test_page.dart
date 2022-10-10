import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 210,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/bg_home.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: DecoratedBox(
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'images/logo.png',
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat\nDatang',
                              style: blackTextStyle.copyWith(
                                fontSize: 35,
                                fontWeight: black,
                                height: 0.9,
                              ),
                            ),
                            Text(
                              'Semangat Belajar',
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: light,
                                height: 1.4,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    color: kWhiteColor,
                  ),
                  child: Flexible(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: kBlackColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        hintText: 'Cari disini...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            defaultRadius,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            defaultRadius,
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
