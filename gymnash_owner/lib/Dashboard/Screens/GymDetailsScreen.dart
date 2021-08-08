import 'package:flutter/material.dart';
import 'package:gymnash_owner/Utilities/SizeConfig.dart';
import 'package:gymnash_owner/Utilities/Theme.dart';

class GymDetailScreen extends StatelessWidget {
  static final routeName = "/gymdetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        title: Text("Gym Name"),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Placeholder(
                fallbackHeight: SizeConfig.heightMultiplier * 30,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address - Sample Address Of The User',
                    style: TextStyle(color: ThemeColors.white, fontSize: SizeConfig.textMultiplier * 2.2),
                  ),
                  Icon(
                    Icons.location_on,
                    color: ThemeColors.accent,
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 6,
              ),
              Text(
                'One Line Features',
                style: TextStyle(color: ThemeColors.white, fontSize: SizeConfig.textMultiplier * 2.2),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Wrap(
                children: [
                  //put a for loop here to make it iterable ( for (Feature i in gym.features)319 code line in user app GymWidget.dart )
                  Container(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier, horizontal: SizeConfig.widthMultiplier * 2),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red[500],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'Random Feature',
                      style: TextStyle(color: ThemeColors.white, fontSize: SizeConfig.textMultiplier * 1.8),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 6,
              ),
              Text(
                'Special Training they offer',
                style: TextStyle(color: ThemeColors.white, fontSize: SizeConfig.textMultiplier * 2.2),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Wrap(
                children: [
                  //put a for loop here to make it iterable ( for (Feature i in gym.features)319 code line in user app GymWidget.dart )
                  Container(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier, horizontal: SizeConfig.widthMultiplier * 2),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red[500],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'Random Feature',
                      style: TextStyle(color: ThemeColors.white, fontSize: SizeConfig.textMultiplier * 1.8),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Text(
                'Gym Plans',
                style: TextStyle(color: ThemeColors.white, fontSize: SizeConfig.textMultiplier * 2.2),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 5),
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, i) => ListTile(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier),
      decoration: BoxDecoration(color: ThemeColors.secondary, borderRadius: new BorderRadius.all(Radius.circular(10.0))),
      child: ExpansionTile(
        title: Text('Name Of The User'),
        subtitle: Text('Time'),
        childrenPadding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4.5, bottom: SizeConfig.heightMultiplier * 2),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Name of the gym"),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Text('Other details that u wanna enter')
            ],
          )
        ],
      ),
    );
  }
}
