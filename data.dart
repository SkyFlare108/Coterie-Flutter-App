class Data{
  final String datetime;
  final String description;

  Data(this.datetime, this.description);

  Data.fromJson(Map<dynamic, dynamic> json)
      : datetime = json['date'] as String,
        description = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'date': datetime.toString(),
    'text': description,
  };

}

