import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/features/home/presentation/widgets/product_card.dart';

import '../cubit/product_search_cubit.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 354.w,
          height: 42.h,
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: ColorManager.search,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.search,
                  color: ColorManager.primary, size: 24),
              SizedBox(width: 5.w),

              /// ✍️ TEXT FIELD
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Search for any Product',
                    hintStyle: getRegularStyle(
                        color: ColorManager.greyBorder),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    final cubit =
                    context.read<ProductSearchCubit>();

                    if (value.isEmpty) {
                      cubit.clearSearch();
                    } else {
                      cubit.getProducts(search: value);
                    }
                  },
                ),
              ),

              Icon(Icons.qr_code_scanner,
                  size: 24.sp, color: ColorManager.primary),
              const SizedBox(width: 8),
              const Icon(Icons.mic_none,
                  size: 24, color: ColorManager.primary),
            ],
          ),
        ),

        /// 🔥 RESULTS UNDER SEARCH BAR
        BlocBuilder<ProductSearchCubit, ProductSearchState>(
          builder: (context, state) {
            final cubit = context.read<ProductSearchCubit>();

            if (!cubit.hasSearch) {
              return const SizedBox();
            }

            if (state is ProductSearchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductSearchSuccess) {
              final products =
                  state.productSearchEntity.products;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    child: ProductCard(
                      meal: products[index],
                    ),
                  );
                },
              );
            }

            if (state is ProductSearchError) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(state.message),
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}