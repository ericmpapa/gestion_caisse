import 'package:gestion_caisse/enregistrement.dart';

class LivreCaisse {
  int numeroCompte;
  final _enregistrements = <Enregistrement>[];

  LivreCaisse({this.numeroCompte = 0});

  void ajouterEnregitrement(Enregistrement enregistrement) {
    _enregistrements.add(enregistrement);
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
