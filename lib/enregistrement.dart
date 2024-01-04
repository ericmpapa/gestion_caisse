class Enregistrement {
  DateTime dateEnreg = DateTime.now();
  String libelle;
  double credit;
  double debit;
  int numero;

  Enregistrement({
    this.numero = 0,
    this.libelle = "",
    this.credit = 0,
    this.debit = 0,
  });

  double solde() => credit - debit;

  @override
  String toString() =>
      "numero:$numero, date:${dateEnreg.day} - ${dateEnreg.month} - ${dateEnreg.year}, libelle:$libelle, credit:$credit, debit:$debit";
}
