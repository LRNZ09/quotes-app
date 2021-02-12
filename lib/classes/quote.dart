class Quote {
  final String author;
  final String text;
  final String title;

  Quote({this.author, this.text, this.title});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      author: json['author'],
      text: json['quote'],
      title: json['title'],
    );
  }
}
