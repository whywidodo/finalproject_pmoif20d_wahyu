
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map> myProducts =
  List.generate(20, (index) => {"id": index, "name": "Cerita $index"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/ceria256white.png')
          ),
          centerTitle: true,
          title: Text ('Cerita Indonesia'),
          backgroundColor: Color(0xFF6A2B84),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.search))
          ],
      ),
      body:
          Padding(
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
                    child: Text(myProducts[index]["name"]),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 1, offset: Offset(0, 1),),]
                      ),
                  );
            }),
          ),
    );
  }
}
