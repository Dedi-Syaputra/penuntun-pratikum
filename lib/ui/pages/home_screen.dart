import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/theme.dart';
import 'package:skripsi/ui/pages/custom_card_menu.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var name;

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  getPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Tidak ada';
    });
  }

  removePrefData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushNamed(context, '/loginscreen');
  }

  var MenuHome = [
    {
      "image": "images/bakteri.png",
      "title": "Bakteriologi",
      "action": "/categoryscreen",
      "mapel": "Bakteriologi",
      "id_mapel": "1",
    },
    {
      "image": "images/hematologi.png",
      "title": "Hematologi",
      "action": "/categoryscreen",
      "mapel": "Hematologi",
      "id_mapel": "2",
    },
    {
      "image": "images/patologi.png",
      "title": "Patologi Klinik",
      "action": "/categoryscreen",
      "mapel": "Patologi Klinik",
      "id_mapel": "3",
    },
    {
      "image": "images/parisitologi.png",
      "title": "Parasitologi",
      "action": "/categoryscreen",
      "mapel": "Parasitologi",
      "id_mapel": "4",
    },
    {
      "image": "images/imunologi.png",
      "title": "Imunologi",
      "action": "/categoryscreen",
      "mapel": "Imunologi",
      "id_mapel": "5",
    },
    {
      "image": "images/serologi.png",
      "title": "Serologi",
      "action": "/categoryscreen",
      "mapel": "Serologi",
      "id_mapel": "6",
    },
    {
      "image": "images/kimiamakanan.png",
      "title": "Kimia Makanan",
      "action": "/categoryscreen",
      "mapel": "Kimia Makanan",
      "id_mapel": "7",
    },
    {
      "image": "images/kimiaminuman.png",
      "title": "Kimia Minuman",
      "action": "/categoryscreen",
      "mapel": "Kimia Minuman",
      "id_mapel": "8"
    },
  ];

  @override
  void initState() {
    super.initState();
    getPrefData();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/profile.png',
                      color: kWhiteColor,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      name,
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl(Uri.parse(
                          'mailto:smkdharmaanalitika@gmail.com?subject=Kritik dan Saran&body='));
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'images/gmail.png',
                          width: 20,
                        ),
                        Text('  smkdharmaanalitika@gmail.com'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl(Uri.parse(
                          'https://www.instagram.com/smkdharmaanalitika/?hl=id'));
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'images/instagram.png',
                          width: 20,
                        ),
                        Text(' SMK DHARMA ANALITIKA MEDAN'),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl(Uri.parse(
                          'https://web.facebook.com/smkdharmaanalitikamedan'));
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'images/facebook.png',
                          width: 20,
                        ),
                        Text(' SMK DHARMA ANALITIKA MEDAN'),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl(Uri.parse(
                          'https://www.youtube.com/channel/UCG66k24PAix9XK1-m82Wfrg'));
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'images/youtube.png',
                          width: 20,
                        ),
                        Text(' SMK DHARMA ANALITIKA MEDAN'),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(child: const Text('About')),
              onTap: () {
                Navigator.pushNamed(context, '/aboutscreen');
              },
            ),
            GestureDetector(
              onTap: () => removePrefData(context),
              child: Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.all(10),
                child: Card(
                  color: Colors.green,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      Text(
                        "Keluar",
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
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
                      'images/bg_home.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
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
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat\nDatang',
                              style: whiteTextStyle.copyWith(
                                fontSize: 40,
                                fontWeight: black,
                                height: 0.9,
                              ),
                            ),
                            Text(
                              'Semangat Belajar !',
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: light,
                                height: 1.4,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    color: kWhiteColor,
                  ),
                  // child: Flexible(
                  //   child: TextField(
                  //     style: const TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //     cursorColor: kBlackColor,
                  //     // decoration: InputDecoration(
                  //     //   contentPadding: const EdgeInsets.all(15),
                  //     //   prefixIcon: const Icon(
                  //     //     Icons.search,
                  //     //     size: 30,
                  //     //   ),
                  //     //   hintText: 'Cari disini...',
                  //     //   border: OutlineInputBorder(
                  //     //     borderRadius: BorderRadius.circular(
                  //     //       defaultRadius,
                  //     //     ),
                  //     //   ),
                  //     //   focusedBorder: OutlineInputBorder(
                  //     //     borderRadius: BorderRadius.circular(
                  //     //       defaultRadius,
                  //     //     ),
                  //     //     borderSide: BorderSide(
                  //     //       color: kPrimaryColor,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ),
                  // ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: GridView.builder(
                    padding: EdgeInsets.all(18),
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 18),
                    itemBuilder: (BuildContext context, int index) {
                      return CardMenu(
                        image: MenuHome[index]['image'] ?? 'images/bakteri.png',
                        title: MenuHome[index]['title'] ?? 'images/bakteri.png',
                        action: MenuHome[index]['action'] ?? '/categoryscreen',
                        argumentsmapel: {
                          'id_mapel': MenuHome[index]['id_mapel'] ?? '1',
                          'mapel': MenuHome[index]['mapel'] ??
                              'Mata Pelajaran Tidak Terpilih',
                          'image':
                              MenuHome[index]['image'] ?? 'images/bg_down.png'
                        },
                      );
                    },
                  ),
                ),
              ),
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
                            "images/home.png",
                            height: 40,
                            width: 40,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Home",
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
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/aboutscreen'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "images/about2.png",
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "About",
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
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => scaffoldkey.currentState?.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 70,
              ),
              child: Icon(
                Icons.menu,
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
