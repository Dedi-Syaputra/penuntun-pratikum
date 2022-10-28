import 'dart:convert';

import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> login(context) async {
    print([emailController.text, passwordController.text]);
    final queryParam = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    print(queryParam);
    final uri = Uri.https('www.ayo-wisuda.site', '/api/dedi/login', queryParam);
    final response = await http.post(uri);
    print(response.body);

    if (emailController.text == '' || passwordController.text == '') {
      final snackBar = SnackBar(
        content: Text('Isi Email dan Password terlebih dahulu'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var pesan = data['pesan'] ?? '';

        if (pesan != '') {
          final snackBar = SnackBar(
            content: Text(pesan.toString()),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('id', data['id'] ?? 0);
          prefs.setString('name', data['name'] ?? '');
          prefs.setString('angkatan', data['angkatan'] ?? '');
          prefs.setString('tempat', data['tempat'] ?? '');
          prefs.setString('tanggal_lahir', data['tanggal_lahir'] ?? '');
          prefs.setString('alamat', data['alamat'] ?? '');
          prefs.setString('email', data['email'] ?? '');
          Navigator.pushNamed(context, '/homescreen');
        }
      } else {
        throw Exception('Jaringan Bermasalah');
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 250),
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
                                controller: emailController,
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: light,
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
                                controller: passwordController,
                                obscureText: true,
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: light,
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
                          onTap: () => login(context),
                          child: Container(
                            width: 350,
                            height: 60,
                            margin: EdgeInsets.all(10),
                            child: Card(
                              color: Colors.green,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 65),
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
                )
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
