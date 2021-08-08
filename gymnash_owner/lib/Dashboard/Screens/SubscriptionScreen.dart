import 'package:flutter/material.dart';
import 'package:gymnash_owner/Utilities/SizeConfig.dart';
import 'package:gymnash_owner/Utilities/Theme.dart';

class SubscriptionScreen extends StatelessWidget {
  static final routeName = "/subscription";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 0,
            titleSpacing: 0,
            centerTitle: true,
            title: Text("Subscriptions"),
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                  child: Text(
                    "Active",
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),
                  ),
                ),
                Text(
                  "Expired",
                  style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ActiveSubscription(),
              ExpiredSubscription(),
            ],
          ),
        ));
  }
}

class ActiveSubscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 5),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, i) => ListTile(),
      ),
    );
  }
}

class ExpiredSubscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 5),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, i) => ListTile(),
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
