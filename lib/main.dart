import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: FavouriteCity(),
      debugShowCheckedModeBanner: false,
    ));

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavouriteCityState();
  }
}

class _FavouriteCityState extends State<FavouriteCity> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              //onChanged:  is used similar as of onTextChanged() in android
              onSubmitted: (String userInput) {
                setState(() {
                  cityName = userInput;
                });
              },
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Your best city is $cityName",
                  style: TextStyle(fontSize: 20.0, fontFamily: 'ProductSans'),
                ))
          ],
        ),
      ),
    );
  }
}
