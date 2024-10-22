// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api_manager.dart' as _i3;
import '../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i4;
import '../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i5;
import '../data/data_sources/remote_data_source/cart_remote_data_source.dart'
    as _i8;
import '../data/data_sources/remote_data_source/cart_remote_data_source_impl.dart'
    as _i9;
import '../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i14;
import '../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i15;
import '../data/repository/auth_repository_impl.dart' as _i7;
import '../data/repository/cart_repository_impl.dart' as _i11;
import '../data/repository/home_repository_impl.dart' as _i17;
import '../domain/repository/auth_repository.dart' as _i6;
import '../domain/repository/cart_repository.dart' as _i10;
import '../domain/repository/home_repository.dart' as _i16;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i21;
import '../domain/use_cases/delete_item_in_cart_use_case.dart' as _i12;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i23;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i24;
import '../domain/use_cases/get_all_products_use_case.dart' as _i25;
import '../domain/use_cases/get_cart_use_case.dart' as _i13;
import '../domain/use_cases/login_use_case.dart' as _i18;
import '../domain/use_cases/register_use_case.dart' as _i19;
import '../domain/use_cases/update_count_in_cart_use_case.dart' as _i20;
import '../features/auth/presentation/screens/sign_in/cubit/sign_in_view_model.dart'
    as _i27;
import '../features/auth/presentation/screens/sign_up/cubit/sign_up_view_model.dart'
    as _i29;
import '../features/cart/cubit/cart_screen_view_model.dart' as _i22;
import '../features/main_layout/home/presentation/cubit/home_tab_view_model.dart'
    as _i26;
import '../features/products_screen/presentation/cubit/product_screen_view_model.dart'
    as _i28;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepository>(() => _i7.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i4.AuthRemoteDataSource>()));
    gh.factory<_i8.CartRemoteDataSource>(
        () => _i9.CartRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.CartRepository>(() => _i11.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i8.CartRemoteDataSource>()));
    gh.factory<_i12.DeleteItemInCartUseCase>(() => _i12.DeleteItemInCartUseCase(
        cartRepository: gh<_i10.CartRepository>()));
    gh.factory<_i13.GetCartUseCase>(
        () => _i13.GetCartUseCase(cartRepository: gh<_i10.CartRepository>()));
    gh.factory<_i14.HomeRemoteDataSource>(
        () => _i15.HomeRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i16.HomeRepository>(() => _i17.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i14.HomeRemoteDataSource>()));
    gh.factory<_i18.LoginUseCase>(
        () => _i18.LoginUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i19.RegisterUseCase>(
        () => _i19.RegisterUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i20.UpdateCountInCartUseCase>(() =>
        _i20.UpdateCountInCartUseCase(
            cartRepository: gh<_i10.CartRepository>()));
    gh.factory<_i21.AddToCartUseCase>(
        () => _i21.AddToCartUseCase(homeRepository: gh<_i16.HomeRepository>()));
    gh.factory<_i22.CartScreenViewModel>(() => _i22.CartScreenViewModel(
          getCartUseCase: gh<_i13.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i12.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i20.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i23.GetAllBrandsUseCase>(() =>
        _i23.GetAllBrandsUseCase(homeRepository: gh<_i16.HomeRepository>()));
    gh.factory<_i24.GetAllCategoriesUseCase>(() => _i24.GetAllCategoriesUseCase(
        homeRepository: gh<_i16.HomeRepository>()));
    gh.factory<_i25.GetAllProductUseCase>(() =>
        _i25.GetAllProductUseCase(homeRepository: gh<_i16.HomeRepository>()));
    gh.factory<_i26.HomeTabViewModel>(() => _i26.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i24.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i23.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i27.LoginScreenViewModel>(
        () => _i27.LoginScreenViewModel(loginUseCase: gh<_i18.LoginUseCase>()));
    gh.factory<_i28.ProductScreenViewModel>(() => _i28.ProductScreenViewModel(
          getAllProductUseCase: gh<_i25.GetAllProductUseCase>(),
          addToCartUseCase: gh<_i21.AddToCartUseCase>(),
        ));
    gh.factory<_i29.RegisterScreenViewModel>(() => _i29.RegisterScreenViewModel(
        registerUseCase: gh<_i19.RegisterUseCase>()));
    return this;
  }
}
