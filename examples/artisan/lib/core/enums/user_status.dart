//

enum UserStatusEnum {
  active('ACTIVE'),
  pending('PENDING'),
  suspended('SUSPENDED'),
  banned('BANNED');

  const UserStatusEnum(this.value);
  final String value;
}
