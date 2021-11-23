import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final Function onpress;
  final IconData icon;
  final String title;

  MyBtn({this.onpress, this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton.icon(
          onPressed: onpress,
          icon: Icon(icon),
          label: Text(title),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            padding: EdgeInsets.all(12),
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
