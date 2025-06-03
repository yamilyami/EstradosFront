class DollarRate {
  final String nombre;
  final double compra;
  final double venta;

  DollarRate({required this.nombre, required this.compra, required this.venta});

  factory DollarRate.fromJson(Map<String, dynamic> json) {
    return DollarRate(
      nombre: json['nombre'],
      compra: json['compra'].toDouble(),
      venta: json['venta'].toDouble(),
    );
  }
}
