class english_model {
  List<Data>? data;

  english_model({this.data});

  english_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? isimage;
  String? imageUrl;
  String? question;
  String? answer;
  String? correctAnswer;
  List<String>? option;

  Data(
      {this.isimage,
        this.imageUrl,
        this.question,
        this.answer,
        this.correctAnswer,
        this.option});

  Data.fromJson(Map<String, dynamic> json) {
    isimage = json['Isimage'];
    imageUrl = json['ImageUrl'];
    question = json['Question'];
    answer = json['Answer'];
    correctAnswer = json['correctAnswer'];
    option = json['option'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Isimage'] = this.isimage;
    data['ImageUrl'] = this.imageUrl;
    data['Question'] = this.question;
    data['Answer'] = this.answer;
    data['correctAnswer'] = this.correctAnswer;
    data['option'] = this.option;
    return data;
  }
}
