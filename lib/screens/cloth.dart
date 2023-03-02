import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/clothes.dart';

class ClothPage extends StatefulWidget {
  final Clothes cloth;
  const ClothPage({super.key, required this.cloth});

  @override
  State<ClothPage> createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
 final CarouselController _controller = CarouselController();
 final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
 int currentPage = 0;
 int sizeListCurrent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 500,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) => {
                        setState((){
                          currentPage = index;
                        })
                      }),
                      // items: [],
                      items: widget.cloth.detailUrl.map((e) => Builder(builder: (context) => Container(
                        margin: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('$e'),
                        fit: BoxFit.fitHeight),
                        borderRadius: BorderRadius.circular(25)
                      ),)
                      )).toList()
                      
                      
                    
                    
                  ),
                ),
    
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.cloth.detailUrl.asMap().entries.map((e) => 
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(
                            currentPage == e.key  ? 0.9 : 0.4
                          )
                        ),
                      )
                    ).toList(),
                  )),
    
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 25, right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.9)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20,),
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(Icons.more_horiz,  color: Colors.grey, size: 20,),
                      )
                    ]),
                  )
              ],
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.cloth.title} ${widget.cloth.subTtile} ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.favorite, color: Colors.red, size: 15,),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star_border, color: Theme.of(context).primaryColor,),
                    Text("4.5 (2.7k)", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: [
                      TextSpan(
                        // text: "Rajapandi",
                        text: "Gucci Oversize Hoodie, a hoodie with the style of gucci made of soft silk fabric, and made with an oversized model according to today's times",
                        style: TextStyle(color: Colors.grey.withOpacity(0.6))
                      ),
                      TextSpan(
                        text: "Read More",
                        style: TextStyle(color: Theme.of(context).primaryColor)
                        )
                    ]),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    // padding: EdgeInsets.only(vertical: 10, horizontal: 25), 
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          setState(() {
                            sizeListCurrent = index;
                          });
                        },
                        child: Container(
                          // width: 50,
                          padding: EdgeInsets.all(10),
                          // padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.withOpacity(0.1) , width: 2),
                            color: sizeListCurrent == index ? Theme.of(context).accentColor : Colors.white
                          ),
                          child: Text(sizeList[index], style: TextStyle(color: sizeListCurrent == index ? Theme.of(context).primaryColor: Colors.grey, fontWeight: FontWeight.bold),),
                        ),
                      ), 
                      separatorBuilder: (_, index) => SizedBox(width: 10,), 
                      itemCount: sizeList.length),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price", style: TextStyle(color: Colors.grey, fontSize: 16),),
                      Text(widget.cloth.price, style: TextStyle(fontSize: 20, height: 1.5, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          elevation: 0,
                          primary: Theme.of(context).primaryColor
                        ),
                        onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Add to Cart", style: TextStyle(fontSize: 16),),
                            SizedBox(width: 10,),
                            Icon(Icons.shopping_cart_outlined),
                          ],
                        )),
                    ),
                  )
                ],
              ),
            )


              ]),
            ),

            
           
          ],
        ),
        

      ),
    );
  }
}