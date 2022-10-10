import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:http/http.dart' as http;

class PraticeScreen extends StatefulWidget {
  final String idMapel, mapel, image;

  const PraticeScreen(
      {Key? key,
      this.idMapel = '1',
      this.mapel = 'matapelajarantidakdiketahui',
      this.image = 'images/bg_down.png'})
      : super(key: key);

  @override
  State<PraticeScreen> createState() => _PraticeScreenState();
}

class _PraticeScreenState extends State<PraticeScreen> {
  var pratikum;
  Future<void> fetchPratikum() async {
    final response = await http.get(Uri.parse(
        'https://www.ayo-wisuda.site/api/dedi/pratikumindex/${widget.idMapel}'));

    if (response.statusCode == 200) {
      pratikum = jsonDecode(response.body.toString());
      return pratikum;
    } else {
      throw Exception('Jaringan Bermasalah');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kPrimaryColor,
        title: Text('Pratikum / ${widget.mapel}'),
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
              future: fetchPratikum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: pratikum.length,
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
                            title: Text(pratikum[index]['judul_pratikum']),
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(pratikum[index]['detail_pratikum']),
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
