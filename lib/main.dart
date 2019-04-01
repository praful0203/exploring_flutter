import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: SiForm(),
      theme: ThemeData(
          fontFamily: 'ProductSans',
          brightness: Brightness.dark,
          accentColor: Colors.grey,
          primaryColor: Colors.black,
          primaryColorDark: Colors.black),
      title: "Simple Interest Calculator",
      debugShowCheckedModeBanner: false,
    ));

class SiForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SiFormState();
  }
}

class _SiFormState extends State<SiForm> {
  var _currencies = ['Select currency', 'Rupees', 'Dollars', 'Euros', 'Pounds'];
  var _selectedCurrency = '';
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _selectedCurrency = _currencies[0];
    super.initState();
  }

  var _displayTotalInterest = '';
  TextEditingController pricipleEditingController = new TextEditingController();
  TextEditingController roiController = new TextEditingController();
  TextEditingController termController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //resizeToAvoidBottomPadding: false,
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                TextFormField(
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  controller: pricipleEditingController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter principle amount';
                    }
                  },
                  decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Principle',
                      hintText: 'Enter principle e.g. 12000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      controller: roiController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter rate of interest';
                        }
                      },
                      decoration: InputDecoration(
                          labelStyle: textStyle,
                          labelText: 'Rate of Interest',
                          hintText: 'In percent',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 0.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          style: textStyle,
                          keyboardType: TextInputType.number,
                          controller: termController,
                          validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter term';
                        }
                      },
                          decoration: InputDecoration(
                              labelText: 'Term',
                              labelStyle: textStyle,
                              hintText: 'Time in years',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                        Container(
                          width: 25.0,
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _selectedCurrency,
                            onChanged: (String newSelectedValue) {
                              _OnItemSelected(newSelectedValue);
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.white,
                          textColor: Colors.black,
                          child: Text("Calculate", textScaleFactor: 1.2),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this._displayTotalInterest =
                                    _calculateTotalInterest();
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.white,
                          textColor: Colors.black,
                          child: Text("Reset", textScaleFactor: 1.2),
                          onPressed: () {
                            _reset();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(_displayTotalInterest),
                )
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/spider_logo.jpg');
    Image image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );

    return Container(padding: EdgeInsets.all(15.0), child: image);
  }

  void _OnItemSelected(String newSelectedValue) {
    setState(() {
      this._selectedCurrency = newSelectedValue;
    });
  }

  String _calculateTotalInterest() {
    double principle = double.parse(pricipleEditingController.text);
    double term = double.parse(termController.text);
    double roi = double.parse(roiController.text);

    double totalInterest = principle + (principle * term * roi) / 100;

    String result =
        'After $term years, your investment will worth $totalInterest $_selectedCurrency';
    return result;
  }

  void _reset() {
    pricipleEditingController.text = '';
    roiController.text = '';
    termController.text = '';
    _selectedCurrency = _currencies[0];
    _displayTotalInterest = '';
  }
}
