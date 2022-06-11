import 'package:finalproject_pmoif20d_wahyu/About.dart';
import 'package:finalproject_pmoif20d_wahyu/CeritaFavorite.dart';
import 'package:finalproject_pmoif20d_wahyu/DetailCeritaGratis.dart';
import 'package:finalproject_pmoif20d_wahyu/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;


class _HomePageState extends State<HomePage> {
  final List<Map> myProducts =
      List.generate(20, (index) => {"id": index, "name": "Cerita $index"})
          .toList();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14));

  var customIcon = const Icon(Icons.search);
  Widget customTitle = const Text('Cerita Indonesia', style: TextStyle(fontFamily: 'PoppinsMedium'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset('assets/images/ceria256white.png')),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: customTitle,
        backgroundColor: const Color(0xFF6A2B84),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                _pencarian();
              },
              icon: customIcon,
          ),
        ],
        bottom: PreferredSize(
          child: Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.white),
                        child: const Text('Dongeng'),
                        onPressed: () {
                          // print('Pressed');
                        }
                      )),
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.white),
                        child: const Text('Novel'),
                        onPressed: () {
                          // print('Pressed');
                        }
                      )),
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.white),
                        child: const Text('Cerpen'),
                        onPressed: () {
                          // print('Pressed');
                        }
                      )),
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.white),
                        child: const Text('Biografi'),
                        onPressed: () {
                          // print('Pressed');
                        }
                      )),
                ],
              )),
          preferredSize: const Size.fromHeight(50),
        ),
        bottomOpacity: .7,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                child: InkResponse(
                  child: Image.asset('assets/images/ceria256color.png'),
                  onTap: (){
                    // print(index);
                  },
                ),
              );
              // return Container(
                // child: Card(
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.0),
                //       image: const DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/ceria256color.png'))
                //     ),
                //     // child: const Padding(
                //     //   padding: EdgeInsets.all(10.0),
                //     //   child: Text('Judul Cerita'),
                //     // ),
                //   ),
                //
                // ),
                // alignment: Alignment.center,
                // decoration: BoxDecoration(
                //   image: const DecorationImage(
                //     image: AssetImage('assets/images/ceria256color.png'),
                //   ),
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(5),
                //   boxShadow: [
                //     BoxShadow(
                //         color: Colors.grey.withOpacity(0.1),
                //         spreadRadius: 2,
                //         blurRadius: 1,
                //         offset: const Offset(0, 1)),
                //   ],
                // ),
                // child: Text(myProducts[index]["name"]),

              // );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6A2B84),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "Favorit"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: "Tentang"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profil"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    // setState(() {
    _selectedIndex = index;
    if (index == 0) {
      // Fluttertoast.showToast(msg: "Ini Index 0");
      showHomePage();
    } else if (index == 1) {
      //Fluttertoast.showToast(msg: "Ini Index 1");
      showFavorite();
    } else if (index == 2) {
      // Fluttertoast.showToast(msg: "Ini Index 2");
      showAboutApp();
    } else if (index == 3) {
      // Fluttertoast.showToast(msg: "Ini Index 3");
      showBottomSheetLogin();
    }
    // });
  }

  void showHomePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void showFavorite() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CeritaFavorite()));
  }

  void showDetailCeritaG() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DetailCeritaGratis()));
  }

  void showAboutApp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const About()));
  }

  void showUser() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const User()));
  }

  void showBottomSheetLogin() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: const Text("Login",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'PoppinsMedium',
                        color: Color(0xFF6A2B84))),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Username',
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: const TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Password',
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6A2B84),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          showUser();
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'PoppinsMedium',
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Color(0xFF6A2B84))),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          showBottomSheetRegistrasi();
                        },
                        child: const Text(
                          "Registrasi",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'PoppinsMedium',
                            color: Color(0xFF6A2B84),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheetRegistrasi() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: const Text("Registrasi",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'PoppinsMedium',
                        color: Color(0xFF6A2B84))),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Email',
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Username',
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: const TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Password',
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: const TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Ulangi Password',
                    isDense: true,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 50, right: 50, top: 25, bottom: 25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6A2B84),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Registrasi",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'PoppinsMedium',
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _pencarian() {
    setState(() {
      if (customIcon.icon == Icons.search) {
        customIcon = const Icon(Icons.cancel);
        customTitle = const ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.white,
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: 'tuliskan judul cerita...',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      } else {
        customIcon = const Icon(Icons.search);
        customTitle = const Text('Cerita Indonesia', style: TextStyle(fontFamily: 'PoppinsMedium'));
      }
    });
  }
}
