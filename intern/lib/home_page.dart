import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List bookings = [];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.line_weight),
            Text(
              'Bookings',
              style: TextStyle(),
            ),
            Icon(Icons.blur_circular)
          ],
        ),
        backgroundColor: Color(0xff6C6C6C),
      ),
      body: bookings.isEmpty
          ? Center(child: Text('No Bookings Yet',style: TextStyle(color: Colors.white),),)
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(bookings[index].id),
                  ),
                  
                );
              },
            ),
    );
  }
}
