import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/widgets/myDropDowns.dart';

class AddAddress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Color(0xfff0f5f5),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ),
        title: Text(
          'Add New Card',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,10.0),
                child: Text(
                    'Select Type',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              MyDropDowns(),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,10.0),
                child: Text(
                  'Address Line 1 *',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15.0,5.0,25.0,5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(15.0,15.0,15.0,15.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,10.0),
                child: Text(
                  'Address Line 2 (Optional)',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15.0,5.0,25.0,5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(15.0,15.0,15.0,15.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mobile number *',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Post Code *',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 0.0),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 25.0, 25.0, 0.0),
                  height: 90.0,
                  child: RaisedButton(
                    onPressed: (){},
                    child: Text(
                      'Save Address',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
