import 'dart:convert';
import 'package:finalproject_pmoif20d_wahyu/About.dart';
import 'package:finalproject_pmoif20d_wahyu/CeritaFavorite.dart';
import 'package:finalproject_pmoif20d_wahyu/DetailCeritaGratis.dart';
import 'package:finalproject_pmoif20d_wahyu/User.dart';
import 'package:finalproject_pmoif20d_wahyu/Constant/ConstantApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:need_resume/need_resume.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Constant/ConstantApi.dart';
import './API/CallApi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;

class _HomePageState extends ResumableState<HomePage> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var txtLoginEmail = TextEditingController();
  var txtLoginPassword = TextEditingController();
  var txtRegUser = TextEditingController();
  var txtRegNama = TextEditingController();
  var txtRegEmail = TextEditingController();
  var txtRegPass1 = TextEditingController();
  var txtRegPass2 = TextEditingController();

  final TextEditingController _searchQuery = TextEditingController();
  // List<Model> _list;
  // List<Model> _searchList = List();

  late bool _IsSearching;
  // String _searchText = "";

  List widgetsDongeng = [];
  List widgetsCerpen = [];
  List widgetsNovel = [];
  List widgetsBiografi = [];

  bool _isLoading = false;

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    _tabController = TabController(length: 4, vsync: this);
    loadDataDongeng();
    loadDataCerpen();
    loadDataNovel();
    loadDataBiografi();
  }

  void onReady() {}

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void onResume() {
    loadDataDongeng();
  }

  @override
  void onPause() {}

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14));

  var customIcon = const Icon(Icons.search);
  Widget customTitle = const Text('Cerita Indonesia',
      style: TextStyle(fontFamily: 'PoppinsMedium'));


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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

          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(child : Text('Dongeng', style: TextStyle(fontSize: 11, color: Colors.white))),
              Tab(child : Text('Cerpen', style: TextStyle(fontSize: 11, color: Colors.white))),
              Tab(child : Text('Novel', style: TextStyle(fontSize: 11, color: Colors.white))),
              Tab(child : Text('Biografi', style: TextStyle(fontSize: 11, color: Colors.white))),
            ],
          ),

          bottomOpacity: .7,
        ),
        body:
        TabBarView(
          controller: _tabController,
          children: [
            // Tab Bar Dongeng
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: widgetsDongeng.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkResponse(
                            child: Image.asset('assets/images/ceria256color.png',
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover),
                            onTap: () {
                              print(i);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text("${widgetsDongeng[i]["judul_cerita"]}",
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }),
            ),

            // Tab Bar Cerpen
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: widgetsCerpen.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkResponse(
                            child: Image.asset('assets/images/ceria256color.png',
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover),
                            onTap: () {
                              print(i);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text("${widgetsCerpen[i]["judul_cerita"]}",
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }),
            ),

            // Tab Bar Novel
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: widgetsNovel.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkResponse(
                            child: Image.asset('assets/images/ceria256color.png',
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover),
                            onTap: () {
                              print(i);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text("${widgetsNovel[i]["judul_cerita"]}",
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }),
            ),

            // Tab Bar Biografi
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: widgetsBiografi.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkResponse(
                            child: Image.asset('assets/images/ceria256color.png',
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover),
                            onTap: () {
                              print(i);
                            },
                          ),
                          const SizedBox(height: 10),
                          Text("${widgetsBiografi[i]["judul_cerita"]}",
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  }),
            ),

          ],
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
      )
    );
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doLogin(txtLoginEmail.text, txtLoginPassword.text);
    }
  }

  void _validateRegister() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      doRegistrasi(
        txtRegUser.text,
        txtRegNama.text,
        txtRegEmail.text,
        txtRegPass1.text,
        txtRegPass2.text
      );
    }
  }

  doLogin(String email, pass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    var response = await http.post(Uri.parse(baseURL + 'api/login'), body: data);
    if(response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = (jsonDecode(response.body) as Map<String,dynamic>);
      if(jsonResponse["status"] == 200) {
        setState(() {
          _isLoading = false;
        });
        await pref.setString("token", jsonResponse["data"]["token"]);
        await pref.setString("email", email);
        await pref.setBool("is_login", true);
        var emailku = pref.getString("email") as String;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => User.withId(emailku)));
        // showAlertBerhasil();
      }else if(jsonResponse["status"] == 500){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          headerAnimationLoop: true,
          title: 'Login Gagal',
          desc:'Silahkan periksa email dan password Anda.',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red,
        ).show();
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  doRegistrasi(username, namalengkap, email, password, password2) async {
    var data = {
      'kode_user': "KU0002",
      'email': email,
      'nama_lengkap': namalengkap,
      'username': username,
      'password': password,
    };
    bool res = await CallApi().postData(data, 'users', context);
    Navigator.pop(context);
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin) {
      var emailku = pref.getString("email") as String;
      // Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => User.withId(emailku)));
    }else{
      showBottomSheetLogin();
    }
  }

  Future<void> loadDataDongeng() async {
    var dataURL = Uri.parse(baseURL + 'cerita/Dongeng');
    http.Response response = await http.get(dataURL);

    setState(() {
      widgetsDongeng = jsonDecode(response.body);
    });
  }

  Future<void> loadDataNovel() async {
    var dataURL = Uri.parse(baseURL + 'cerita/Novel');
    http.Response response = await http.get(dataURL);

    setState(() {
      widgetsNovel = jsonDecode(response.body);
    });
  }

  Future<void> loadDataCerpen() async {
    var dataURL = Uri.parse(baseURL + 'cerita/Cerpen');
    http.Response response = await http.get(dataURL);

    setState(() {
      widgetsCerpen = jsonDecode(response.body);
    });
  }

  Future<void> loadDataBiografi() async {
    var dataURL = Uri.parse(baseURL + 'cerita/Biografi');
    http.Response response = await http.get(dataURL);

    setState(() {
      widgetsBiografi = jsonDecode(response.body);
    });
  }

  void _onItemTapped(int index) {
    // setState(() {
    _selectedIndex = index;
    if (index == 0) {
      showHomePage();
    } else if (index == 1) {
      showFavorite();
    } else if (index == 2) {
      showAboutApp();
    } else if (index == 3) {
      checkLogin();
    }
    // });
  }

  void showHomePage() {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));

    Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
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
        .push(MaterialPageRoute(builder: (context) => User()));
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
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Masukkan email yang valid'
                              : null,
                      controller: txtLoginEmail,
                      onSaved: (String? val) {
                        txtLoginEmail.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: "Masukkan Email",
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: true,
                      validator: (String? arg) {
                        if (arg == null || arg.isEmpty) {
                          return 'Password harus diisi';
                        } else {
                          return null;
                        }
                      },
                      controller: txtLoginPassword,
                      onSaved: (String? val) {
                        txtLoginPassword.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: 'Masukkan Password',
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
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
                            // Navigator.pop(context);
                            // showUser();
                            _validateInputs();
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
                                side:
                                    const BorderSide(color: Color(0xFF6A2B84))),
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
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Masukkan email yang valid'
                              : null,
                      controller: txtRegEmail,
                      onSaved: (String? val) {
                        txtRegEmail.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      validator: (String? arg) {
                        if (arg == null || arg.isEmpty) {
                          return 'Username harus diisi';
                        } else {
                          return null;
                        }
                      },
                      controller: txtRegUser,
                      onSaved: (String? val) {
                        txtRegUser.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Username',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: "Username",
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.account_circle_outlined,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      validator: (String? arg) {
                        if (arg == null || arg.isEmpty) {
                          return 'Nama lengkap harus diisi';
                        } else {
                          return null;
                        }
                      },
                      controller: txtRegNama,
                      onSaved: (String? val) {
                        txtRegNama.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nama Lengkap',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: "Nama Lengkap",
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.account_circle_outlined,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                          const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: true,
                      validator: (String? arg) {
                        if (arg == null || arg.isEmpty) {
                          return 'Password harus diisi';
                        } else {
                          return null;
                        }
                      },
                      controller: txtRegPass1,
                      onSaved: (String? val) {
                        txtRegPass1.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: true,
                      validator: (String? arg) {
                        if (arg == null || arg.isEmpty) {
                          return 'Password harus diisi';
                        } else {
                          return null;
                        }
                      },
                      controller: txtRegPass2,
                      onSaved: (String? val) {
                        txtRegPass2.text = val!;
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukan Password Kembali',
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 12),
                        labelText: 'Ulangi Password',
                        labelStyle: const TextStyle(color: Color(0xFF6A2B84)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF6A2B84),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF6A2B84), width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF6A2B84)),
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black54)),
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
                          onPressed: () {
                            _validateRegister();
                          },
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
          ),
        );
      },
    );
  }

  void showAlertBerhasil(){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      headerAnimationLoop: true,
      title: 'Login Berhasil',
      desc: 'Silahkan mengakses menu yang tersedia.',
      btnOkOnPress: () {
        Navigator.pop(context);
        showHomePage();
      },
      btnOkIcon: Icons.cancel,
    ).show();
  }

  void _pencarian() {
    setState(() {
      if (customIcon.icon == Icons.search) {
        customIcon = const Icon(Icons.cancel);
        customTitle = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          title: TextField(
            controller: _searchQuery,
            decoration: const InputDecoration(
              hintText: 'tuliskan judul cerita...',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      } else {
        customIcon = const Icon(Icons.search);
        customTitle = const Text('Cerita Indonesia',
            style: TextStyle(fontFamily: 'PoppinsMedium'));
      }
    });
  }
}
