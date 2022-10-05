import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class key extends StatefulWidget {
  key({required this.color,required this.value,required this.back_color});

  Color color;
  String value;
  Color back_color;

  @override
  State<key> createState() => _keyState();
}

class _keyState extends State<key> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width*0.15,
      height:MediaQuery.of(context).size.height*0.08,
      decoration:BoxDecoration(
          color:widget.back_color,
          borderRadius:BorderRadius.horizontal(
            right:Radius.circular(9),
            left:Radius.circular(9)
          ),
      ),
      child:Center(child: Text(widget.value,style:GoogleFonts.montserrat(color:widget.color,fontSize:19,fontWeight:FontWeight.w600),textAlign:TextAlign.center,)),
    );
  }
}
