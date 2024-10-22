import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/core/resources/color_manager.dart';
import 'package:e_commerce_app_route/core/routes_manager/routes.dart';
import 'package:e_commerce_app_route/features/product_details/presentation/screen/product_details.dart';
import 'package:e_commerce_app_route/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:e_commerce_app_route/features/products_screen/presentation/cubit/product_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
      bloc: ProductScreenViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.white,
            title: SvgPicture.asset(
              SvgAssets.routeLogo,
              height: 25.h,
              width: 25.w,
              colorFilter: const ColorFilter.mode(
                  ColorManager.textColor, BlendMode.srcIn),
            ),
            bottom: PreferredSize(
                preferredSize: const Size(AppSize.s100, AppSize.s60),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: ColorManager.primary,
                          style: getRegularStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppMargin.m12.w,
                                vertical: AppMargin.m8.h),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1,
                                    color: ColorManager.primary)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1,
                                    color: ColorManager.primary)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1,
                                    color: ColorManager.primary)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1,
                                    color: ColorManager.primary)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10000),
                                borderSide: BorderSide(
                                    width: AppSize.s1,
                                    color: ColorManager.error)),
                            prefixIcon: ImageIcon(
                              AssetImage(IconsAssets.icSearch),
                              color: ColorManager.primary,
                            ),
                            hintText: "what do you search for?",
                            hintStyle: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s16),
                          ),
                        ),
                      ),
                      Badge(
                        label: Text(ProductScreenViewModel.get(context)
                            .numOfCartItems
                            .toString()),
                        child: IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.cartRoute),
                            icon: ImageIcon(
                              AssetImage(IconsAssets.icCart),
                              color: ColorManager.primary,
                            )),
                      )
                    ],
                  ),
                )),
            // leading: const SizedBox.shrink(),
          ),
          body: state is ProductLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryDark,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: ProductScreenViewModel.get(context)
                              .productsList!
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                          productEntity:
                                              ProductScreenViewModel.get(
                                                      context)
                                                  .productsList![index],
                                        )));
                              },
                              child: ProductItemWidget(
                                  productEntity:
                                      ProductScreenViewModel.get(context)
                                          .productsList![index]),
                            );
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      )
                    ],
                  ),
                ),
        );

        if (state is ProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryDark,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.white,
              title: SvgPicture.asset(
                SvgAssets.routeLogo,
                height: 25.h,
                width: 25.w,
                colorFilter: const ColorFilter.mode(
                    ColorManager.textColor, BlendMode.srcIn),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size(AppSize.s100, AppSize.s60),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: ColorManager.primary,
                            style: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppMargin.m12.w,
                                  vertical: AppMargin.m8.h),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10000),
                                  borderSide: BorderSide(
                                      width: AppSize.s1,
                                      color: ColorManager.primary)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10000),
                                  borderSide: BorderSide(
                                      width: AppSize.s1,
                                      color: ColorManager.primary)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10000),
                                  borderSide: BorderSide(
                                      width: AppSize.s1,
                                      color: ColorManager.primary)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10000),
                                  borderSide: BorderSide(
                                      width: AppSize.s1,
                                      color: ColorManager.primary)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10000),
                                  borderSide: BorderSide(
                                      width: AppSize.s1,
                                      color: ColorManager.error)),
                              prefixIcon: ImageIcon(
                                AssetImage(IconsAssets.icSearch),
                                color: ColorManager.primary,
                              ),
                              hintText: "what do you search for?",
                              hintStyle: getRegularStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.cartRoute),
                            icon: ImageIcon(
                              AssetImage(IconsAssets.icCart),
                              color: ColorManager.primary,
                            ))
                      ],
                    ),
                  )),
              // leading: const SizedBox.shrink(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: ProductScreenViewModel.get(context)
                          .productsList!
                          .length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 7 / 9,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (ProductScreenViewModel.get(context)
                                    .productsList?[index] !=
                                null) {
                              Navigator.of(context).pushNamed(
                                  Routes.productDetails,
                                  arguments: ProductScreenViewModel.get(context)
                                      .productsList?[index]);
                            }
                          },
                          child: ProductItemWidget(
                              productEntity: ProductScreenViewModel.get(context)
                                  .productsList![index]),
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
