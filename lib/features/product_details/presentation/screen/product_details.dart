import 'package:flutter/material.dart';
import 'package:e_commerce_app_route/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../widgets/product_description.dart';
import '../widgets/product_label.dart';
import '../widgets/product_rating.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity productEntity;

  ProductDetails({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: ColorManager.grey, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: ColorManager.primaryDark,
                    indicatorBackgroundColor: ColorManager.white,
                    indicatorBottomPadding: 20.h,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: productEntity.images!
                        .map((url) => Image.network(
                              url,
                              fit: BoxFit.cover,
                              height: 300.h,
                              width: double.infinity,
                            ))
                        .toList()),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            ProductLabel(
                productName: productEntity.title ?? '',
                productPrice: 'EGP ${productEntity.price}'),
            SizedBox(
              height: 16.h,
            ),
            ProductRating(
                productBuyers: '${productEntity.sold}',
                productRating: '${productEntity.ratingsAverage}'),
            SizedBox(
              height: 16.h,
            ),
            ProductDescription(
                productDescription: productEntity.description ?? ''),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                        Text('EGP ${productEntity.price}',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    label: 'Add to cart',
                    onTap: () {},
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: ColorManager.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
