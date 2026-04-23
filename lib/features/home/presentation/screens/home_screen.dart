import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/home/presentation/cubit/home_cubit.dart';
import 'package:grocery1/features/home/presentation/widgets/cart_drawer.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/category_cubit.dart';
import '../cubit/product_search_cubit.dart';
import '../cubit/recommended_cubit.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/recommended_section.dart';
import '../widgets/todays_deals_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getit<HomeCubit>()..getTodayDeals(),
        ),
        BlocProvider(
          create: (context) =>
          getit<RecommendedCubit>()..getRecommendedForYou(),
        ),
        BlocProvider(
          create: (context) => getit<CategoryCubit>()..getAllCategory(),
        ),
        BlocProvider(
          create: (context) => getit<CartCubit>(),
        ),
        BlocProvider(
          create: (context) => getit<ProductSearchCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.white,
        endDrawer: const CartDrawer(),

        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeSuccess) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const HomeHeader(),

                      Expanded(
                        child: BlocBuilder<ProductSearchCubit,
                            ProductSearchState>(
                          builder: (context, searchState) {
                            final searchCubit =
                            context.read<ProductSearchCubit>();

                            if (searchCubit.hasSearch) {
                              if (searchState
                              is ProductSearchLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (searchState is ProductSearchError) {
                                return Center(
                                  child: Text(searchState.message),
                                );
                              }

                              if (searchState
                              is ProductSearchSuccess) {
                                final products = searchState
                                    .productSearchEntity.products;

                                if (products.isEmpty) {
                                  return const Center(
                                    child: Text("No products found"),
                                  );
                                }

                                return ListView.builder(
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    final product = products[index];

                                    return Card(
                                      margin:
                                      const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8),
                                      child: ListTile(
                                        title:
                                        Text(product.name ?? ""),
                                        subtitle: Text(
                                            product.price.toString()),
                                      ),
                                    );
                                  },
                                );
                              }

                              return const SizedBox();
                            }

                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const HomeSearchBar(),
                                  TodayDealsBanner(
                                      deals: state.meals),

                                  BlocBuilder<CategoryCubit,
                                      CategoryState>(
                                    builder:
                                        (context, categoryState) {
                                      if (categoryState
                                      is CategoryLoading) {
                                        return const CircularProgressIndicator();
                                      }
                                      if (categoryState
                                      is CategorySuccess) {
                                        return CategoriesSection(
                                          categories: categoryState
                                              .categories,
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),

                                  BlocBuilder<RecommendedCubit,
                                      RecommendedState>(
                                    builder:
                                        (context, recommendedState) {
                                      if (recommendedState
                                      is RecommendedLoading) {
                                        return const CircularProgressIndicator();
                                      }
                                      if (recommendedState
                                      is RecommendedSuccess) {
                                        return RecommendedSection(
                                          meals: recommendedState.meals,
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),

                                  const SizedBox(height: 20),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is HomeError) {
              return Center(child: Text(state.errorMessage));
            }

            return const SizedBox();
          },
        ),

        bottomNavigationBar: HomeBottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: (index) =>
              setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}