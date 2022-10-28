import 'package:flutter/material.dart';
import 'package:skripsi/ui/pages/custom_card_about.dart';

import '../../shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:skripsi/ui/pages/about_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with TickerProviderStateMixin {
  var MenuAbout = [
    {
      "image": "images/pratikum0.png",
      "title": "Bakteri",
      "action": "/categoryscreen"
    },
    {"image": "images/pratikum1.png"},
    {"image": "images/pratikum2.png"},
    {"image": "images/pratikum4.png"},
    {"image": "images/pratikum5.png"},
    {"image": "images/pratikum6.png"},
    {"image": "images/pratikum7.jpg"},
    {"image": "images/pratikum8.jpg"},
  ];

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    _launchWhatsapp(whatsapp) async {
      var whatsappAndroid =
          Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
      if (await canLaunchUrl(whatsappAndroid)) {
        await launchUrl(whatsappAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("WhatsApp is not installed on the device"),
          ),
        );
      }
    }

    TabController _tabController = TabController(length: 3, vsync: this);
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
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 320,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  width: 350,
                                  height: 70,
                                  child: Center(
                                    child: Text(
                                      'Tentang Sekolah',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 35,
                                        fontWeight: black,
                                        height: 2.0,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      defaultRadius,
                                    ),
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                width: double.infinity,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kBlackColor.withOpacity(0.1),
                                      blurRadius: 20,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          'VISI : \n',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: semiBold,
                                            height: 1,
                                          ),
                                        ),
                                        Text(
                                            '“Menghasilkan Lulusan yang bermoral baik dan terampil sesuai  kompetensi serta mampu bersaing di era globalisasi untuk menghadapi Masyarakat Ekonomi Asean (MEA).”\n'),
                                        Text(
                                          'Misi : \n',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: semiBold,
                                            height: 1,
                                          ),
                                        ),
                                        Text(
                                            '1. Menyelengarakan pendidikan menengah Kejuruan yang bermutu dan berahlak/berbudi untuk menghasilkan Asisten Tenaga Laboratorium yang terampil dan Profesional sesuai dengan Kompetensi.'),
                                        Text(
                                            '2. Mengembangkan kompetensi keahlian dan menerapkan IPTEK pada Proses pembelajaran '),
                                        Text(
                                            '3. Membina Kemitraan dengan Dunia Usaha dan Industri dalam menghadapi pasar Global\n'),
                                        Text(
                                          'Tujuan Sekolah : \n',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: semiBold,
                                            height: 1,
                                          ),
                                        ),
                                        Text(
                                            '1. Mendidik Asisten Tenaga Laboratorium Kesehatan dengan Standart profesi dan Kode Etik Asisten Tenaga Kesehatan'),
                                        Text(
                                            '2.  Membimbing dan Membina SDM Kesehatan dan SDM Industri yang Menjadi Tanggung Jawabnya'),
                                        Text(
                                            '3. Melaksanakan pembelajaran yang berbasis metode pembelajaran yang berorientasi pada kebutuhan pasar kerja'),
                                        Text(
                                            '4. Mengembangkan kerjasama dengan Institusi terkait dan masyarakat untuk memanfaatkan SDM yang tersedia '),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  width: 350,
                                  height: 70,
                                  child: Center(
                                    child: Text(
                                      'Kegiatan Pratikum',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 30,
                                        fontWeight: black,
                                        height: 2.0,
                                      ),
                                    ),
                                  ),
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
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 18,
                                    mainAxisSpacing: 18,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardAbout(
                                      image: MenuAbout[index]['image'] ?? '',
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 350,
                                  height: 70,
                                  child: Center(
                                    child: Text(
                                      'Tentang Devloper',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 35,
                                        fontWeight: black,
                                        height: 2.0,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      defaultRadius,
                                    ),
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(30),
                                padding: const EdgeInsets.all(20),
                                width: double.infinity,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kBlackColor.withOpacity(0.1),
                                      blurRadius: 20,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'images/dedi-min.jpg',
                                          width: 250,
                                          height: 200,
                                        ),
                                        Text(
                                          'Dedi Syaputra',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 30,
                                            fontWeight: bold,
                                            height: 1.5,
                                          ),
                                        ),
                                        Text(
                                          'Analis Kesehatan',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: semiBold,
                                            height: 1.5,
                                          ),
                                        ),
                                        Text(
                                          'Alumni 2016',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: semiBold,
                                            height: 1.5,
                                          ),
                                        ),
                                        Text(
                                          'Web Development',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: semiBold,
                                            height: 1,
                                          ),
                                        ),
                                        Text(
                                          'Mobile Development',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: semiBold,
                                            height: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, bottom: 15),
                                          child: Text(
                                            'Kritik dan Saran :',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: semiBold,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl(Uri.parse(
                                                    'https://github.com/Dedi-Syaputra'));
                                              },
                                              child: Image.asset(
                                                'images/git.png',
                                                width: 50,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl(Uri.parse(
                                                    'mailto:dedi.thebleckmits@gmail.com?subject=Kritik dan Saran&body='));
                                              },
                                              child: Image.asset(
                                                'images/gmail.png',
                                                width: 50,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl(Uri.parse(
                                                    'https://www.instagram.com/dedisyaputraa/?hl=id'));
                                              },
                                              child: Image.asset(
                                                'images/instagram.png',
                                                width: 50,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            // Image.asset(
                                            //   'images/telegram.png',
                                            //   width: 50,
                                            // ),
                                            // const SizedBox(
                                            //   width: 10,
                                            // ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchWhatsapp('628973701106');
                                              },
                                              child: Image.asset(
                                                'images/whatshapp.png',
                                                width: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Container(
                      width: double.infinity,
                      height: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          indicatorColor: kBlackColor,
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: kBlackColor,
                          unselectedLabelColor: kBlackColor.withOpacity(0.5),
                          controller: _tabController,
                          tabs: [
                            Tab(text: ''),
                            Tab(text: ''),
                            Tab(text: ''),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: kBlackColor.withOpacity(0.3), blurRadius: 20)
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
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/homescreen'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "images/home.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Home",
                                style: blackTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: light,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "images/about1.png",
                              height: 40,
                              width: 40,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "About",
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: extraBold,
                                height: 0.9,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
