import 'dart:io';

import 'package:gestion_caisse/enregistrement.dart';
import 'package:gestion_caisse/livre_caisse.dart';

bool continuerOuQuitter() {
  stdout.write(
      "Saisissez [1] pour continuer ou [Toute autre touche] pour quitter: ");
  return stdin.readLineSync()! == '1';
}

bool nouvelleEntree(LivreCaisse livreCaisse) {
  print("ENREGISTREMENT D'ENTREE");
  print("-----------------------");
  stdout.write("Saisissez le libellé: ");
  var libelle = stdin.readLineSync()!;
  stdout.write("Saisissez le montant: ");
  var montant = double.parse(stdin.readLineSync()!);
  livreCaisse.ajouterEnregitrement(Enregistrement(
      numero: LivreCaisse.seq, libelle: libelle, credit: montant));
  return continuerOuQuitter();
}

bool nouvelleSortie(LivreCaisse livreCaisse) {
  print("ENREGISTREMENT DE SORTIE");
  print("------------------------");
  stdout.write("Saisissez le libellé: ");
  var libelle = stdin.readLineSync()!;
  stdout.write("Saisissez le montant: ");
  var montant = double.parse(stdin.readLineSync()!);
  livreCaisse.ajouterEnregitrement(Enregistrement(
      numero: LivreCaisse.seq, libelle: libelle, debit: montant));
  return continuerOuQuitter();
}

bool afficherEnregsitrements(LivreCaisse livreCaisse) {
  print("AFFICHER ENREGISTREMENT");
  print("-----------------------");
  livreCaisse.afficherEnregistrements();
  return continuerOuQuitter();
}

bool afficherEnregsitrementsParPeriode(LivreCaisse livreCaisse) {
  print("AFFICHER ENREGISTREMENT PAR PERIODE");
  print("-----------------------------------");
  stdout.write("Saisissez la date de début [dd-MM-yyyy]: ");
  var dateDebutString = stdin.readLineSync()!;
  var dateDebutStringList = dateDebutString.split('-');
  var jourDebut = int.parse(dateDebutStringList[0]);
  var moisDebut = int.parse(dateDebutStringList[1]);
  var anneeDebut = int.parse(dateDebutStringList[2]);
  var dateDebut = DateTime(anneeDebut, moisDebut, jourDebut);
  stdout.write("Saisissez la date de fin [dd-MM-yyyy]: ");
  var dateFinString = stdin.readLineSync()!;
  var dateFinStringList = dateFinString.split('-');
  var jourFin = int.parse(dateFinStringList[0]);
  var moisFin = int.parse(dateFinStringList[1]);
  var anneeFin = int.parse(dateFinStringList[2]);
  var dateFin = DateTime(anneeFin, moisFin, jourFin);
  livreCaisse.afficherEnregistrementsParPeriode(dateDebut, dateFin);
  return continuerOuQuitter();
}

bool menu(LivreCaisse livreCaisse) {
  bool ret = false;
  print("Saisissez:");
  print("[1]. Pour enregistrer une nouvelle entrée");
  print("[2]. Pour enregistrer une nouvelle sortie");
  print("[3]. Pour afficher tous les enregistrements");
  print("[4]. Pour afficher les enregistrements sur une période donnée");
  print("[Toute autre touche]. Pour quitter");

  var choix = int.parse(stdin.readLineSync()!);

  switch (choix) {
    case 1:
      ret = nouvelleEntree(livreCaisse);
      break;
    case 2:
      ret = nouvelleSortie(livreCaisse);
      break;
    case 3:
      ret = afficherEnregsitrements(livreCaisse);
      break;
    case 4:
      ret = afficherEnregsitrementsParPeriode(livreCaisse);
      break;
  }

  return ret;
}

void main(List<String> arguments) {
  print("BIENVENU DANS LE PROGRAMME GESTION CAISSE");
  print("-----------------------------------------");
  var livreCaisse = LivreCaisse(numeroCompte: 57);
  var execution = true;
  while (execution) {
    execution = menu(livreCaisse);
  }
  print("BYE.");
}
