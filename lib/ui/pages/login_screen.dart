import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                width: 400,
                height: 330,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/login.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Container(
                        width: 145,
                        height: 145,
                        // decoration: const ShapeDecoration(
                        //   shape: CircleBorder(),
                        //   color: Colors.white,
                        // ),
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
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Selamat Datang,',
                              style: whiteTextStyle.copyWith(
                                fontSize: 35,
                                fontWeight: black,
                                height: 0.9,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Silahkan Masuk Ke Akun Anda',
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: light,
                                height: 1.4,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 250),
                  child: Text(
                    'E-mail',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: light,
                      height: 1.4,
                    ),
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
                          hintText: 'Masukkan E-mail',
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 220),
                  child: Text(
                    'Password',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: light,
                      height: 1.4,
                    ),
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
                          hintText: 'Masukkan Password',
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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/homescreen'),
                  child: Container(
                    width: 350,
                    height: 60,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.green,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 65),
                          ),
                          Text(
                            "Masuk",
                            style: whiteTextStyle.copyWith(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.01,
                  ),
                  child: Text(
                    'Belum Memiliki Akun ?',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: light,
                      height: 1.4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.05,
                  ),
                  child: Text(
                    'Silahkan Hubungi Pihak Sekolah',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: light,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     margin: EdgeInsets.only(bottom: 30),
          //     decoration: BoxDecoration(
          //       color: kWhiteColor,
          //       boxShadow: [
          //         BoxShadow(color: kBlackColor.withOpacity(0.3), blurRadius: 20)
          //       ],
          //       borderRadius: BorderRadius.circular(
          //         20,
          //       ),
          //     ),
          //     width: 240,
          //     height: 110,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       // crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Column(
          //               children: [
          //                 Image.asset(
          //                   "images/bakteri.png",
          //                   height: 40,
          //                   width: 40,
          //                 ),
          //                 SizedBox(
          //                   height: 8,
          //                 ),
          //                 Text("Home")
          //               ],
          //             )
          //           ],
          //         ),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Column(
          //               children: [
          //                 Image.asset(
          //                   "images/bakteri.png",
          //                   height: 40,
          //                   width: 40,
          //                 ),
          //                 SizedBox(
          //                   height: 8,
          //                 ),
          //                 Text("About")
          //               ],
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
