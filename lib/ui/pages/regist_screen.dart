import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class RegistScreen extends StatelessWidget {
  const RegistScreen({Key? key}) : super(key: key);

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
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/daftar.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      child: Text(
                        'Daftarkan Akun Anda',
                        style: whiteTextStyle.copyWith(
                          fontSize: 25,
                          fontWeight: black,
                          height: 0.9,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 160,
                ),
                child: Text(
                  'Nama Lengkap',
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
                        hintText: 'Masukkan Nama',
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
                padding: const EdgeInsets.only(top: 10, right: 250),
                child: Text(
                  'Email',
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
                        hintText: 'Masukkan Email',
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
              Container(
                width: 350,
                height: 60,
                margin: EdgeInsets.all(10),
                child: Card(
                  color: kPrimaryColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                      ),
                      Text(
                        "Daftar",
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
            ],
          ),
        ],
      ),
    );
  }
}
