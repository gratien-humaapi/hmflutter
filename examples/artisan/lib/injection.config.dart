// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:artisan/auth/auth_service.dart' as _i6;
import 'package:artisan/auth/store/user_store.dart' as _i5;
import 'package:artisan/more_info/store/more_info_store.dart' as _i3;
import 'package:artisan/services/store/service_store.dart' as _i4;
import 'package:artisan/services/store/services_store.dart' as _i7;
import 'package:artisan/services/store/userservice_store.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.MoreInfoStore>(_i3.MoreInfoStore());
    gh.singleton<_i4.ServiceStore>(_i4.ServiceStore());
    gh.singleton<_i5.UserStore>(_i5.UserStore());
    gh.singleton<_i6.AuthService>(_i6.AuthService(gh<_i5.UserStore>()));
    gh.singleton<_i7.ServicesStore>(_i7.ServicesStore(gh<_i5.UserStore>()));
    gh.singleton<_i8.UserServiceStore>(
        _i8.UserServiceStore(gh<_i5.UserStore>()));
    return this;
  }
}
