class Quote {
  final String author;
  final String text;

  Quote({required this.author, required this.text});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      author: json['a'],
      text: json['q'],
    );
  }
}
