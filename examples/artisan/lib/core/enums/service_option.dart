//

enum ServiceOptionsEnum {
  unique('UNIQUE'),
  number('NUMBER'),
  multiple('MULTIPLE');

  const ServiceOptionsEnum(this.value);
  final String value;
}
