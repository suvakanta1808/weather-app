import 'package:flutter/material.dart';

class AirComponent extends StatelessWidget {
  final String label;
  final double data;

  AirComponent({
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      height: 42,
      width: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: Text(
              data.toString(),
              style:
                  TextStyle(fontSize: 17, color: Colors.greenAccent.shade400),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FittedBox(child: Text(label)),
        ],
      ),
    );
  }
}
