import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme.dart';
import '../../shared/theme.dart';

class HasilScreen extends StatelessWidget {
  const HasilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kPrimaryColor,
        title: Text('Hasil'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const Spacer(),
              Container(
                width: double.infinity,
                height: 110,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/bg_down.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 300,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jawaban Benar :",
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          arguments['nilai'].toString(),
                          style: blackTextStyle.copyWith(
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                    elevation: 8,
                    shadowColor: Color.fromARGB(255, 32, 135, 35),
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
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
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                          ),
                          Text(
                            "Halaman Utama",
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
              ],
            ),
          ),
        ],
      ),
      backgroundColor: kWhiteColor,
    );
  }
}
