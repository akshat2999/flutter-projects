import 'package:flutter/material.dart';
import 'package:gymnash_owner/Dashboard/Screens/GymDetailsScreen.dart';
import 'package:gymnash_owner/Dashboard/Screens/RecordsScreen.dart';
import 'package:gymnash_owner/Dashboard/Screens/SubscriptionScreen.dart';
import 'package:gymnash_owner/Utilities/SizeConfig.dart';
import 'package:gymnash_owner/Utilities/Theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GymWidget extends StatefulWidget {
  @override
  _GymWidgetState createState() => _GymWidgetState();
}

class _GymWidgetState extends State<GymWidget> {
  int _current = 1;
  List<int> listOfGyms = [1, 2, 3, 4, 5];
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 5, left: SizeConfig.widthMultiplier * 5),
          child: Text(
            "Your Listed Gyms ",
            style: TextStyle(
              color: ThemeColors.accent,
              fontSize: SizeConfig.textMultiplier * 3,
            ),
          ),
        ),
        Stack(
          children: [
            CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  onPageChanged: (i, _) {
                    setState(() {
                      _current = i + 1;
                      print(i);
                    });
                  },
                  viewportFraction: 1,
                  height: SizeConfig.heightMultiplier * 75),
              items: listOfGyms.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return singleGymWidget(i.toString());
                  },
                );
              }).toList(),
            ),
            Positioned(
                top: SizeConfig.heightMultiplier * 70,
                left: 0.0,
                right: 0.0,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (var i in listOfGyms)
                    Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: _current == i ? ThemeColors.accent : ThemeColors.white),
                    )
                ]))
          ],
        )
      ],
    );
  }
}

class singleGymWidget extends StatelessWidget {
  String text;
  singleGymWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.secondary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      width: SizeConfig.widthMultiplier * 200,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6, vertical: SizeConfig.heightMultiplier * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Placeholder(
            color: ThemeColors.accent,
            fallbackHeight: SizeConfig.heightMultiplier * 30,
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 10, left: SizeConfig.widthMultiplier * 5),
            child: Text(
              'Name of the gym will be coming here ' + text,
              style: TextStyle(color: ThemeColors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.heightMultiplier * 5, left: SizeConfig.widthMultiplier * 5, right: SizeConfig.widthMultiplier * 5),
            child: Text(
              'Address of the gym will be coming here Address of the gym here Address of the gym will be coming here Address of the gym will be coming here Address of the gym will be coming here ',
              style: TextStyle(color: ThemeColors.silver),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                color: ThemeColors.white,
                onPressed: () => Navigator.of(context).pushNamed(RecordScreen.routeName),
                child: Text(
                  "Records",
                  style: TextStyle(color: ThemeColors.accent, fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              FlatButton(
                color: ThemeColors.white,
                onPressed: () => Navigator.of(context).pushNamed(SubscriptionScreen.routeName),
                child: Text(
                  "Subscription",
                  style: TextStyle(color: ThemeColors.accent, fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              FlatButton(
                color: ThemeColors.white,
                onPressed: () => Navigator.of(context).pushNamed(GymDetailScreen.routeName),
                child: Text(
                  "Gym Details",
                  style: TextStyle(color: ThemeColors.accent, fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
