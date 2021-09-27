// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, null_check_always_fails

import 'package:flutter/material.dart';
import 'package:from_ui_app/Screens/detailes.dart';
import 'package:from_ui_app/classes/items.dart';

class Sreachdelegate extends StatefulWidget {
  @override
  _SreachdelegateState createState() => _SreachdelegateState();
}

class _SreachdelegateState extends State<Sreachdelegate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              showSearch(context: context, delegate: Sreach());
            }),
      ),
    );
  }
}

// ignore: must_be_immutable
class Sreach extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
            close(context, null);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) => null!;

  @override
  Widget buildSuggestions(BuildContext context) {
    List filtername =
        items.where((element) => element.name!.contains(query)).toList();
    return ListView.builder(
        itemCount: query == "" ? items.length : filtername.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Detailes(item: items[index]);
                }));
              },
              title: query == ""
                  ? Text("${items[index].name}")
                  : Text("${filtername[index].name}"));
        });
  }
}
