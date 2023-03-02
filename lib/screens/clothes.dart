import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/clothes.dart';

class ClothesIem extends StatefulWidget {
  final Clothes clothes;
  const ClothesIem({super.key, required this.clothes});

  @override
  State<ClothesIem> createState() => _ClothesIemState();
}

class _ClothesIemState extends State<ClothesIem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
        
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage("assets/images/arrival1.png"),
                    fit: BoxFit.fitHeight
                    ),
                    
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.favorite, color: Colors.red,size: 15,),))
              ],
            ),
            Text(widget.clothes.title, style: TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.bold),),
            Text("Hoodie", style: TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.bold),),
            Text("\$79.99", style: TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),)


          ],
        ),
      )
    );
  }
}