import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp( LoadingImageApp());
}

class LoadingImageApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: 'http://archivision.com/educational/samples/files/1A2-F-P-I-2-C1_L.jpg'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CarWidgetPage(title: 'Cars Widget'),
    );
  }
}

class CarWidgetPage extends StatelessWidget {
  const CarWidgetPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: const <Widget>[
          CarWidget('BMW', 'M3',
              'https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg'),
          CarWidget('Honda', 'CIVIC',
              'https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg'),
          CarWidget('Toyota', 'Corolla',
              'https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg')
        ],
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  final String _make;
  final String _model;
  final String _imageUrl;

  const CarWidget(this._make, this._model, this._imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrangeAccent)),
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Column(
                  children: [
                    Text("$_make $_model", style: TextStyle(fontSize: 24)),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image.network(_imageUrl),
                    )
                  ],
                ))));
  }
}
