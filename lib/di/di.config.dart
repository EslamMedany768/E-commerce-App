// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../Core/api/api_manager.dart' as _i405;
import '../data/data_source/remote_data_source_impl/authRemoteDataSourceImpl.dart'
    as _i434;
import '../data/data_source/remote_data_source_impl/cart_remote_data_source_impl.dart'
    as _i1016;
import '../data/data_source/remote_data_source_impl/home_remote_data_source_impl.dart'
    as _i285;
import '../data/data_source/remote_data_source_impl/wishlist_remote_data_source_impl.dart'
    as _i1007;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/cart_repository_impl.dart' as _i47;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../data/repository/wishlist_repository_impl.dart' as _i529;
import '../domain/repository/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i975;
import '../domain/repository/data_sources/remote_data_source/cart_remote_data_source.dart'
    as _i948;
import '../domain/repository/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i773;
import '../domain/repository/data_sources/remote_data_source/wishlist_remote_data_source.dart'
    as _i596;
import '../domain/repository/repositories/auth_repository.dart' as _i840;
import '../domain/repository/repositories/cart_repository.dart' as _i44;
import '../domain/repository/repositories/home_repository.dart' as _i38;
import '../domain/repository/repositories/wishlist_repository.dart' as _i732;
import '../domain/use_cases/add_to_cart.dart' as _i950;
import '../domain/use_cases/add_to_wishlist.dart' as _i802;
import '../domain/use_cases/delete_cart_item.dart' as _i183;
import '../domain/use_cases/get_all_brands.dart' as _i253;
import '../domain/use_cases/get_all_categories.dart' as _i421;
import '../domain/use_cases/get_all_products.dart' as _i419;
import '../domain/use_cases/get_cart_items_use_case.dart' as _i400;
import '../domain/use_cases/get_wishlist_items_use_case.dart' as _i29;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_cart_item.dart' as _i866;
import '../feature/ui/auth/login/cubit/login_view_model.dart' as _i702;
import '../feature/ui/auth/register/cubit/register_view_model.dart' as _i601;
import '../feature/ui/pages/cart_screen/cubit/cart_view_model.dart' as _i284;
import '../feature/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i994;
import '../feature/ui/pages/home_screen/tabs/home_tab/home_tab.dart' as _i35;
import '../feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart'
    as _i198;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i405.ApiManager>(() => _i405.ApiManager());
    gh.factory<_i35.HomeTab>(() => _i35.HomeTab(key: gh<_i409.Key>()));
    gh.factory<_i975.AuthRemoteDataSource>(
      () => _i434.AuthRemoteDataSourceImpl(apiManager: gh<_i405.ApiManager>()),
    );
    gh.factory<_i948.CartRemoteDataSource>(
      () => _i1016.CartRemoteDataSourceImpl(apiManager: gh<_i405.ApiManager>()),
    );
    gh.factory<_i596.WishlistRemoteDataSource>(
      () => _i1007.WishlistRemoteDataSourceImpl(
        apiManager: gh<_i405.ApiManager>(),
      ),
    );
    gh.factory<_i773.HomeRemoteDataSource>(
      () => _i285.HomeRemoteDataSourceImpl(apiManager: gh<_i405.ApiManager>()),
    );
    gh.factory<_i732.WishlistRepository>(
      () => _i529.WishlistRepositoryImpl(
        wishlistRemoteDataSource: gh<_i596.WishlistRemoteDataSource>(),
      ),
    );
    gh.factory<_i840.AuthRepository>(
      () => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i975.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i826.LoginUseCase>(
      () => _i826.LoginUseCase(authRepository: gh<_i840.AuthRepository>()),
    );
    gh.factory<_i772.RegisterUseCase>(
      () => _i772.RegisterUseCase(authRepository: gh<_i840.AuthRepository>()),
    );
    gh.factory<_i44.CartRepository>(
      () => _i47.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i948.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i38.HomeRepository>(
      () => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i773.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i702.LoginViewModel>(
      () => _i702.LoginViewModel(loginUseCase: gh<_i826.LoginUseCase>()),
    );
    gh.factory<_i802.AddToWishlistUseCase>(
      () => _i802.AddToWishlistUseCase(
        wishlistRepository: gh<_i732.WishlistRepository>(),
      ),
    );
    gh.factory<_i29.GetWishlistItemsUseCase>(
      () => _i29.GetWishlistItemsUseCase(
        wishlistRepository: gh<_i732.WishlistRepository>(),
      ),
    );
    gh.factory<_i601.RegisterViewModel>(
      () =>
          _i601.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()),
    );
    gh.factory<_i950.AddToCartUseCase>(
      () => _i950.AddToCartUseCase(homeRepository: gh<_i38.HomeRepository>()),
    );
    gh.factory<_i253.GetAllBrandsUseCase>(
      () =>
          _i253.GetAllBrandsUseCase(homeRepository: gh<_i38.HomeRepository>()),
    );
    gh.factory<_i421.GetAllCategoriesUseCase>(
      () => _i421.GetAllCategoriesUseCase(
        homeRepository: gh<_i38.HomeRepository>(),
      ),
    );
    gh.factory<_i419.GetAllProductsUseCase>(
      () => _i419.GetAllProductsUseCase(
        homeRepository: gh<_i38.HomeRepository>(),
      ),
    );
    gh.factory<_i183.DeleteCartItemUseCase>(
      () => _i183.DeleteCartItemUseCase(
        cartRepository: gh<_i44.CartRepository>(),
      ),
    );
    gh.factory<_i400.GetCartItemsUseCase>(
      () =>
          _i400.GetCartItemsUseCase(cartRepository: gh<_i44.CartRepository>()),
    );
    gh.factory<_i866.UpdateCartItemUseCase>(
      () => _i866.UpdateCartItemUseCase(
        cartRepository: gh<_i44.CartRepository>(),
      ),
    );
    gh.factory<_i994.HomeTabViewModel>(
      () => _i994.HomeTabViewModel(
        getAllCategoriesUseCase: gh<_i421.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i253.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i198.ProductTabViewModel>(
      () => _i198.ProductTabViewModel(
        addToWishlistUseCase: gh<_i802.AddToWishlistUseCase>(),
        getAllProductsUseCase: gh<_i419.GetAllProductsUseCase>(),
        addToCartUseCase: gh<_i950.AddToCartUseCase>(),
        getWishlistItemsUseCase: gh<_i29.GetWishlistItemsUseCase>(),
      ),
    );
    gh.factory<_i284.CartViewModel>(
      () => _i284.CartViewModel(
        getCartItemsUseCase: gh<_i400.GetCartItemsUseCase>(),
        deleteCartItemUseCase: gh<_i183.DeleteCartItemUseCase>(),
        updateCartItemUseCase: gh<_i866.UpdateCartItemUseCase>(),
      ),
    );
    return this;
  }
}
