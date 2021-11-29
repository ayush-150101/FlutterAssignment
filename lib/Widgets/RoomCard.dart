import 'package:IOT_UI/SIngleDeviceScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomCard extends StatelessWidget {
  String imageName;
  String roomName;
  int lights;
  RoomCard({Key key,@required this.imageName, @required this.roomName,@required this.lights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SingleScreenDevice(lights: lights,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/$imageName.svg",height: MediaQuery.of(context).size.height * 0.07,),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                child: Text('$roomName',style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                child: Text((lights>1)?"$lights lights":"$lights light",style: TextStyle(color: Colors.yellow[700],fontSize: 22,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
