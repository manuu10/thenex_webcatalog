import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class Product {
  final String nummerartikel;
  final String artikelnummer;
  final String artikelobergruppe;
  final String hersteller;
  final String bezeichnung;
  final String beschreibung;
  final String beschreibung_2;
  final String beschreibung_3;
  final String einheit;
  final String bemerkung;
  final String gewicht_netto;
  final String mas_laenge;
  final String mas_breite;
  final String mas_hoehe;
  final String mas_einheit;

  Product(
      this.nummerartikel,
      this.artikelnummer,
      this.artikelobergruppe,
      this.hersteller,
      this.bezeichnung,
      this.beschreibung,
      this.beschreibung_2,
      this.beschreibung_3,
      this.einheit,
      this.bemerkung,
      this.gewicht_netto,
      this.mas_laenge,
      this.mas_breite,
      this.mas_hoehe,
      this.mas_einheit);

  Product copyWith({
    String? nummerartikel,
    String? artikelnummer,
    String? artikelobergruppe,
    String? hersteller,
    String? bezeichnung,
    String? beschreibung,
    String? beschreibung_2,
    String? beschreibung_3,
    String? einheit,
    String? bemerkung,
    String? gewicht_netto,
    String? mas_laenge,
    String? mas_breite,
    String? mas_hoehe,
    String? mas_einheit,
  }) {
    return Product(
      nummerartikel ?? this.nummerartikel,
      artikelnummer ?? this.artikelnummer,
      artikelobergruppe ?? this.artikelobergruppe,
      hersteller ?? this.hersteller,
      bezeichnung ?? this.bezeichnung,
      beschreibung ?? this.beschreibung,
      beschreibung_2 ?? this.beschreibung_2,
      beschreibung_3 ?? this.beschreibung_3,
      einheit ?? this.einheit,
      bemerkung ?? this.bemerkung,
      gewicht_netto ?? this.gewicht_netto,
      mas_laenge ?? this.mas_laenge,
      mas_breite ?? this.mas_breite,
      mas_hoehe ?? this.mas_hoehe,
      mas_einheit ?? this.mas_einheit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Nummer_artikel': nummerartikel,
      'Artikelnummer': artikelnummer,
      'Artikelobergruppe': artikelobergruppe,
      'Hersteller': hersteller,
      'Bezeichnung': bezeichnung,
      'Beschreibung': beschreibung,
      'Beschreibung_2': beschreibung_2,
      'Beschreibung_3': beschreibung_3,
      'Einheit': einheit,
      'Bemerkung': bemerkung,
      'Gewicht_kg_netto': gewicht_netto,
      'Mas_laenge': mas_laenge,
      'Mas_breite': mas_breite,
      'Mas_hoehe': mas_hoehe,
      'Mas_einheit': mas_einheit,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['Nummer_artikel'] ?? "",
      map['Artikelnummer'] ?? "",
      map['Artikelobergruppe'] ?? "",
      map['Hersteller'] ?? "",
      map['Bezeichnung'] ?? "",
      map['Beschreibung'] ?? "",
      map['Beschreibung_2'] ?? "",
      map['Beschreibung_3'] ?? "",
      map['Einheit'] ?? "",
      map['Bemerkung'] ?? "",
      map['Gewicht_kg_netto'] ?? "",
      map['Mas_laenge'] ?? "",
      map['Mas_breite'] ?? "",
      map['Mas_hoehe'] ?? "",
      map['Mas_einheit'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(nummerartikel: $nummerartikel, artikelnummer: $artikelnummer, artikelobergruppe: $artikelobergruppe, hersteller: $hersteller, bezeichnung: $bezeichnung, beschreibung: $beschreibung, beschreibung_2: $beschreibung_2, beschreibung_3: $beschreibung_3, einheit: $einheit, bemerkung: $bemerkung, gewicht_netto: $gewicht_netto, mas_laenge: $mas_laenge, mas_breite: $mas_breite, mas_hoehe: $mas_hoehe, mas_einheit: $mas_einheit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.nummerartikel == nummerartikel &&
        other.artikelnummer == artikelnummer &&
        other.artikelobergruppe == artikelobergruppe &&
        other.hersteller == hersteller &&
        other.bezeichnung == bezeichnung &&
        other.beschreibung == beschreibung &&
        other.beschreibung_2 == beschreibung_2 &&
        other.beschreibung_3 == beschreibung_3 &&
        other.einheit == einheit &&
        other.bemerkung == bemerkung &&
        other.gewicht_netto == gewicht_netto &&
        other.mas_laenge == mas_laenge &&
        other.mas_breite == mas_breite &&
        other.mas_hoehe == mas_hoehe &&
        other.mas_einheit == mas_einheit;
  }

  @override
  int get hashCode {
    return nummerartikel.hashCode ^
        artikelnummer.hashCode ^
        artikelobergruppe.hashCode ^
        hersteller.hashCode ^
        bezeichnung.hashCode ^
        beschreibung.hashCode ^
        beschreibung_2.hashCode ^
        beschreibung_3.hashCode ^
        einheit.hashCode ^
        bemerkung.hashCode ^
        gewicht_netto.hashCode ^
        mas_laenge.hashCode ^
        mas_breite.hashCode ^
        mas_hoehe.hashCode ^
        mas_einheit.hashCode;
  }
}
