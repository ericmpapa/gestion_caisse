import 'dart:io';

import 'package:gestion_caisse/enregistrement.dart';
import 'package:gestion_caisse/livre_caisse.dart';

bool continuerOuQuitter() {
  var ret = false;
  return ret;
}

bool nouvelleEntree(LivreCaisse livreCaisse) {
  var ret = false;
  stdout.write("Saisissez le libellé: ");
  var libelle = stdin.readLineSync()!;
  stdout.write("Saisissez le montant: ");
  var montant = double.parse(stdin.readLineSync()!);
  livreCaisse.ajouterEnregitrement(Enregistrement(
      numero: LivreCaisse.seq, libelle: libelle, credit: montant));

  return ret;
}

bool menu() {
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
      break;
    case 2:
      break;
    case 3:
      break;
  }

  return ret;
}

void main(List<String> arguments) {
  var execution = true;
  while (execution) {
    execution = menu();
  }
}
