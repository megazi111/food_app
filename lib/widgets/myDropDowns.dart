import 'package:flutter/material.dart';

class MyDropDowns extends StatefulWidget {
  @override
  _MyDropDownsState createState() => _MyDropDownsState();
}

class _MyDropDownsState extends State<MyDropDowns> {

  int _value = 1;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0,5.0,5.0,5.0),
      child: Container(
        width: MediaQuery.of(context).size.width*.90,
        padding: EdgeInsets.fromLTRB(15.0,1.0,5.0,1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text("Home"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Office"),
                value: 2,
              ),
            ],
            onChanged: (value){
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
