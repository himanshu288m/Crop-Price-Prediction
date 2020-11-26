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
        print(result["prediction"]);
        return result["prediction"];
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
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
                    var body = [
                      {
                        "year": year,
                        "month": month,
                        "Com__Onion": comOnion,
                        "Com__Potato": comPotato,
                        "Com__Soyabean": comSoyabean,
                        "Com__Tomato": comTomato,
                        "Com__Wheat": comWheat,
                        "(Red Nanital)": redNanital,
                        "147 Average": average,
                        "1st Sort": sort1,
                        "Deshi": deshi,
                        "Desi": desi,
                        "Lok-1": lok1,
                        "Lokwan": lokwan,
                        "Onion": onion,
                        "Other": other,
                        "Sup": sup,
                        "Yellow": yellow
                      }
                    ];
                    /*body=[
                    {"bedrooms": 3, "bathrooms": 1, "sqft_living": 1180, "sqft_lot": 5650, "floors": 1, "waterfront": 0, "view": 0, "condition": 3, "grade": 7, "sqft_above": 1180, "sqft_basement": 0, "lat": 47.5112, "long": -122.257, "sqft_living15": 1340, "sqft_lot15": 5650}
                  ];*/
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
