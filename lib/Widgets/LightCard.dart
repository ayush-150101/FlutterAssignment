import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightCard extends StatelessWidget {
  String imageName;
  String title;
  bool isSelected;
  LightCard({Key key,@required this.imageName,@required this.title,@required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.035,
        decoration: BoxDecoration(
          color: !isSelected?Colors.white:Color(0xFA151F5F),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/$imageName.svg"),
              Text('$title',style: TextStyle(color: !isSelected?Color(0xFA151F5F):Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}

