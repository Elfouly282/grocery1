import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/string_constants.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/core/utils/app_toast.dart';
import 'package:grocery1/feature/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:grocery1/feature/product_details/presentation/view_model/product_details_state.dart';
import 'package:grocery1/feature/product_details/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:grocery1/feature/product_details/presentation/widgets/detail_card_widget.dart';
import 'package:grocery1/feature/product_details/presentation/widgets/helpers/format_how_to_use.dart';
import 'package:grocery1/feature/product_details/presentation/widgets/helpers/get_formatted_expiry.dart';
import 'package:grocery1/feature/product_details/presentation/widgets/product_details_skeletonizer_widget.dart';
import 'package:toastification/toastification.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  final Color primaryColor = const Color(0xFF003B5C);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Text(
          StringConstants.productDetailsTitle,
          style: getMediumStyle(
            color: ColorManager.black,
            fontSize: Sizes.s18,
            fontFamily: FontConstants.interFontFamily,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: ColorManager.black,
              size: Sizes.s28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.black,
              size: Sizes.s28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: Sizes.s16),
        ],
      ),
      body: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          if (state is ProductDetailsErrorState) {
            AppToast.showToast(
              context: context,
              title: StringConstants.errorTitle,
              description: state.errorMessage,
              type: ToastificationType.error,
            );
          } else if (state is! ProductDetailsLoadingState &&
              state is! ProductDetailsInitialState &&
              state is! ProductDetailsSuccessState) {
            AppToast.showToast(
              context: context,
              title: StringConstants.errorTitle,
              description: 'Unexpected state encountered.',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state is ProductDetailsInitialState ||
              state is ProductDetailsLoadingState) {
            return const ProductDetailsSkeletonizerWidget();
          } else if (state is ProductDetailsSuccessState) {
            var item = state.productDetailsResponseEntity.data;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(Insets.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Sizes.s240,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.s16),
                          image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: Sizes.s12,
                        right: Sizes.s12,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.white,
                          radius: Sizes.s20,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: Sizes.s20,
                            ),
                            onPressed: () {
                              //* favorite action here
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.s20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: Sizes.s24,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '£${item.finalPrice}',
                            style: getBoldStyle(
                              color: primaryColor,
                              fontSize: Sizes.s22,
                            ),
                          ),
                          const SizedBox(width: Sizes.s8),
                          Text(
                            '£${item.price}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.s8),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        if (item.rating >= index + 1) {
                          return const Icon(
                            Icons.star,
                            color: ColorManager.amber,
                            size: Sizes.s20,
                          );
                        } else if (item.rating > index) {
                          return const Icon(
                            Icons.star_half,
                            color: ColorManager.amber,
                            size: Sizes.s20,
                          );
                        } else {
                          return Icon(
                            Icons.star,
                            color: ColorManager.grey,
                            size: Sizes.s20,
                          );
                        }
                      }),

                      const SizedBox(width: Sizes.s8),
                      Text(
                        '(${item.rating})',
                        style: getMediumStyle(
                          color: Colors.grey,
                          fontSize: Sizes.s14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.s24),

                  Text(
                    'Detailes',
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: Sizes.s18,
                    ),
                  ),
                  const SizedBox(height: Sizes.s12),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: DetailCardWidget(
                            title: StringConstants.includesTitle,
                            value: item.includes,
                          ),
                        ),
                        SizedBox(width: Sizes.s12),
                        Expanded(
                          child: DetailCardWidget(
                            title: StringConstants.sizeTitle,
                            value: item.size,
                          ),
                        ),
                        SizedBox(width: Sizes.s12),
                        Expanded(
                          child: DetailCardWidget(
                            title: StringConstants.expiryTitle,
                            value: getFormattedExpiry(item.expiryDate),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Sizes.s24),

                  Text(
                    StringConstants.descriptionTitle,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: Sizes.s18,
                    ),
                  ),
                  const SizedBox(height: Sizes.s8),
                  Text(
                    item.description,
                    style: getRegularStyle(
                      color: Colors.grey,
                      fontSize: Sizes.s15,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    StringConstants.howToUseTitle,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: Sizes.s18,
                    ),
                  ),
                  const SizedBox(height: Sizes.s8),
                  Text(
                    formatHowToUse(item.howToUse),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: Sizes.s100),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: Sizes.s80,
                    color: ColorManager.grey,
                  ),
                  const SizedBox(height: Sizes.s16),
                  Text(
                    StringConstants.somethingWentWrong,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: Sizes.s18,
                    ),
                  ),
                  const SizedBox(height: Sizes.s8),
                  Text(
                    StringConstants.pleaseTryAgainLater,
                    style: getRegularStyle(
                      color: Colors.grey,
                      fontSize: Sizes.s14,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(quantity: quantity),
    );
  }
}
