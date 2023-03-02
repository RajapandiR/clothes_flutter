import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
      Container(
            child: Row(
              children: [
                Row(
                  children: [
                    RichText(text: const TextSpan(
                      children:  [
                        TextSpan(text: "Howdy , What Are You \n Look"),
                        TextSpan(text: "@@")
                      ]
                    ))
                  ],
                )
              ],
            ),
          )
    );
  }
}