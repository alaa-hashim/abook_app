// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Please Wait"),
          content: SizedBox(
              height: 50, child: Center(child: CircularProgressIndicator())),
        );
      });
}
