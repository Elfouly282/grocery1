import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../cubit/cart_cubit.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        return Drawer(
          width: 0.85.sw,
          child: SafeArea(
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('My Cart (${state.totalItems})',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.black)),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                Expanded(
                  child: state.items.isEmpty
                      ? Center(
                    child: Text('Your cart is empty',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorManager.grey)),
                  )
                      : ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return CartItemTile(
                        item: item,
                        onIncrement: () => cubit.incrementQuantity(item.id),
                        onDecrement: () => cubit.decrementQuantity(item.id),
                        onRemove: () => cubit.removeFromCart(item.id),
                      );
                    },
                  ),
                ),

                const Divider(height: 1),

                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                          Text('\$${cubit.total.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.primary)),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: state.items.isEmpty ? null : () {},
                          child: Text('Proceed to Checkout',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorManager.appbarBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.lightGrey),
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.image,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 60.w,
                height: 60.h,
                color: ColorManager.lightGrey,
                child: const Icon(Icons.image_outlined, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.w600)),
                SizedBox(height: 4.h),
                Text('\$${item.price.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          Row(
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  width: 26.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.lightGrey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.remove, size: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text('${item.quantity}',
                    style: TextStyle(fontSize: 13.sp)),
              ),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  width: 26.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.add, size: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}