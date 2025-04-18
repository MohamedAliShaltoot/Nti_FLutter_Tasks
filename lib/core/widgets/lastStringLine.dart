// ignore: file_names
import 'package:flutter/material.dart';

class LastStringLine{
  static Widget getLastStringLine({
   required void Function() onTap,
    required String text1,
    required String text2,
    
  }){
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(
                 text1,
                  style: TextStyle(color: Color(0xff6E6A7C), fontSize: 16),
                ),
                TextButton(
                  onPressed: onTap,
                  child: Text(
                    text2,
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 9, 9),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            );
  }
}