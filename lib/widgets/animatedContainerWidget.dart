import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {

  String name;
  Widget widg;
  Icon icon;
  Icon secIcon;
  AnimatedContainerWidget(this.name, this.widg, this.icon, this.secIcon);

  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState(name, widg, icon, secIcon);
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {


  double conWidth = 50;
  double conHeight = 50;
  double conRadius = 12;
  bool showCon = true;

  String name;
  Widget widg;
  Icon icon;
  Icon secIcon;
  _AnimatedContainerWidgetState(this.name, this.widg, this.icon, this.secIcon);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(
        width: conWidth,
        height: conHeight,
        decoration: BoxDecoration(
          // color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(conRadius),
        ),
        child: IconButton(
          icon: icon,
          onPressed: (){
            setState(() {
              showCon = !showCon;
              conRadius = 8;
            });
          },),
      ),
      secondChild: Container(
        width: MediaQuery.of(context).size.width /1/2 *1.3,
        height: MediaQuery.of(context).size.height /1/2,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(conRadius),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 48, right: 8, left: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).hoverColor,
                  borderRadius: BorderRadius.circular(conRadius),
                ),
                child: Stack(
                  children: [
                    widg,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Text(name,
                      style: TextStyle(
                          color: Theme.of(context).hoverColor,
                          fontSize: 18,
                          fontFamily: 'Tajawal'
                      ),),
                  ),
                  IconButton(
                    icon: secIcon,
                    onPressed: (){
                      setState(() {
                        showCon = !showCon;
                      });
                    },),
                ],
              ),
            ),
          ],
        ),
      ),
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(seconds: 2),
      crossFadeState: showCon ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeIn,
    );
  }
}
