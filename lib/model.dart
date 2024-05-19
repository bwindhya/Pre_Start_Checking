import 'dart:convert';

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

class data_model {
  String lv;
  String model;
  String km;
  String tgl;
  String driver;
  String jde;
  String sdept;
  String ssite;

  data_model(
      {required this.lv,
      required this.model,
      required this.km,
      required this.tgl,
      required this.driver,
      required this.jde,
      required this.sdept,
      required this.ssite});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'lv': lv,
  //     'model': model,
  //     'km': km,
  //     'tgl': tgl,
  //     'driver': driver,
  //     'jde': jde,
  //     'dept': sdept,
  //     'ssite': ssite,
  //   };
  // }

  factory data_model.fromJson(Map<String, dynamic> map) {
    return data_model(
      lv: map["lv"],
      model: map["model"],
      km: map["km"],
      tgl: map["tgl"],
      driver: map["driver"],
      jde: map["jde"],
      sdept: map["dept"],
      ssite: map["site"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lv': lv,
      'model': model,
      'km': km,
      'tgl': tgl,
      'driver': driver,
      'jde': jde,
      'dept': sdept,
      'site': ssite,
    };
  }

  @override
  String toString() {
    return "data_model{lv: $lv, model: $model, km: $km, tgl: $tgl, driver: $driver, jde: $jde, dept: $sdept, site: $ssite}";
  }
}

// List<data_model> modelFromJson(String jsonData) {
// final List<dynamic> data = json.decode(jsonData);
// return List<data_model>.from(data.map((item) => data_model.fromJson(item)));
// return data.map((item) => data_model.fromJson(item)).toList();}

List<data_model> modelFromJson(String jsonData) {
  final dynamic data = json.decode(jsonData);

  // Check if the data is a list (array) or a map
  if (data is List) {
    return List<data_model>.from(data.map((item) => data_model.fromJson(item)));
  } else if (data is Map) {
    // Convert map keys to String and create a list with a single data_model object
    final convertedData =
        data.map((key, value) => MapEntry(key.toString(), value));
    return [data_model.fromJson(convertedData)];
  } else {
    throw FormatException("Invalid JSON format");
  }
}

String modelToJson(data_model data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
