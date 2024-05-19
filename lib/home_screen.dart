import 'dart:convert';

import 'package:dropdownfield2/dropdownfield2.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class precheck extends StatefulWidget {
  const precheck({super.key});

  @override
  State<precheck> createState() => _precheck();
}

class _precheck extends State<precheck> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _LVController = TextEditingController();
  TextEditingController _ModelController = TextEditingController();
  TextEditingController _KMController = TextEditingController();
  TextEditingController _TGLController = TextEditingController();
  TextEditingController _DriverController = TextEditingController();
  TextEditingController _JDEController = TextEditingController();
  final _deptController = TextEditingController();
  final _siteController = TextEditingController();

  // opsi? grupr1;
  // var _satuValue = TextEditingController();
  // final _duaValue = TextEditingController();
  // final List<String> satu = ['a1', 'a2'];
  // final List<String> dua = ['b1', 'b2'];

  String drop_deptvalue = '';
  String drop_sitevalue = '';

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
                  padding: const EdgeInsets.all(20.0),
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
                    margin: const EdgeInsets.all(10.0),
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
                              decoration: const InputDecoration(
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
                    teks: "Pengemudi (Driver)",
                    control: _DriverController,
                    hint: "Your answer"),
                teksform(
                    teks: "No. JDE",
                    control: _JDEController,
                    hint: "Your answer"),
                Container(
                    // height: 125,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Teks_List('Departement'),
                        SizedBox(
                            width: double.infinity,
                            child: DropDownField(
                              controller: _deptController,
                              hintText: "Select any Department",
                              items: dept,
                              onValueChanged: (value) {
                                setState(() => drop_deptvalue = value);
                              },
                            ))
                      ],
                    )),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Teks_List('Site'),
                        SizedBox(
                            width: double.infinity,
                            child: DropDownField(
                              controller: _siteController,
                              hintText: "Select any Site",
                              items: site,
                              onValueChanged: (value) {
                                setState(() => drop_sitevalue = value);
                              },
                            ))
                      ],
                    )),
                // Container(
                //     width: double.infinity,
                //     margin: EdgeInsets.all(10.0),
                //     decoration: BoxDecoration(
                //         color: Colors.white54,
                //         borderRadius: BorderRadius.circular(20)),
                //     child: Column(children: <Widget>[
                //       Teks_List(
                //           "1. Periksa Kerusakan Badan Mobil (Check for Body Damage) ?"),
                //       // Container(
                //       //     child: MyRadio(
                //       //         group: grupr1,
                //       //         value: opsi.a1,
                //       //         onChanged: (value) =>
                //       //             setState(() => grupr1 = value)))
                //     ])),
                // Container(
                //   height: 125,
                //   width: double.infinity,
                //   margin: const EdgeInsets.all(10.0),
                //   decoration: BoxDecoration(
                //       color: Colors.white54,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Column(
                //     children: <Widget>[
                //       Teks_List("2. Periksa Seluruh Roda (Check All Tyres) ?"),
                //       const Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //       )
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveFormData();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                )
              ]),
        ));
  }

  Widget Teks_List(teks) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              teks,
              style: const TextStyle(color: Colors.black54, fontSize: 15),
            )));
  }

  // Widget myRadio({(TextEditingController control), value, grup}){
  //   return Radio(
  //     value: value,
  //     groupValue: grup,
  //     onChanged: (value) => setState(() => grup = value),
  //   );
  // }

  Widget teksform({teks, control, hint}) {
    return Container(
      height: 125,
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
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
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 15)),
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

  Future<List<data_model>?> _saveFormData() async {
    if (_formKey.currentState!.validate()) {
      // Instantiate DataModel with the entered data
      data_model data = data_model(
          lv: _LVController.text,
          model: _ModelController.text,
          km: _KMController.text,
          tgl: _TGLController.text,
          driver: _DriverController.text,
          jde: _JDEController.text,
          sdept: _deptController.text,
          ssite: _siteController.text);

      final String jsonData = jsonEncode(data);

      final Uri apiUrl = Uri.parse("http://103.215.25.253:5000/receive_data");
      final http.Response respond = await http.post(apiUrl,
          headers: {'Content-type': 'application/json'}, body: jsonData);

      // await _writetocsv(data);

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

      if (respond.statusCode == 200) {
        return modelFromJson(respond.body);
      } else {
        return null;
      }
    }

    _DriverController.clear();
    _JDEController.clear();
    _KMController.clear();
    _LVController.clear();
    _ModelController.clear();
    _TGLController.clear();
    _siteController.clear();
    _deptController.clear();
    return null;
  }

  // Future<void> _writetocsv(data_model data) async {
  //   try {
  //     final directory = await getExternalStorageDirectory();
  //     final file = File('${directory?.path}/data_p2h.csv');

  //     bool fileExists = await file.exists();
  //     if (!fileExists) {
  //       file.writeAsString(
  //           'lv,model,km,tanggal,driver,jde_no,department,site\n');
  //     }

  //     String csvRow =
  //         '${data.lv},${data.model},${data.km},${data.tgl},${data.driver},${data.jde},${data.sdept},${data.ssite}\n';
  //     file.writeAsStringSync(csvRow, mode: FileMode.append);
  //   } catch (e) {
  //     print('Error writing to file: $e');
  //   }
  // }
}
