import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmhub/models/dizi.dart';
import 'package:filmhub/models/film.dart';

class FirestoreFilmHelper {
  static FirebaseFirestore database = FirebaseFirestore.instance;

  static Future<Film?> readYerliFilm(String film_Id) async {
    final docFilm = database
        .collection('FilmHub')
        .doc('filmler')
        .collection('yerli')
        .doc(film_Id);
    final snapshot = await docFilm.get();
    if (snapshot.exists) {
      return Film.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<Film?> readYabanciFilm(String film_Id) async {
    final docFilm = database
        .collection('FilmHub')
        .doc('filmler')
        .collection('yabanci')
        .doc(film_Id);
    final snapshot = await docFilm.get();
    if (snapshot.exists) {
      return Film.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Stream<List<Film>> readYerliFilms() {
    return database
        .collection('FilmHub')
        .doc('filmler')
        .collection('yerli')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Film.fromJson(doc.data())).toList());
  }

  static Stream<List<Film>> readYabanciFilms() {
    return database
        .collection('FilmHub')
        .doc('filmler')
        .collection('yabanci')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Film.fromJson(doc.data())).toList());
  }
}

class FirestoreDiziHelper {
  static final database = FirebaseFirestore.instance;
  static Stream<List<Dizi>> readYabanciDiziler() {
    return database
        .collection('FilmHub')
        .doc('diziler')
        .collection('yabanci')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Dizi.fromJson(doc.data())).toList());
  }

  static Stream<List<Dizi>> readYerliDiziler() {
    return database
        .collection('FilmHub')
        .doc('diziler')
        .collection('yerli')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Dizi.fromJson(doc.data())).toList());
  }

  static Future<Dizi?> readYabanciDizi(String dizi_Id) async {
    final docDizi = database
        .collection('FilmHub')
        .doc('diziler')
        .collection('yabanci')
        .doc(dizi_Id);
    final snapshot = await docDizi.get();
    if (snapshot.exists) {
      return Dizi.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<Dizi?> readYerliDizi(String dizi_Id) async {
    final docDizi = database
        .collection('FilmHub')
        .doc('diziler')
        .collection('yerli')
        .doc(dizi_Id);
    final snapshot = await docDizi.get();
    if (snapshot.exists) {
      return Dizi.fromJson(snapshot.data()!);
    }
    return null;
  }
}
