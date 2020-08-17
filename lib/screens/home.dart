import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/foodlist.dart';
import 'package:http/http.dart' as http;
import 'package:foodapp/widgets/circularProgressIndicator.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageUrl;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadFoodList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                    child: Text(
                        'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                    child: Text(
                        'View All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.green[300],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100.0,
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          horizontalImages('assets/images/burger.jpg','Burger'),
                          horizontalImages('assets/images/grill-chicken.jpg', 'Grill Chicken'),
                          horizontalImages('assets/images/pasta.jpg', 'Pasta'),
                          horizontalImages('assets/images/pizza.jpg', 'Pizza'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Special Offers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 200.0,
                      margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allFoodList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Column(
                            children: <Widget>[
                              Container(
                                child: allFoodList.contains(null) || isLoading == true || allFoodList.length <0 ? Center(child: circularProgress()) : specialOffers('assets/images/steak.jpg', allFoodList[index].foodName, "\$ "+allFoodList[index].price),
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.green[300],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150.0,
                      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey[200],
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            width: 110.0,
                            child: Image(
                              image: AssetImage('assets/images/steak.jpg'),
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                            child: Align(
                              alignment: Alignment(-1.0,-1.0),
                              child: Text(
                                'Subway Sandwich',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 5.0),
                                child: Align(
                                  alignment: Alignment(-1.0,-1.0),
                                  child: Text(
                                    '\$ 7.64',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                      color: Colors.green[300],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                                child: Align(
                                  alignment: Alignment(-1.0,-1.0),
                                  child: Text(
                                    '\$ 9.54',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.grey[400],
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 20.0,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 150.0,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey[200],
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            width: 110.0,
                            child: Image(
                              image: AssetImage('assets/images/steak.jpg'),
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                            child: Align(
                              alignment: Alignment(-1.0,-1.0),
                              child: Text(
                                'Subway Sandwich',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 5.0),
                                child: Align(
                                  alignment: Alignment(-1.0,-1.0),
                                  child: Text(
                                    '\$ 7.64',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                      color: Colors.green[300],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                                child: Align(
                                  alignment: Alignment(-1.0,-1.0),
                                  child: Text(
                                    '\$ 9.54',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.grey[400],
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 20.0,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    onPressed: (){},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget horizontalImages(String imageUrl, String mealName){
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage(imageUrl),
              width: 120.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 70.0, 0.0, 0.0),
            child: Text(
              mealName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget specialOffers(String offerImage, String itemName, String itemPrice){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: 150.0,
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[200],
              ),
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage(offerImage),
                alignment: Alignment(-1.0,-1.0),
                fit: BoxFit.contain,
              ),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 40.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.green[300],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
              child: Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120.0,
            child: Container(
              width: 150.0,
              height: 40.0,
              padding: EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
              child: Text(
                itemName,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 140.0,
            child: Container(
              width: 150.0,
              height: 40.0,
              padding: EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
              child: Text(
                itemPrice,
                style: TextStyle(
                  color: Colors.green[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 160.0,
            child: Container(
              width: 150.0,
              height: 40.0,
              padding: EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
              decoration: BoxDecoration(
                color: Color(0xffff4d88),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 170.0,
            left: 50.0,
            child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
              child: Text(
                'OFFER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FoodList> allFoodList = List();

  Future loadFoodList() async{
    setState(() {
      isLoading = true;
    });
    final response = await http.get("http://food.gono.xyz/api/v1/food/list");
    if(response.statusCode == 200){
      setState(() {
        isLoading = false;
      });
      var foodList = jsonDecode(response.body);
      for(var foodItems in foodList){
        allFoodList.add(FoodList.fromJson(foodItems));
      }
    }
    else{
      setState(() {
        isLoading = false;
      });
    }

    //print(allFoodList[0].foodName);
  }
}
