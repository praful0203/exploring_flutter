import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'ColorPicker test',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exploring Flutter"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB is working');
          },
          child: Icon(Icons.spa),
          tooltip: "Add an item",
        ),
        body: getListItems(),
      ),
      debugShowCheckedModeBanner: false,
    ));

//Using Listview in this manner is not recommended as it will consume more memory
getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.computer),
        title: Text("Dell"),
        subtitle: Text("Laptop"),
        trailing: Icon(Icons.chevron_right),
      ),
      ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("Helett Packard"),
        subtitle: Text("Laptop"),
        trailing: Icon(Icons.chevron_right),
      ),
      ListTile(
        leading: Icon(Icons.phone_android),
        title: Text("HTC"),
        subtitle: Text("Smartphone"),
        trailing: Icon(Icons.chevron_right),
      ),
      ListTile(
        leading: Icon(Icons.time_to_leave),
        title: Text("Waymo"),
        subtitle: Text("Automotive"),
        trailing: Icon(Icons.chevron_right),
      )
    ],
  );

  return listView;
}

//Convert data into widgets
Widget getListItems() {
  var listData = prepareDataSource();
//ListView.builder() works similar as Recyclerview in android, which is
// called only for those items which are visible in the current screen
  var listViewItems = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.widgets),
      title: Text(listData[index]),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        showSnackBar(context, index.toString());
      },
    );
  });
  return listViewItems;
}

//Generate Random strings
List<String> prepareDataSource() {
  var dataList = List<String>.generate(1000, (counter) => "Looks like it is Item $counter");
  return dataList;
}

//Show Snackbar
void showSnackBar(BuildContext context, String index) {
  var showSnackbar =SnackBar(
    content: Text("Item at position $index was clicked"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: () {
        debugPrint('UNDO for $index was clicked');
      },
    ),
  );

  Scaffold.of(context).showSnackBar(showSnackbar);
}
