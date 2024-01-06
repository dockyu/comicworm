import 'package:flutter/material.dart';
import '../bridge_generated.dart';

class TestScreen extends StatefulWidget {
  final RustImpl rust;

  TestScreen({Key? key, required this.rust}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late SimpleClass simpleClassInstance;

  @override
  void initState() {
    super.initState();
    _createSimpleClassInstance();
  }

  void _createSimpleClassInstance() async {
    simpleClassInstance = await widget.rust.createSimpleClass(property: "Test Property");
  }

  void _printProperty() async {
    await widget.rust.printSimpleClassProperty(classInstance: simpleClassInstance);
  }

  void _getProperty() async {
    String property = await widget.rust.getSimpleClassProperty(classInstance: simpleClassInstance);
    print("Property from Rust: $property");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _printProperty,
              child: Text('Print Property'),
            ),
            ElevatedButton(
              onPressed: _getProperty,
              child: Text('Get Property'),
            ),
            ElevatedButton(
              onPressed: () async {
                await widget.rust.ffiIncrementAndPrintCount();
              },
              child: Text('count++ & print'),
            ),

          ],
        ),
      ),
    );
  }
}
