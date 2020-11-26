import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(home: new Main()));

class Main extends StatelessWidget {
  double year,
      month,
      comOnion,
      comPotato,
      comSoyabean,
      comTomato,
      comWheat,
      redNanital,
      average,
      sort1,
      deshi,
      desi,
      lokwan,
      onion,
      other,
      sup,
      yellow,
      lok1;

//METHOD TO PREDICT PRICE
  Future<String> predictPrice(var body) async {
    var client = new http.Client();
    var uri = Uri.parse("https://crop-price-prediction.herokuapp.com/predict");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      // var resp = await http.get(Uri.parse("http://192.168.1.101:40635"));
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print(json.decode(resp.body));
        print(result["prediction"]);
        if (result == null) {
          print("Error");
        }
        return result["prediction"];
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
    print("Error");
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Year',
                  ),
                  onChanged: (val) {
                    year = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter month',
                  ),
                  onChanged: (val) {
                    month = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Com_Potato',
                  ),
                  onChanged: (val) {
                    comPotato = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Com_Onion',
                  ),
                  onChanged: (val) {
                    comOnion = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Com_Soyabean',
                  ),
                  onChanged: (val) {
                    comSoyabean = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Com_Tomato',
                  ),
                  onChanged: (val) {
                    comTomato = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Com_Wheat',
                  ),
                  onChanged: (val) {
                    comWheat = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter (Red Nanital)',
                  ),
                  onChanged: (val) {
                    redNanital = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter 147 Average',
                  ),
                  onChanged: (val) {
                    average = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter 1st Sort',
                  ),
                  onChanged: (val) {
                    sort1 = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Deshi',
                  ),
                  onChanged: (val) {
                    deshi = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Desi',
                  ),
                  onChanged: (val) {
                    desi = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Lok-1',
                  ),
                  onChanged: (val) {
                    lok1 = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Lokwan',
                  ),
                  onChanged: (val) {
                    lokwan = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Onion',
                  ),
                  onChanged: (val) {
                    onion = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Other',
                  ),
                  onChanged: (val) {
                    other = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter sup',
                  ),
                  onChanged: (val) {
                    sup = double.parse(val);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Yellow',
                  ),
                  onChanged: (val) {
                    yellow = double.parse(val);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    // var body = [
                    //   {
                    //     "year": year,
                    //     "month": month,
                    //     "Com__Onion": comOnion,
                    //     "Com__Potato": comPotato,
                    //     "Com__Soyabean": comSoyabean,
                    //     "Com__Tomato": comTomato,
                    //     "Com__Wheat": comWheat,
                    //     "(Red Nanital)": redNanital,
                    //     "147 Average": average,
                    //     "1st Sort": sort1,
                    //     "Deshi": deshi,
                    //     "Desi": desi,
                    //     "Lok-1": lok1,
                    //     "Lokwan": lokwan,
                    //     "Onion": onion,
                    //     "Other": other,
                    //     "Sup": sup,
                    //     "Yellow": yellow
                    //   }
                    // ];
                    // var body = [
                    //   {
                    //     "year": 0.3,
                    //     "month": 0.5,
                    //     "Com__Onion": 0.8,
                    //     "Com__Potato": 0.6,
                    //     "Com__Soyabean": 0.3,
                    //     "Com__Tomato": 0.6,
                    //     "Com__Wheat": 0.7,
                    //     "(Red Nanital)": 0.9,
                    //     "147 Average": 1.0,
                    //     "1st Sort": 1.0,
                    //     "Deshi": 0.4,
                    //     "Desi": 0.5,
                    //     "Lok-1": 0.4,
                    //     "Lokwan": 0.3,
                    //     "Onion": 0.5,
                    //     "Other": 0.3,
                    //     "Sup": 0.3,
                    //     "Yellow": 0.5
                    //   }
                    // ];
                    var body = [
                      {
                        "f0": 0.3,
                        "f1": 0.5,
                        "f2": 0.8,
                        "f3": 0.6,
                        "f4": 0.3,
                        "f5": 0.6,
                        "f6": 0.7,
                        "f7": 0.9,
                        "f8": 1.0,
                        "f9": 1.0,
                        "f10": 0.4,
                        "f11": 0.5,
                        "f12": 0.4,
                        "f13": 0.3,
                        "f14": 0.5,
                        "f15": 0.3,
                        "f16": 0.3,
                        "f17": 0.5
                      }
                    ];
                    print(body);
                    var resp = await predictPrice(body);
                    _onBasicAlertPressed(context, resp);
                  },
                  child: Text("Get price"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//function from rflutter pkg to display alert
_onBasicAlertPressed(context, resp) {
  Alert(context: context, title: "Predicted price", desc: resp).show();
}
