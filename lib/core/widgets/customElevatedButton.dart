// ignore: file_names
import 'package:flutter/material.dart';

class Customelevatedbutton {

  static Widget getElevatedButton(
    {
       required void Function() onTap,
      required String title,

    }
  ){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: AlignmentDirectional.center,
                  backgroundColor: const Color(0xff149954),
                  fixedSize: const Size(381, 48),
                  foregroundColor: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed:onTap,
                child:  Text(title, style: TextStyle(fontSize: 16)),
              ),
    );
  }
}