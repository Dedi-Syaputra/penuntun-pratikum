import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/practice_screen.dart';
import 'package:skripsi/ui/pages/quiz_screen.dart';
import 'package:skripsi/ui/pages/theory_screen.dart';
import '../../shared/theme.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kPrimaryColor,
        title: Text(
          arguments['mapel'],
        ),
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
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TheoryScreen(
                            idMapel: arguments['id_mapel'],
                            mapel: arguments['mapel'],
                            image: arguments['image']),
                      )),
                  child: Container(
                    width: 350,
                    height: 125,
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Image.asset(
                              'images/materi.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text("Materi"),
                        ],
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PraticeScreen(
                            idMapel: arguments['id_mapel'],
                            mapel: arguments['mapel'],
                            image: arguments['image']),
                      )),
                  child: Container(
                    width: 350,
                    height: 125,
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Image.asset(
                              'images/pratikum.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text("Pratikum"),
                        ],
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          idMapel: arguments['id_mapel'],
                          mapel: arguments['mapel'],
                        ),
                      )),
                  child: Container(
                    width: 350,
                    height: 125,
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Image.asset(
                              'images/latihan.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text("Latihan"),
                        ],
                      ),
                      elevation: 8,
                      shadowColor: Colors.green,
                      margin: EdgeInsets.all(20),
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
