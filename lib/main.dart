import 'package:flutter/material.dart';
import 'package:flutter_depolama/Kisiler.dart';
import 'package:flutter_depolama/kisilerdao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> kisileriGoster() async {
    var liste = await kisilerdao().tumKisiler();

    for (Kisiler k in liste) {
      print("******************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
    }
  }

  Future<void> ekle() async {
    await kisilerdao().kisiEkle("İbo", 41);
  }

  Future<void> sil() async {
    await kisilerdao().kisiSil(7);
  }

  Future<void> guncelle() async {
    await kisilerdao().kisiGuncelle(6, "Liva", 22);
  }

  Future<void> kontrol() async {
    int sonuc = await kisilerdao().kayitKontrol("Liva");
    print("Veritabanındaki Liva sayısı: $sonuc");
  }

  Future<void> birKisiGetir() async {
    var kisi = await kisilerdao().kisiGetir(1);

    print("*****************");
    print("Kişi id: ${kisi.kisi_id}");
    print("Kişi adı: ${kisi.kisi_ad}");
    print("Kişi yaş: ${kisi.kisi_yas}");
  }

  Future<void> aramaYap() async {
    var liste = await kisilerdao().kisiArama("a");

    for (Kisiler k in liste) {
      print("******************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
    }
  }

  Future<void> randomIkiKisiGetir() async {
    var liste = await kisilerdao().ikiKisiGetirme();

    for (Kisiler k in liste) {
      print("******************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ekle();
    //sil();
    //guncelle();
    //birKisiGetir();
    //kontrol();
    //ekle();
    //aramaYap();
    randomIkiKisiGetir();
    //kisileriGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ));
  }
}
