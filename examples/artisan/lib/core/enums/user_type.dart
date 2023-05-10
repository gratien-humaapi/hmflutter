//

enum UserTypeEnum {
  admin('ADMIN'),
  author('AUTHOR'),
  contractor('CONTRACTOR'),
  contributor('CONTRIBUTOR'),
  businessDeveloper('BUSINESS_DEVELOPER'),
  customer('CUSTOMER');

  const UserTypeEnum(this.value);
  final String value;
}
