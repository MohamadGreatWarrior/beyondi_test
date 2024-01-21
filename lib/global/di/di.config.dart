// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:p2p_car_renting/features/authentication/bloc/authentication_bloc.dart'
    as _i10;
import 'package:p2p_car_renting/features/car_details/cubit/car_details_cubit.dart'
    as _i11;
import 'package:p2p_car_renting/features/car_details/repo/car_details_repo.dart'
    as _i3;
import 'package:p2p_car_renting/features/home/cubit/home_cubit.dart' as _i13;
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart'
    as _i12;
import 'package:p2p_car_renting/features/home/repo/home_repo.dart' as _i6;
import 'package:p2p_car_renting/features/sign_in/cubit/sign_in_cubit.dart'
    as _i15;
import 'package:p2p_car_renting/features/sign_in/repo/sign_in_repo.dart' as _i8;
import 'package:p2p_car_renting/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i7;
import 'package:p2p_car_renting/global/di/modules/app_module/app_module.dart'
    as _i17;
import 'package:p2p_car_renting/global/di/modules/firebase_module/firebase_module.dart'
    as _i16;
import 'package:p2p_car_renting/global/dio/dio_client.dart' as _i4;
import 'package:p2p_car_renting/global/repos/repos.dart' as _i14;
import 'package:p2p_car_renting/global/repos/user_repo.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    final appModule = _$AppModule();
    gh.factory<_i3.CarDetailsRepo>(() => _i3.FirebaseCarDetailsRepo());
    await gh.lazySingletonAsync<_i4.DioClient>(
      () {
        final i = _i4.DioClient();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    await gh.singletonAsync<_i5.FirebaseApp>(
      () => firebaseModule.getFirebaseApp(),
      preResolve: true,
    );
    gh.factory<_i6.HomeRepo>(() => _i6.FirebaseCarRepo());
    gh.factory<_i7.PermissionsCubit>(() => _i7.PermissionsCubit());
    gh.factory<_i8.SignInRepo>(() => _i8.FirebaseSignInRepo());
    await gh.singletonAsync<_i9.UserRepo>(
      () {
        final i = _i9.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<_i10.AuthenticationBloc>(
        _i10.AuthenticationBloc(gh<_i9.UserRepo>()));
    gh.factoryParam<_i11.CarDetailsCubit, _i12.CarModel, dynamic>((
      car,
      _,
    ) =>
        _i11.CarDetailsCubit(
          gh<_i3.CarDetailsRepo>(),
          car,
        ));
    gh.factory<_i13.HomeCubit>(() => _i13.HomeCubit(
          gh<_i14.UserRepo>(),
          gh<_i6.HomeRepo>(),
        ));
    gh.factory<_i15.SignInCubit>(() => _i15.SignInCubit(gh<_i8.SignInRepo>()));
    return this;
  }
}

class _$FirebaseModule extends _i16.FirebaseModule {}

class _$AppModule extends _i17.AppModule {}
