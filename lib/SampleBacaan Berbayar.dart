import 'package:finalproject_pmoif20d_wahyu/PembelianCerita.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SampleBacaanBerbayar extends StatefulWidget {
  const SampleBacaanBerbayar({Key? key}) : super(key: key);

  @override
  _SampleBacaanBerbayarState createState() => _SampleBacaanBerbayarState();
}
class _SampleBacaanBerbayarState extends State<SampleBacaanBerbayar> {
  String text = 'Isi Text Sharing Ceritanya';
  String sub = 'Subjek Cerita';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ayat-ayat Cinta',
          style: TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: const Color(0xFF6A2B84),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: text.isEmpty ? null : () => _onShare(context),
          )
        ],
      ),
      body: ListView(scrollDirection: Axis.vertical,
      children: [
        Container(
            height: 200,
            color: Color(0xFF6A2B84),
            padding: EdgeInsets.only(top: 80),
            child: Column(
              children: [
                const Text('Ayat-ayat Cinta',
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
                    'Ini adalah kisah cinta. Tapi bukan cuma sekadar kisah cinta yang biasa. Ini tentang bagaimana menghadapi turun-naiknya persoalan hidup dengan cara Islam. Fahri bin Abdillah adalah pelajar Indonesia yang berusaha menggapai gelar masternya di Al-Azhar. Berjibaku dengan panas-debu Mesir. Berkutat dengan berbagai macam target dan kesederhanaan hidup. Bertahan dengan menjadi penerjemah buku-buku agama. Semua target dijalani Fahri dengan penuh antusias kecuali satu: menikah.Fahri adalah laki-laki taat yang begitu lurus. Dia tidak mengenal pacaran sebelum menikah. Dia kurang artikulatif saat berhadapan dengan makhluk bernama perempuan. Hanya ada sedikit perempuan yang dekat dengannya selama ini. Neneknya, Ibunya dan saudara perempuannya.Pindah ke Mesir membuat hal itu berubah. Tersebutlah Maria Girgis. Tetangga satu flat yang beragama Kristen Koptik tetapi mengagumi Alquran, cinta Maria hanya tercurah dalam diari saja.Lalu ada Nurul. Anak seorang kyai terkenal yang juga mengeruk ilmu di Al-Azhar. Sebenarnya Fahri menaruh hati pada gadis manis ini. Sayang rasa mindernya yang hanya anak keturunan petani membuatnya tidak pernah menunjukkan rasa apa pun pada Nurul. Sementara Nurul pun menjadi ragu dan selalu menebak-nebak.Setelah itu ada Noura, juga tetangga yang selalu disiksa Ayahnya sendiri. Fahri berempati penuh dengan Noura dan ingin menolongnya. Sayang hanya empati saja. Tidak lebih. Namun Noura yang mengharap lebih. Dan nantinya ini menjadi masalah besar ketika Noura menuduh Fahri memperkosanya.Terakhir muncullah Aisha. Si mata indah yang menyihir Fahri. Sejak sebuah kejadian di metro, saat Fahri membela Islam dari tuduhan kolot dan kaku, Aisha jatuh cinta pada Fahri. Dan Fahri juga tidak bisa membohongi hatinya.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'PoppinsMedium',
                          height: 2,
                          wordSpacing: 1.5
                      )
                  )
                ]
            )
        ),
        Container(
            margin: const EdgeInsets.all(25),
            child: Row(children: <Widget>[
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Color(0xFF6A2B84))
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Beli untuk cerita lengkap",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'PoppinsMedium',
                          color: Color(
                              0xFF6A2B84),
                        ))),
              ),
              Expanded(
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {Navigator.push(
                              context,
                            MaterialPageRoute(builder: (context) => PembelianCerita()),
                          );},
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(140, 40),
                              maximumSize: const Size(140, 40),
                              primary: Colors.purple,
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              textStyle: const TextStyle(
                                  fontFamily: 'PoppinsThin', fontSize: 12
                              )
                          ),
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 18,
                          ),
                        label: Text('Rp. 20.000,-'),
                      ),
                      SizedBox(
                        width: 25,
                      )
                    ],
                  ) )
            ])
        ),
      ],)
    );
  }
  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        text,
        subject: sub,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}


//NILA
