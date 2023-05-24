import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'vsi2k4.assessment2.';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              MyForm(),
              MySwitches(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  int _selectedCondition = 1;

  @override
  Widget build(BuildContext context) {
    final firstController = TextEditingController();
    final secondController = TextEditingController();
    final thirdController = TextEditingController();

    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  labelText: 'Nama Barang',
                ),
                controller: firstController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                maxLines: 4,
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  labelText: 'Deskripsi',
                ),
                controller: secondController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                style: const TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  labelText: 'Harga',
                ),
                controller: thirdController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Kondisi barang'),
                  Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _selectedCondition,
                  onChanged: (value) {
                    setState(() {
                      _selectedCondition = value as int;
                    });
                  },
                ),
                const Text('Baru'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _selectedCondition,
                  onChanged: (value) {
                    setState(() {
                      _selectedCondition = value as int;
                    });
                  },
                ),
                const Text('Bekas'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MySwitches extends StatefulWidget {
  const MySwitches({Key? key}) : super(key: key);

  @override
  _MySwitchesState createState() => _MySwitchesState();
}

class _MySwitchesState extends State<MySwitches> {
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Pengiriman dalam kota saja'),
              ),
            ),
            Switch(
              value: _isSwitched1,
              onChanged: (value) {
                setState(() {
                  _isSwitched1 = value;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Menerima retur'),
              ),
            ),
            Switch(
              value: _isSwitched2,
              onChanged: (value) {
                setState(() {
                  _isSwitched2 = value;
                });
              },
            ),
          ],
        ),
        Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('PUBLIKASIKAN'),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  ),
                  onPressed: () {
                  },
                ))
      ],
    );
  }
}
