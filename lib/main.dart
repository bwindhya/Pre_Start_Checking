import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const prestart_check());

const List<String> dept = [
  'Mine Operation Department',
  'Mine Engineer Department',
  'Plaint & Maintenance',
  'Healt Safety & Environment',
  'Warehouse',
  'Human Resource',
  'Construction',
  'Information Technology',
  'Cost Control',
  'Contract Mining'
];
const List<String> site = [
  'Asam-Asam',
  'West Kintap',
  'East Kintap',
  'Bengalon',
  'Balikpapan'
];

class prestart_check extends StatelessWidget {
  const prestart_check({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
            // title: Text('Pre Start Check PT. Darma Henwa'),
            title:
                Image.asset('assets/images/Logo_DH.png', fit: BoxFit.fitWidth)),
        body: const SafeArea(
          child: precheck(),
        ),
      ),
    );
  }
}

class precheck extends StatefulWidget {
  const precheck({super.key});

  @override
  State<precheck> createState() => _precheck();
}

class data_model {
  String lv;
  String model;
  String km;
  String tgl;
  String driver;
  String jde;

  data_model(
      {required this.lv,
      required this.model,
      required this.km,
      required this.tgl,
      required this.driver,
      required this.jde});

  Map<String, dynamic> toMap() {
    return {
      'lv': lv,
      'model': model,
      'km': km,
      'tgl': tgl,
      'driver': driver,
      'jde': jde
    };
  }
}

class _precheck extends State<precheck> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _LVController = TextEditingController();
  TextEditingController _ModelController = TextEditingController();
  TextEditingController _KMController = TextEditingController();
  TextEditingController _TGLController = TextEditingController();
  TextEditingController _DriverController = TextEditingController();
  TextEditingController _JDEController = TextEditingController();

  final List<String> satu = ['a1', 'a2'];
  final List<String> dua = ['b1', 'b2'];

  String drop_deptvalue = dept.first;
  String drop_sitevalue = site.first;

  String _satuValue = '';
  String _duaValue = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      // borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(20.0),
                  child: const Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pre Start Check List LV / BUS / ELF',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Jika ada item kerusakan unit pada bagian (BRAKE, STEERING, SEAT BEALT, dan RODA) maka unit tidak boleh dioperasikan serta segera laporkan ke pit control dan pengawas.',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '* Indicates required question',
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 125,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        Teks_List('Tanggal / Date'),
                        Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _TGLController,
                              decoration: InputDecoration(
                                  labelText: "DATE",
                                  prefixIcon: Icon(Icons.calendar_today)),
                              readOnly: true,
                              onTap: () => _selectDate(),
                            )
                          ],
                        )
                      ],
                    )),
                teksform(
                    teks: "No. Unit",
                    control: _LVController,
                    hint: "Contoh: LV2169, HURUF KAPITAL tanpa spasi"),
                teksform(
                    teks: "Model",
                    control: _ModelController,
                    hint: "Contoh: Hillux / Triton"),
                teksform(
                    teks: "KM", control: _KMController, hint: "Your answer"),
                teksform(
                    teks: "Pemgemudi (Driver)",
                    control: _DriverController,
                    hint: "Your answer"),
                teksform(
                    teks: "No. JDE",
                    control: _JDEController,
                    hint: "Your answer"),
                Container(
                    height: 125,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        Teks_List('Departement'),
                        Container(
                          width: double.infinity,
                          child: DropdownButton(
                            value: drop_deptvalue,
                            items: dept
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String? value) =>
                                setState(() => drop_deptvalue = value!),
                          ),
                        )
                      ],
                    )),
                Container(
                    height: 125,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        Teks_List('Site'),
                        Container(
                          width: double.infinity,
                          child: DropdownButton(
                            value: drop_sitevalue,
                            items: site
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String? value) =>
                                setState(() => drop_sitevalue = value!),
                          ),
                        )
                      ],
                    )),
                Container(
                  height: 125,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: <Widget>[
                      Teks_List(
                          "1. Periksa Kerusakan Badan Mobil (Check for Body Damage) ?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              value: satu[0],
                              groupValue: _satuValue,
                              onChanged: (value) =>
                                  setState(() => _satuValue = value!)),
                          const Text('Baik / Good'),
                          Radio(
                              value: satu[1],
                              groupValue: _satuValue,
                              onChanged: (value) =>
                                  setState(() => _satuValue = value!)),
                          const Text('Tidak Baik / Not Good')
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 125,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: <Widget>[
                      Teks_List("2. Periksa Seluruh Roda (Check All Tyres) ?"),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: dua[0],
                                groupValue: _duaValue,
                                onChanged: (value) =>
                                    setState(() => _duaValue = value!)),
                            const Text('Baik / Good'),
                            Radio(
                                value: dua[1],
                                groupValue: _duaValue,
                                onChanged: (value) =>
                                    setState(() => _duaValue = value!)),
                            const Text('Tidak Baik / Not Good')
                          ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveFormData();
                      }
                    },
                    child: Text('Submit'),
                  ),
                )
              ]),
        ));
  }

  Widget Teks_List(teks) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              teks,
              style: TextStyle(color: Colors.black54, fontSize: 15),
            )));
  }

  Widget teksform({teks, control, hint}) {
    return Container(
      height: 125,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          Teks_List(teks),
          Column(
            children: <Widget>[
              TextFormField(
                controller: control,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your $teks';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() => _TGLController.text = _picked.toString().split(" ")[0]);
    }
  }

  void _saveFormData() async {
    if (_formKey.currentState!.validate()) {
      // Instantiate DataModel with the entered data
      data_model data = data_model(
          lv: _LVController.text,
          model: _ModelController.text,
          km: _KMController.text,
          tgl: _TGLController.text,
          driver: _DriverController.text,
          jde: _JDEController.text);

      await _writetocsv(data);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Form Data saved'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                )
              ],
            );
          });
    }

    _DriverController.clear();
    _JDEController.clear();
    _KMController.clear();
    _LVController.clear();
    _ModelController.clear();
    _TGLController.clear();
  }

  Future<void> _writetocsv(data_model data) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/data.csv');

      bool fileExists = await file.exists();
      if (!fileExists) {
        file.writeAsString('lv,model,km,tgl,driver,jde\n');
      }

      String csvRow = '''${data.lv},${data.model},${data.km},${data.tgl},
        ${data.driver},${data.jde}\n''';
      file.writeAsStringSync(csvRow, mode: FileMode.append);
    } catch (e) {
      print('Error writing to file: $e');
    }
  }
}
