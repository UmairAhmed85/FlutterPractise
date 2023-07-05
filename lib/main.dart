import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  // runApp( LoadingImageApp());
  // runApp( IconApp());
  // runApp(ButtonApp());
  // runApp(FlexAppDemo());
  // runApp(ListViewAppDemo());
  runApp(ListViewListTileApp());
}

class ListViewListTileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Listview with List Tiles";
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: ListViewListTileWidget(title),
    );
  }
}

class ListViewListTileWidget extends StatefulWidget {
  ListViewListTileWidget(this.title);

  final String title;

  @override
  State createState() {
    return _ListViewListTileState();
  }
}

class _ListViewListTileState extends State<ListViewListTileWidget> {
  int _selectedIndex = 0;
  static const TEXT_STYLE_NORMAL = const TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.normal);
  static const TEXT_STYLE_SELECTED = const TextStyle(
      color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);

  final TextFormField _fontSizeTextField = TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.format_size),
          hintText: 'Font Size',
          labelText: 'Enter the font size'));
  final TextFormField _historyTextFormField = TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.history),
          hintText: 'Days',
          labelText: 'Enter days'));
  final TextFormField _languageTextFormField = TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.language),
          hintText: 'Language',
          labelText: 'Enter your language'));

  select(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ListTile accessibilityListTile = ListTile(
        leading: Icon(Icons.accessibility),
        title: Text("Accessibility",
            style:
                _selectedIndex == 0 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL),
        subtitle: const Text("Accesibility Settings"),
        trailing: Icon(Icons.settings),
        onTap: () => select(0));
    final ListTile historyListTile = ListTile(
        leading: Icon(Icons.history),
        title: Text("History",
            style:
                _selectedIndex == 1 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL),
        subtitle: const Text("History Settings"),
        trailing: Icon(Icons.settings),
        onTap: () => select(1));
    final ListTile languageListTile = ListTile(
        leading: Icon(Icons.language),
        title: Text("Language",
            style:
                _selectedIndex == 2 ? TEXT_STYLE_SELECTED : TEXT_STYLE_NORMAL),
        subtitle: const Text("Language Settings"),
        trailing: Icon(Icons.settings),
        onTap: () => select(2));
    final String selectionTitle = (_selectedIndex == 0
            ? "Accessibility"
            : _selectedIndex == 1
                ? "History"
                : "Language") +
        " Settings";
    final TextFormField selectionTextFormField = _selectedIndex == 0
        ? _fontSizeTextField
        : _selectedIndex == 1
            ? _historyTextFormField
            : _languageTextFormField;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: ListView(children: <Widget>[
          accessibilityListTile,
          historyListTile,
          languageListTile
        ]),
        bottomSheet: Container(
            color: Color(0xFFB3E5FC),
            padding: EdgeInsets.all(20.0),
            child: Container(
                constraints: BoxConstraints(maxHeight: 200.0),
                child: Column(children: <Widget>[
                  Icon(Icons.settings),
                  Text(selectionTitle),
                  Expanded(child: selectionTextFormField)
                ]))));
  }
}

class ListViewAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Horizontal List";
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(width: 190, color: Colors.green),
              Container(width: 190, color: Colors.yellow),
              Container(width: 190, color: Colors.blue),
              Container(width: 190, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

class FlexAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flex Demo",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: FlexWidget("Flex"),
    );
  }
}

class FlexWidget extends StatefulWidget {
  FlexWidget(this.title) : super();
  final String title;

  @override
  _FlexWidgetState createState() => _FlexWidgetState();
}

class _FlexWidgetState extends State<FlexWidget> {
  final List<MainAxisAlignment> _alignments = [
    MainAxisAlignment.start,
    MainAxisAlignment.end,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
    MainAxisAlignment.spaceAround
  ];
  final List<String> _alignmentsText = [
    "Start",
    "End",
    "Center",
    "Space Between",
    "Space Evenly",
    "Space Around"
  ];
  bool _vertical = true;
  int _alignmentIndex = 0;

  RawMaterialButton red =
      RawMaterialButton(onPressed: () {}, elevation: 2, fillColor: Colors.red);
  RawMaterialButton blue =
      RawMaterialButton(onPressed: () {}, elevation: 2, fillColor: Colors.blue);
  RawMaterialButton green = RawMaterialButton(
      onPressed: () {}, elevation: 2, fillColor: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flex Layouts"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _vertical = !_vertical;
                });
              },
              icon: const Icon(Icons.rotate_right)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(_vertical ? "Vertical" : "Horizontal"),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _alignmentIndex++;
                  if (_alignmentIndex >= _alignments.length) {
                    _alignmentIndex = 0;
                  }
                });
              },
              icon: const Icon(Icons.aspect_ratio)),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(_alignmentsText[_alignmentIndex])),
          const Padding(
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
      body: Flex(
          direction: _vertical ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: _alignments[_alignmentIndex],
          children: [red, blue, green]),
    );
  }
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
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.blue),
                ),
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
