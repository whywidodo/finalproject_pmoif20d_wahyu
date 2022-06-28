import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SampleBacaanGratis extends StatefulWidget {
  const SampleBacaanGratis({Key? key}) : super(key: key);

  @override
  _SampleBacaanGratisState createState() => _SampleBacaanGratisState();
}
class _SampleBacaanGratisState extends State<SampleBacaanGratis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Malin Kundang',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
      ),
      body: ListView(scrollDirection: Axis.vertical,
          children: [
            Container(
                height: 200,
                color: Color(0xFF6A2B84),
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    const Text('Malin Kundang',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 18
                        )),
                    Image.asset('assets/images/ceria256white.png', width: 20),
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text(
                          'Pada zaman dahulu di sebuah perkampungan nelayan Pantai Air Manis di daerah Padang, Sumatera Barat hiduplah seorang janda bernama Mande Rubayah bersama seorang anak laki-lakinya yang bernama Malin Kundang. Mande Rubayah amat menyayangi dan memanjakan Malin Kundang. Malin adalah seorang anak yang rajin dan penurut.Mande Rubayah sudah tua, ia hanya mampu bekerja sebagai penjual kue untuk mencupi kebutuhan ia dan anak tunggalnya. Suatu hari, Malin jatuh-sakit. Sakit yang amat keras, nyawanya hampir melayang namun akhirnya ia dapat diseiamatkan-berkat usaha keras ibunya, Setelah sembuh dari sakitnya ia semakin disayang. Mereka adalah ibu dan anak yang saling menyayangi. Kini, Malin sudah dewasa ia meminta izin kepada ibunya untuk pergi merantau ke kota, karena saat itu sedang ada kapal besar merapat di Pantai Air Manis. “Baiklah, ibu izinkan. Cepatlah kembali, ibu akan selalu menunggumu Nak,” kata ibunya sambil menangis. Meski dengan berat hati akhirnya Mande Rubayah mengizinkan anaknya pergi. Kemudian Malin dibekali dengan nasi berbungkus daun pisang sebanyak tujuh bungkus, “Untuk bekalmu di perjalanan,” katanya sambil menyerahkannya pada Malin. Setelah itu berangkatiah Malin Kundang ke tanah rantau meninggalkan ibunya sendirian.Hari-hari terus berlalu, hari yang terasa lambat bagi Mande Rubayah. Setiap pagi dan sore Mande Rubayah memandang ke laut, “Sudah sampai manakah kamu berlayar Nak?” tanyanya dalam hati sambil terus memandang laut. la selalu mendo’akan anaknya agar selalu selamat dan cepat kembali.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'PoppinsMedium',
                              height: 2,
                              wordSpacing: 1.5
                          )),
                    ]
                )
            )
          ]
      )
    );
  }
}
//NILA