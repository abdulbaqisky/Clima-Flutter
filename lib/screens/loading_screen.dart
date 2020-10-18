import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print('This line is triggered');
  }

  void getLocation() async {
    Location location = Location();

    await location.getLocation();
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {
    http.Response response =
        await http.get('https://samples.openweathermap.org/data/2'
            '.5/weather?lat=35&lon=139&appid=1a5bcd7476da8a7f120b3f718d659be5');
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
