class CryptoModel {
  Status _status;
  List<Data> _data;

  CryptoModel({Status status, List<Data> data}) {
    this._status = status;
    this._data = data;
  }

  Status get status => _status;
  set status(Status status) => _status = status;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;

  CryptoModel.fromJson(Map<String, dynamic> json) {
    _status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._status != null) {
      data['status'] = this._status.toJson();
    }
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String _timestamp;

  Status({String timestamp}) {
    this._timestamp = timestamp;
  }

  String get timestamp => _timestamp;
  set timestamp(String timestamp) => _timestamp = timestamp;

  Status.fromJson(Map<String, dynamic> json) {
    _timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this._timestamp;
    return data;
  }
}

class Data {
  int _id;
  String _name;
  String _symbol;
  Quote _quote;

  Data({int id, String name, String symbol, Quote quote}) {
    this._id = id;
    this._name = name;
    this._symbol = symbol;
    this._quote = quote;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get symbol => _symbol;
  set symbol(String symbol) => _symbol = symbol;
  Quote get quote => _quote;
  set quote(Quote quote) => _quote = quote;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _quote = json['quote'] != null ? new Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['symbol'] = this._symbol;
    if (this._quote != null) {
      data['quote'] = this._quote.toJson();
    }
    return data;
  }
}

class Quote {
  USD _uSD;

  Quote({USD uSD}) {
    this._uSD = uSD;
  }

  USD get uSD => _uSD;
  set uSD(USD uSD) => _uSD = uSD;

  Quote.fromJson(Map<String, dynamic> json) {
    _uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._uSD != null) {
      data['USD'] = this._uSD.toJson();
    }
    return data;
  }
}

class USD {
  double _price;
  String _lastUpdated;

  USD({double price, String lastUpdated}) {
    this._price = price;
    this._lastUpdated = lastUpdated;
  }

  double get price => _price;
  set price(double price) => _price = price;
  String get lastUpdated => _lastUpdated;
  set lastUpdated(String lastUpdated) => _lastUpdated = lastUpdated;

  USD.fromJson(Map<String, dynamic> json) {
    _price = json['price'];
    _lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this._price;
    data['last_updated'] = this._lastUpdated;
    return data;
  }
}
