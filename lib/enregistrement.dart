class Enregistrement {
  DateTime dateEnreg = DateTime.now();
  String libelle;
  double montantCredit;
  double montantDebit;
  int numero;

  Enregistrement({
    this.numero = 0,
    this.libelle = "",
    this.montantCredit = 0,
    this.montantDebit = 0,
  });

  double solde() => montantCredit - montantDebit;

  @override
  String toString() =>
      "numero:$numero, date:${dateEnreg.day - dateEnreg.month - dateEnreg.year}, libelle:$libelle, credit:$montantCredit, debit:$montantDebit";
}
