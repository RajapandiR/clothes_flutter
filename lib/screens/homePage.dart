import 'package:clothes/screens/custombar.dart';
import 'package:flutter/material.dart';

import '../models/clothes.dart';
import 'cloth.dart';
import 'clothes.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tagList = ['Woman', 'T-Shirt', 'Dress'];
  final bottomList = ['home', 'menu', 'heart', 'user'];
  final clothesList = Clothes.generateClothes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Howdy, What Are You \nLooking For ? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: "👀", style: TextStyle(fontSize: 22))
                      ]))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0.1,
                                  blurRadius: 0.1,
                                  offset: Offset(0, 1))
                            ]),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle),
                          ))
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: "Search shirt",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              'assets/icons/search.png',
                              width: 20,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      'assets/icons/filter.png',
                      width: 15,
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: 
                  tagList.map((e) => Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Text(e, style: TextStyle(color: Colors.grey),),
                  )).toList()
                
              ),
            ),

            Padding(padding: EdgeInsets.only(left:20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New Arrival", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Text("View All", style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),),
                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                      )
                    ],
                  ),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left:20, top: 20, right: 20),
              child: Container(
                height: 280,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => 
                  GestureDetector(
                     onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ClothPage(cloth: clothesList[index])));
              },
                    child: ClothesIem(clothes: clothesList[index])),
                 separatorBuilder: (_, index) => SizedBox(width: 10,), itemCount: clothesList.length),
              ),
            ),            

            Padding(padding: EdgeInsets.only(left:20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best of Sell", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Text("View All", style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),),
                      SizedBox(width: 5,),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                      )
                    ],
                  ),

                ],
              ),
            ),

            Card(
              margin: EdgeInsets.only(left: 20, right: 20, top:20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/images/best1.png", width: 80,),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Miniso Woman Oversize", style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),),
                            Text("T-Shirt", style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),),
                            Text("\$78.88", style: TextStyle(fontWeight: FontWeight.bold, height: 1.5, color: Theme.of(context).primaryColor),),

                          ],
                        )
                        
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,

                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.favorite, color: Colors.red, size: 15,)))
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: bottomList.map((e) => 
            BottomNavigationBarItem(
              label: e,
              icon: Image.asset('assets/icons/$e.png', width: 25,))
          ).toList(),
        ),
        
        );
  }
}
