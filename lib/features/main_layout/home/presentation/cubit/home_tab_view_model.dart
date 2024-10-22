import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app_route/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app_route/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce_app_route/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:e_commerce_app_route/features/main_layout/home/presentation/home_tab.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase ;

  HomeTabViewModel({required this.getAllCategoriesUseCase,
  required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> sliderImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3
  ];

  static HomeTabViewModel get(context)=> BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoriesErrorState(failures: error));
    }, (response) {
        categoriesList = response.data!;
        if(brandsList.isNotEmpty) {
          emit(HomeCategoriesSuccessState(categoryResponseEntity: response));
        }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      if(categoriesList.isNotEmpty) {
        emit(HomeBrandsSuccessState(brandsResponseEntity: response));
      }
    }
    );
  }
}
