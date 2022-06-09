class Dizi {
  final String dizi_Id;
  final String dizi_Adi;
  final String dizi_Hakkinda;
  final String dizi_Turu;
  final String imdb;
  Dizi(
      {this.dizi_Id = '',
      required this.dizi_Adi,
      required this.dizi_Hakkinda,
      required this.dizi_Turu,
      required this.imdb});
  static Dizi fromJson(Map<String, dynamic> json) => Dizi(
      dizi_Id: json['dizi_Id'],
      dizi_Adi: json['dizi_Adi'],
      dizi_Hakkinda: json['dizi_Hakkinda'],
      dizi_Turu: json['dizi_Turu'],
      imdb: json['imdb']);
}
