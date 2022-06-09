class Film {
  final String film_Id;
  final String film_Adi;
  final String film_Hakkinda;
  final String film_Turu;
  final String imdb;

  Film({
    this.film_Id = '',
    required this.film_Adi,
    required this.film_Hakkinda,
    required this.film_Turu,
    required this.imdb,
  });

  static Film fromJson(Map<String, dynamic> json) => Film(
      film_Id: json['film_Id'],
      film_Adi: json['film_Adi'],
      film_Hakkinda: json['film_Hakkinda'],
      film_Turu: json['film_Turu'],
      imdb: json['imdb']);
}
