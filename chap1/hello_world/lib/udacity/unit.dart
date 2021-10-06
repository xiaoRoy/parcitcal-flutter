class Unit {
  final String? name;
  final double? conversion;

  const Unit({required this.name, required this.conversion});

  Unit.fromJson(Map unitJson)
      : assert(unitJson['name'] != null),
        assert(unitJson['coversion'] != null),
        name = unitJson['name'],
        conversion = unitJson['coversion'];
}
