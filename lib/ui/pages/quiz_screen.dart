import 'package:flutter/material.dart';
import 'dart:convert';
import '../../shared/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class QuizScreen extends StatefulWidget {
  final String idMapel, mapel;

  const QuizScreen({
    Key? key,
    this.idMapel = '1',
    this.mapel = 'matapelajarantidakdiketahui',
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var quiz;
  Future<void> fetchQuiz() async {
    final response = await http.get(Uri.parse(
        'https://www.ayo-wisuda.site/api/dedi/latihanindex/${widget.idMapel}'));

    if (response.statusCode == 200) {
      quiz = jsonDecode(response.body.toString());
      return quiz;
    } else {
      throw Exception('Jaringan Bermasalah');
    }
  }

  int _noSoal = 0;
  int _soalTerjawab = 0;
  int _soalTerjawabSebelumnya = 0;
  int _nilaiSebelumnya = 0;
  int _nilai = 0;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  void _randomSoal() {
    Random random = Random();
    setState(() {
      _noSoal = random.nextInt(quiz.length);
    });
  }

  // void _toggleJawaban(jawabanTerpilih) {}
  void _cekJawaban(jawabanTerpilih) {
    setState(() {
      if (jawabanTerpilih == 'A') {
        if (_nilai == _nilaiSebelumnya &&
            _soalTerjawab == _soalTerjawabSebelumnya) {
          _nilai = _nilai + 1;
          _soalTerjawab = _soalTerjawab + 1;
          _isSelected2 = false;
          _isSelected3 = false;
          _isSelected4 = false;
        } else if (_nilai > _nilaiSebelumnya &&
            _soalTerjawab > _soalTerjawabSebelumnya) {
          _nilai = _nilai - 1;
          _soalTerjawab = _soalTerjawab - 1;
        }
      } else if (jawabanTerpilih == 'B') {
        if (_nilai == _nilaiSebelumnya &&
            _soalTerjawab == _soalTerjawabSebelumnya) {
          _soalTerjawab = _soalTerjawab + 1;
          _isSelected1 = false;
          _isSelected3 = false;
          _isSelected4 = false;
        } else if (_nilai > _nilaiSebelumnya &&
            _soalTerjawab > _soalTerjawabSebelumnya) {
          _soalTerjawab = _soalTerjawab - 1;
        }
      } else if (jawabanTerpilih == 'C') {
        if (_nilai == _nilaiSebelumnya &&
            _soalTerjawab == _soalTerjawabSebelumnya) {
          _soalTerjawab = _soalTerjawab + 1;
          _isSelected1 = false;
          _isSelected2 = false;
          _isSelected4 = false;
        } else if (_nilai > _nilaiSebelumnya &&
            _soalTerjawab > _soalTerjawabSebelumnya) {
          _soalTerjawab = _soalTerjawab - 1;
        }
      } else if (jawabanTerpilih == 'D') {
        if (_nilai == _nilaiSebelumnya &&
            _soalTerjawab == _soalTerjawabSebelumnya) {
          _soalTerjawab = _soalTerjawab + 1;
          _isSelected1 = false;
          _isSelected2 = false;
          _isSelected3 = false;
        } else if (_nilai > _nilaiSebelumnya &&
            _soalTerjawab > _soalTerjawabSebelumnya) {
          _soalTerjawab = _soalTerjawab - 1;
        }
      }
    });
  }

  void _cekJawaban1(int nilai) {
    print([!_isSelected1, !_isSelected2, !_isSelected3, !_isSelected4]);
    print([_isSelected1, _isSelected2, _isSelected3, _isSelected4]);
    print([_soalTerjawab, _soalTerjawabSebelumnya]);
    setState(() {
      if (_nilaiSebelumnya == _nilai) {
        _nilai = _nilai + nilai;
      } else {
        _nilai = _nilaiSebelumnya;
      }

      if (_isSelected1 || _isSelected2 || _isSelected3 || _isSelected4) {
        _soalTerjawab = _soalTerjawabSebelumnya + 1;
      } else if (!_isSelected1 &&
          !_isSelected2 &&
          !_isSelected3 &&
          !_isSelected4) {
        _soalTerjawab = _soalTerjawabSebelumnya;
      }
    });
  }

  void _lanjut() {
    _nilaiSebelumnya = _nilai;
    _soalTerjawabSebelumnya = _soalTerjawab;
    _isSelected1 = false;
    _isSelected2 = false;
    _isSelected3 = false;
    _isSelected4 = false;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Perhatian!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Pilih jawaban terebih dahulu.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan'),
        backgroundColor: kPrimaryColor,
        actions: <Widget>[],
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
          FutureBuilder(
            future: fetchQuiz(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 40),
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(quiz[_noSoal]['soal']),
                              )),
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
                    GestureDetector(
                      onTap: () {
                        _isSelected1 = !_isSelected1;
                        _isSelected2 = false;
                        _isSelected3 = false;
                        _isSelected4 = false;
                        _cekJawaban1(1);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          color: _isSelected1 ? kPrimaryColor : kWhiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                                child: Text(
                              quiz[_noSoal]['jawaban_beneran'],
                              style: _isSelected1
                                  ? whiteTextStyle
                                  : blackTextStyle,
                            )),
                          ),
                          elevation: 8,
                          shadowColor: Colors.green,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _isSelected2 = !_isSelected2;
                        _isSelected1 = false;
                        _isSelected3 = false;
                        _isSelected4 = false;
                        _cekJawaban1(0);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          color: _isSelected2 ? kPrimaryColor : kWhiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                                child: Text(
                              quiz[_noSoal]['pilihan_jawaban1'],
                              style: _isSelected2
                                  ? whiteTextStyle
                                  : blackTextStyle,
                            )),
                          ),
                          elevation: 8,
                          shadowColor: Colors.green,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _isSelected3 = !_isSelected3;
                        _isSelected1 = false;
                        _isSelected2 = false;
                        _isSelected4 = false;
                        _cekJawaban1(0);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          color: _isSelected3 ? kPrimaryColor : kWhiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                                child: Text(
                              quiz[_noSoal]['pilihan_jawaban2'],
                              style: _isSelected3
                                  ? whiteTextStyle
                                  : blackTextStyle,
                            )),
                          ),
                          elevation: 8,
                          shadowColor: Colors.green,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _isSelected4 = !_isSelected4;
                        _isSelected1 = false;
                        _isSelected2 = false;
                        _isSelected3 = false;
                        _cekJawaban1(0);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20),
                        child: Card(
                          color: _isSelected4 ? kPrimaryColor : kWhiteColor,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                                child: Text(
                              quiz[_noSoal]['pilihan_jawaban3'],
                              style: _isSelected4
                                  ? whiteTextStyle
                                  : blackTextStyle,
                            )),
                          ),
                          elevation: 8,
                          shadowColor: Colors.green,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // Container(
                        //   width: 120,
                        //   height: 40,
                        //   margin: EdgeInsets.all(40),
                        //   child: Card(
                        //     child: Row(
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 15),
                        //         ),
                        //         Text(
                        //           "Kembali",
                        //           style: whiteTextStyle.copyWith(),
                        //         ),
                        //       ],
                        //     ),
                        //     elevation: 8,
                        //     color: kPrimaryColor,
                        //     shadowColor: Colors.green,
                        //     shape: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(color: Colors.white)),
                        //   ),
                        // ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (_soalTerjawab < 10) {
                              if (!_isSelected1 &&
                                  !_isSelected2 &&
                                  !_isSelected3 &&
                                  !_isSelected4) {
                                _showMyDialog();
                              } else {
                                _randomSoal();
                                _lanjut();
                              }
                            } else {
                              Navigator.pushNamed(context, '/hasilscreen',
                                  arguments: {'nilai': _nilai});
                            }
                          },
                          child: Container(
                            width: 160,
                            height: 50,
                            margin: EdgeInsets.all(30),
                            child: Card(
                              child: Center(
                                child: Text(
                                  _soalTerjawab < 10 ? "Lanjut" : "Selesai",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              elevation: 8,
                              color: kPrimaryColor,
                              shadowColor: Colors.green,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
