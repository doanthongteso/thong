//import 'package:cookiez/CarouselSlider.dart'; // banneer
//import 'package:cookiez/screens/RecipeDetails.dart';  //chi tiết công thức
import 'package:flutter/material.dart';

import '../CarousSlider.dart';
import 'detailGift.dart';

class HomePage extends StatelessWidget {
  final dynamic data;
  final dynamic userProfile;
  const HomePage({this.data, this.userProfile});

  @override
  Widget build(BuildContext context) {
    List<RecipeButton> hotRecipeList = [];
    List<RecipeButton> cardRecipeList = [];
    List<RecipeButton> newRecipeList = [];
    // print(data);
    data["gifts"].forEach((item) {
      if (item["category"] == "Card") {
        cardRecipeList.add(RecipeButton(data: item));
      } else if (item["category"] == "Hot") {
        hotRecipeList.add(RecipeButton(data: item));
      } else if (item["category"] == "New") {
        newRecipeList.add(RecipeButton(data: item));
      }
    });
    // print(data["gifts"][0]);
    print(userProfile);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text("${userProfile["totalPoint"]} Point"),
          ),
          CarouseSliderHome(),
          Column(
            children: [
              HorizListCard(
                  title: 'Quà tặng hấp dẫn', recipeList: hotRecipeList),
              Container(
                height: 15,
              ),
              HorizListCard(title: 'Quà tặng mới', recipeList: hotRecipeList),
              Container(
                height: 15,
              ),
              HorizListCard(
                  title: 'Thẻ cào điện thoại', recipeList: cardRecipeList),
            ],
          ),
        ],
      ),
    );
  }
}

class HorizListCard extends StatelessWidget {
  const HorizListCard({required this.title, required this.recipeList});

  final List<RecipeButton> recipeList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHorizontalScroll(
          title: this.title,
        ),
        Container(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: recipeList,
          ),
        ),
      ],
    );
  }
}

class TitleHorizontalScroll extends StatelessWidget {
  TitleHorizontalScroll({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
      },
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 24,
          )
        ],
      ),
    );
  }
}

class RecipeButton extends StatelessWidget {
  final dynamic data;
  const RecipeButton({this.data});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipeDetails()),
          );
        },
        child: RecipeItem(data: data));
  }
}

class RecipeItem extends StatelessWidget {
  final dynamic data;
  const RecipeItem({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Column(
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data["imgUrl"]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data["name"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 2.5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data["vendor"],
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.blueGrey),
                  ),
                ),
                Container(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.money,
                          size: 16,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          data["point"].toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.orangeAccent,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          data["totalCount"].toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                      child: Text(
                        'Tốt cho sức khỏe',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.green,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
