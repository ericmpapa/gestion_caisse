class LivreCaisse {
  int numeroCompte;

  LivreCaisse({this.numeroCompte = 0});

  double soldeGeneral() => 0;
  double soldePeriode(DateTime debut, DateTime fin) => 0;

  @override
  String toString() => "numero compte:$numeroCompte";
}
