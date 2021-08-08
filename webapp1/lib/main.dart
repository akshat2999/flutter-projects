import 'dart:convert';

import 'package:flutter/material.dart';
import './model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  CryptoModel curr;
  List<MaterialColor> _colors = [
    Colors.blue,
    Colors.red,
    Colors.indigo,
  ];

  Future<CryptoModel> fetchNotes() async {
    final String API_KEY = '791991ac-c5b0-4088-9206-9dc76d0371a1';
    Map<String, String> tokenData = {
      "X-CMC_PRO_API_KEY": API_KEY,
      "Accept": "application/json"
    };
    String cryptoUrl =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=20";
    http.Response response = await http.get(cryptoUrl, headers: tokenData);

    CryptoModel currency;

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      currency = CryptoModel.fromJson(data);
    }
    return currency;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        curr = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  Future<void> _getData() async {
     setState(() {
       isLoading= true;
     });
  await fetchNotes().then((value) {
      setState(() {

        curr = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CryptoCurrency'),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: _getData,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: ListView.builder(
                          itemCount: curr.data.length,
                          itemBuilder: (context, index) {
                            final MaterialColor colors =
                                _colors[index % _colors.length];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: colors,
                                child: Text(
                                  curr.data[index].name.substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    curr.data[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '\$${curr.data[index].quote.uSD.price.toStringAsFixed(3)}',
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                curr.data[index].symbol,
                                style: TextStyle(color: colors),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
