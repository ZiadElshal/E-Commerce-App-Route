import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/core/widget/dialog_utils.dart';
import 'package:e_commerce_app_route/features/cart/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app_route/features/cart/cubit/cart_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenViewModel, CartStates>(
      bloc: CartScreenViewModel.get(context)..getCart(),
      listener: (context, state) {
        if (state is UpdateCountInCartErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: ColorManager.primaryDark),
            title: Text(
              'Cart',
              style:
                  getMediumStyle(fontSize: 20, color: ColorManager.textColor),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(
                    IconsAssets.icSearch,
                  ),
                  color: ColorManager.primary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(IconsAssets.icCart),
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          body: state is GetCartSuccessState
              ? Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Column(
                    children: [
                      Expanded(
                        // the list of cart items ===============
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            productEntity:
                                state.cartResponseEntity.data!.products![index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount:
                              state.cartResponseEntity.data!.products!.length,
                        ),
                      ),
                      // the total price and checkout button========
                      TotalPriceAndCheckoutBotton(
                        totalPrice: state
                            .cartResponseEntity.data!.totalCartPrice!
                            .toInt(),
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: ColorManager.primary,
                )),
        );
      },
    );
  }
}
