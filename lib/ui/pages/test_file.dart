import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TestFile extends StatelessWidget {
  const TestFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
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
                      'images/sekolah.png',
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
                          // decoration: const ShapeDecoration(
                          //   shape: CircleBorder(),
                          //   color: Colors.white,
                          // ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            // child: DecoratedBox(
                            //   decoration: ShapeDecoration(
                            //       shape: CircleBorder(),
                            //       image: DecorationImage(
                            //         fit: BoxFit.cover,
                            //         image: AssetImage(
                            //           'images/logo.png',
                            //         ),
                            //       )),
                            // ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       'Selamat\nDatang',
                        //       style: whiteTextStyle.copyWith(
                        //         fontSize: 35,
                        //         fontWeight: black,
                        //         height: 0.9,
                        //       ),
                        //     ),
                        //     Text(
                        //       'Semangat Belajar',
                        //       style: whiteTextStyle.copyWith(
                        //         fontSize: 15,
                        //         fontWeight: light,
                        //         height: 1.4,
                        //       ),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 350,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    color: kWhiteColor,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(18),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/sekolah.png"),
                          fit: BoxFit.fill,
                        ),
                        color: kWhiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: kBlackColor.withOpacity(0.1),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(color: kBlackColor.withOpacity(0.3), blurRadius: 20)
                ],
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              width: 240,
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "images/bakteri.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Home")
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "images/bakteri.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("About")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
