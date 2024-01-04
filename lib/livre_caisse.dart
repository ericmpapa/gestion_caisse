import 'package:gestion_caisse/enregistrement.dart';

class LivreCaisse {
  int numeroCompte;
  static int seq = 0;
  final _enregistrements = <Enregistrement>[];

  LivreCaisse({this.numeroCompte = 0});

  void ajouterEnregitrement(Enregistrement enregistrement) {
    _enregistrements.add(enregistrement);
    seq++;
  }

  void afficherEnregistrements() {
    print('LISTE DES ENREGISTREMENTS');
    for (var enregistrement in _enregistrements) {
      print(enregistrement);
    }
    print('SOLDE: ${soldeGeneral()}');
  }

  void afficherEnregistrementsParPeriode(DateTime debut, DateTime fin) {
    print(
        'ENREGISTREMENTS DU ${debut.day - debut.month - debut.year} au ${fin.day - fin.month - fin.year}');
    for (var enregistrement in _enregistrements) {
      if (enregistrement.dateEnreg.compareTo(debut) >= 0 &&
          enregistrement.dateEnreg.compareTo(fin) <= 0) {
        print(enregistrement);
      }
    }
    print('SOLDE DE LA PERIODE: ${soldePeriode(debut, fin)}');
  }

  double soldeGeneral() {
    double ret = 0;
    for (var enregistrement in _enregistrements) {
      ret += enregistrement.solde();
    }
    return ret;
  }

  double soldePeriode(DateTime debut, DateTime fin) {
    double ret = 0;
    for (var enregistrement in _enregistrements) {
      if (enregistrement.dateEnreg.compareTo(debut) >= 0 &&
          enregistrement.dateEnreg.compareTo(fin) <= 0) {
        ret += enregistrement.solde();
      }
    }
    return ret;
  }

  @override
  String toString() => "numero compte:$numeroCompte";
}
