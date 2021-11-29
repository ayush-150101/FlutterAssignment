import 'package:IOT_UI/Widgets/LightCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleScreenDevice extends StatefulWidget {
  int lights;
  SingleScreenDevice({Key key,@required this.lights}) : super(key: key);

  @override
  _SingleScreenDeviceState createState() => _SingleScreenDeviceState();
}

class _SingleScreenDeviceState extends State<SingleScreenDevice> {
  List<LightCard> cards = [];
  bool cardsLoaded = true;

  void getLightCards() {
    cards.add(LightCard(
      imageName: "surface1",
      title: 'Main Light',
      isSelected: false,
    ));
    cards.add(LightCard(
      imageName: "furniture-and-household",
      title: 'Desk Light',
      isSelected: true,
    ));
    cards.add(LightCard(imageName: "bed1", title: "Bed Light", isSelected: false));
    setState(() {
      cardsLoaded = true;
    });
  }

  void initState() {
    super.initState();
    getLightCards();
  }

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFA2E42B3),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, screenHeight * 0.1, 0, 0),
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () =>Navigator.pop(context),
                ),
                Text("Bed\nRoom ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20, screenHeight * 0.195, 0, 0),
            child: Row(
              children: [

                Text("${widget.lights} lights ",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),


          Positioned(
            top: screenHeight * 0.206,
            child: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.755, 0, 0, 0),
              child: Container(
                width: screenWidth * 0.07,
                height: screenWidth * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                child: Text(''),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.206,
            child: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.755, 0, 0, 0),
              child: Container(
                width: screenWidth * 0.07,
                height: screenWidth * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow.withOpacity(_value),
                ),
                child: Text(''),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: screenWidth * 0.4,
              height: screenHeight * 0.22,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Image.asset(
                  "assets/Group 38.png",
                  alignment: Alignment.topRight,
                  colorBlendMode: BlendMode.plus,
                  scale: 0.8,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.26,
            child: Container(
              height: screenHeight * 0.045,
              width: screenWidth,
              child: ListView.builder(
                //shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) => cards[index],
              ),
            ),
          ),
          Positioned.fill(
              top: screenHeight * 0.355,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40), bottom: Radius.zero),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, screenHeight * 0.02, 0, 0),
                            child: CustomText(text: "Intensity"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: SvgPicture.asset(
                                        "assets/solution2.svg")),
                                Expanded(
                                  child: Slider(
                                      value: _value,
                                      min: 0.0,
                                      max: 1.0,
                                      divisions: 20,
                                      activeColor: Colors.yellow,
                                      inactiveColor: Colors.grey[300],
                                      //label: 'Set volume value',
                                      onChanged: (double newValue) {
                                        setState(() {
                                          print("Value: $_value");
                                          _value = newValue;
                                        });
                                      },
                                      semanticFormatterCallback:
                                          (double newValue) {
                                        return '$newValue dollars';
                                      }),
                                ),
                                SvgPicture.asset("assets/solution.svg"),
                              ],
                            ),
                          ),
                          CustomText(text: "Colors"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ColorContainer(color: Color(0xBCF55E6B)),
                                ColorContainer(color: Color(0xEE6DCD69)),
                                ColorContainer(color: Color(0xEE66CFEE)),
                                ColorContainer(color: Color(0xEE5C9AE3)),
                                ColorContainer(color: Color(0xEECA78EA)),
                                ColorContainer(color: Color(0xEEF5D673)),
                                Container(
                                  width: screenWidth * 0.08,
                                  height: screenWidth * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 4, 4, 4),
                                    child: SvgPicture.asset("assets/+.svg"),
                                  ),
                                )
                              ],
                            ),
                          ),
                          
                          CustomText(text: "Scenes"),
                          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SceneCard(label: "Birthday", color: Color(
                                    0xBCEE6371)),
                                SceneCard(label: "Party", color: Color(0xEECA78EA)),

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SceneCard(label: "Relax", color: Color(0xEE66CFEE)),
                                SceneCard(label: "fun", color: Color(0xEE6DCD69)),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
              top: screenHeight * 0.332,
              child: Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.85, 0, 0, 0),
                child: Container(
                    margin: EdgeInsets.all(2),
                    width: screenHeight * 0.05,
                    height: screenHeight * 0.05,
                    //height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SvgPicture.asset(
                        "assets/Icon awesome-power-off.svg",
                        width: screenWidth * 0.05,
                      ),
                    )
                    //child:
                    ),
              )),

          BottomBar(),
        ],
      ),
    );
  }
}

class ColorContainer extends StatelessWidget {
  Color color;
  ColorContainer({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.08,
      height: screenWidth * 0.08,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  String text;
  CustomText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(15, screenHeight * 0.03, 0, 0),
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xFA2E42B3),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SceneCard extends StatelessWidget {
  String label;
  Color color;
  SceneCard({Key key, @required this.label, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(screenWidth * 0.06,0,screenWidth * 0.06,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/surface2.svg"),
              Text(label,style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),

    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,

        child: Container(
          width: screenWidth,
          height: screenHeight * 0.08,
          decoration: BoxDecoration(
            color: Colors.white,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/bulb.svg"),
              SvgPicture.asset("assets/Icon feather-home.svg"),
              SvgPicture.asset("assets/Icon feather-settings.svg"),
            ],
          ),

    ));
  }
}

