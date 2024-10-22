import 'package:flutter/material.dart';
import 'package:e_commerce_app_route/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/cubit/cart_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';

class CartItemWidget extends StatelessWidget {
  GetProductCartEntity productEntity;

  CartItemWidget({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    // bool isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: 398.w,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(children: [
        // display image in the container
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
          ),
          child: Image.network(
            productEntity.product?.imageCover ?? '',
            fit: BoxFit.cover,
            height: 140.h,
            width: 120.w,
          ),
        ),
        // SizedBox(width: 8.w),
        // display details product=========================
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // title and delete button ==
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        productEntity.product?.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //todo: delete item in cart
                        CartScreenViewModel.get(context)
                            .deleteItemInCart(productEntity.product?.id ?? '');
                      },
                      child: Image.asset(
                        IconsAssets.icDelete,
                        color: ColorManager.textColor,
                        height: 22.h,
                      ),
                    )
                  ],
                ),

                // SizedBox(height: 7.h),
                const Spacer(),
                // display color and size===================
                // display price and quantity =================
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${productEntity.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                //todo: decrement count
                                int count = productEntity.count!.toInt();
                                count--;
                                CartScreenViewModel.get(context)
                                    .updateCountInCart(
                                        productEntity.product?.id ?? "", count);
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 20.w,
                                color: ColorManager.white,
                              )),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            '${productEntity.count}',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          InkWell(
                              onTap: () {
                                //todo: increment count
                                int count = productEntity.count!.toInt();
                                count++;
                                CartScreenViewModel.get(context)
                                    .updateCountInCart(
                                        productEntity.product?.id ?? "", count);
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                color: ColorManager.white,
                                size: 20.w,
                              )),
                        ],
                      ),
                    )
                    // ProductCounter(
                    //   add: onIncrementTap,
                    //   productCounter: quantity,
                    //   remove: onDecrementTap,
                    // )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
