class Trabajador {
  final String nombres;
  final String apellidos;
  final int dni;
  final String tipodeHorario;
  final String correo;
  final bool estado;
  final String genero;
  final DateTime fechaDeNacimiento;
  final int telefono;
  final String direccion;

  Trabajador(
      {required this.nombres,
      required this.apellidos,
      required this.dni,
      required this.tipodeHorario,
      required this.correo,
      required this.estado,
      required this.genero,
      required this.fechaDeNacimiento,
      required this.telefono,
      required this.direccion});
}
