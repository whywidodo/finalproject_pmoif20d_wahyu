import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map> myProducts =
  List.generate(20, (index) => {"id": index, "name": "Cerita $index"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
              child: Image.asset('assets/images/ceria256white.png')
          ),
          centerTitle: true,
          title: const Text ('Cerita Indonesia', style: TextStyle(fontFamily: 'PoppinsMedium'),),
          backgroundColor: const Color(0xFF6A2B84),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.search))
          ],
        bottom: PreferredSize(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Expanded(
                  child: Text('Dongeng', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'PoppinsMedium'),)
                ),
                Expanded(
                    child: Text('Novel', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'PoppinsMedium'),)
                ),
                Expanded(
                    child: Text('Cerpen', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'PoppinsMedium'),)
                ),
                Expanded(
                    child: Text('Biografi', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'PoppinsMedium'),)
                )
              ],
            )
          ),
          preferredSize: const Size.fromHeight(25),
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
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ceria256color.png'),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 1, offset: const Offset(0, 1)),
                        ],
                      ),

                    child: Text(myProducts[index]["name"]),
                  );
            }),
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6A2B84),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: "Favorit"),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: "Tentang"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profil"),
        ],
      ),
    );
  }
}
