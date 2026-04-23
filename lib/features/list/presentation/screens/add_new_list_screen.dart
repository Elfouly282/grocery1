import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/list/presentation/cubit/list_cubit.dart';
import 'package:grocery1/features/list/presentation/cubit/list_state.dart';
import 'package:grocery1/features/list/presentation/widegts/image_picker_widget.dart';
import 'package:grocery1/features/list/presentation/widegts/product_item.dart';

class AddNewListScreen extends StatefulWidget {
  const AddNewListScreen({super.key});

  @override
  State<AddNewListScreen> createState() => _AddSmartListPageState();
}

class _AddSmartListPageState extends State<AddNewListScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Add a new List",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: BlocConsumer<SmartListCubit, SmartListState>(
        listener: (context, state) {
          if (state is SmartListLoading) return;

          /// نجاح
          if (state is SmartListSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("List created successfully")),
            );
            Navigator.pop(context);
          }
        },

        builder: (context, state) {
          final cubit = context.read<SmartListCubit>();

          return Form(
            key: _formKey,
            child: Column(
              children: [
                /// 🔹 CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🔹 IMAGE
                        Center(
                          child: ImagePickerWidget(
                            imagePath: cubit.imagePath,
                            onTap: () {
                              cubit.pickImage();
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 NAME
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Name of List",
                            prefixIcon: const Icon(Icons.list),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 12),

                        /// 🔹 DESCRIPTION
                        TextFormField(
                          controller: descController,
                          decoration: InputDecoration(
                            hintText: "Description",
                            prefixIcon: const Icon(Icons.description),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 TITLE
                        const Text(
                          "Select Products",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// 🔹 PRODUCTS GRID
                        cubit.products.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cubit.products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 12,
                                      childAspectRatio: 0.75,
                                    ),
                                itemBuilder: (context, index) {
                                  final product = cubit.products[index];

                                  return ProductItemWidget(
                                    id: product.id,
                                    isSelected: cubit.selectedMeals.contains(
                                      product.id,
                                    ),
                                    onTap: () {
                                      cubit.toggleMeal(product.id);
                                    },
                                  );
                                },
                              ),

                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),

                /// 🔹 BUTTON
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: state is SmartListLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SmartListCubit>().submit(
                                name: nameController.text,
                                description: descController.text,
                              );
                            }
                          },
                    child: state is SmartListLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Add to my lists",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
