import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.only(top: 60.0, left: 40.0),
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Row(textDirection: TextDirection.ltr, children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 160.0, left:40.0),
                child: Text(
              "Hey there!\nI\'m Flutter\nMade by Google",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 32.0,
                color: Colors.black,
                fontFamily: 'ProductSans',
              ),
            ))
          ]),
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              FloatingButton(),
            ],
          )
        ],
      ),
    ));
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 60.0,
      margin: EdgeInsets.only(top: 30.0, left: 40.0,bottom: 20.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: RaisedButton(
            color: Colors.blueAccent,
            elevation: 6.0,
            child: Text(
              "Let\'s Start!",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.w300,
                  fontSize: 22.0),
            ),
            onPressed: () => showAlert(context)),
      ),
    );
  }

  showAlert(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Disclaimer!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.blue,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.w300,
              fontSize: 32.0)),
      content: Text(
          "This is just a trailer!\nPicture abhi baaki hai mere dost...😉",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.w300,
              fontSize: 22.0)),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
