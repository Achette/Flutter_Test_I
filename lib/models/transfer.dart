class Transfer {
  final double valor;
  final int numeroConta;

  Transfer(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferência{valor: $valor, numeroConta: $numeroConta}';
  }
}
