import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  // runApp( LoadingImageApp());
  // runApp( IconApp());
  runApp(ButtonApp());
}

class ButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Buttons Demo",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: ButtonsWidget(),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Row iconButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => debugPrint('IconButton pressed')),
        Text("Icon Button")
      ],
    );

    Row outLineButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
            child: const Text("OutlinedButton"),
            onPressed: () => debugPrint('OutlinedButton pressed')),
        const Text("OutlinedButton_Text")
      ],
    );

    Row dropDownButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton(
            items: ['Men', 'Women'].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.blue),),
              );
            }).toList(),
            onChanged: (value) => debugPrint('Changed: $value')),
        const Text("DropdownButton_Text")
      ],
    );

    Row backButton = const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [BackButton(), Text("BackButton")],
    );

    Row closeButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CloseButton(
          onPressed: () => debugPrint('CloseButton pressed'),
        ),
        Text("CloseButton")
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Buttons"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconButton,
            outLineButton,
            dropDownButton,
            backButton,
            closeButton
          ],
        )));
  }
}

class IconApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icons',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: IconsWidget(),
    );
  }
}

class IconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Row addIconDefault = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.add), Text('Size is 24 dp with default color')],
    );
    Row addIcon48DpDefaultColor = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add, size: 48),
        Text('Size is 48 dp with default color')
      ],
    );
    Row addIcon48DpRedColor = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          size: 48,
          color: Colors.red,
        ),
        Text('Size is 48 dp with red color')
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          addIconDefault,
          addIcon48DpDefaultColor,
          addIcon48DpRedColor
        ],
      ),
    );
  }
}

class LoadingImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
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
            image:
                'http://archivision.com/educational/samples/files/1A2-F-P-I-2-C1_L.jpg'),
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
