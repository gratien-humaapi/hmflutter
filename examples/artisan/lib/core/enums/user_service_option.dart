enum UserServiceOptionStatusEnum {
  published('PUBLISHED'),
  unpublished('UNPUBLISHED'),
  draft('DRAFT'),
  pendingApproval('PENDING_APPROVAL'),
  requireModification('REQUIRE_MODIFICATION');

  const UserServiceOptionStatusEnum(this.value);
  final String value;
}
