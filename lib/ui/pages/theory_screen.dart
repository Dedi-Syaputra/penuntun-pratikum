import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:skripsi/shared/theme.dart';
import 'package:http/http.dart' as http;

class TheoryScreen extends StatefulWidget {
  final String idMapel, mapel, image;
  const TheoryScreen(
      {Key? key,
      this.idMapel = '1',
      this.mapel = 'tidakadamatapelajaran',
      this.image = 'images/bg_down.png'})
      : super(key: key);

  @override
  State<TheoryScreen> createState() => _TheoryScreenState();
}

class _TheoryScreenState extends State<TheoryScreen> {
  var materi;
  Future<void> fetchMateri() async {
    final response = await http.get(Uri.parse(
        'https://www.ayo-wisuda.site/api/dedi/materiindex/${widget.idMapel}'));

    if (response.statusCode == 200) {
      materi = jsonDecode(response.body.toString());
      return materi;
    } else {
      throw Exception('Jaringan Bermasalah');
    }
  }

  double angle = 0.0;
  bool _isExpanded = false;

  void _openRotation() {
    setState(() => angle += 1.0 / 4.0);
  }

  void _closeRotation() {
    setState(() => angle -= 1.0 / 4.0);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kPrimaryColor,
        title: Text('Materi / ${widget.mapel}'),
      ),
      body: Stack(
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FutureBuilder(
              future: fetchMateri(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: materi.length,
                    itemBuilder: (context, index) {
                      final pratikum = snapshot.data as List;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            )
                          ],
                        ),
                        child: Theme(
                          data: ThemeData()
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            leading: Image.asset(
                              widget.image,
                              width: 30,
                            ),
                            title: Text(materi[index]['judul_materi']),
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(materi[index]['detail_materi']),
                                    // Image.network(
                                    //   'images/coccus.jpg',
                                    //   height: 200,
                                    //   width: 200,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
