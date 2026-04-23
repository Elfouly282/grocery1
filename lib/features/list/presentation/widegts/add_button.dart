// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../cubit/list_cubit.dart';
// import '../cubit/list_state.dart';

// class AddButton extends StatelessWidget {
//   final TextEditingController controller;

//   const AddButton({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ListCubit, ListState>(
//       listener: (context, state) {
//         if (state is ListSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("List Created Successfully")),
//           );
//         }

//         if (state is ListError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         }
//       },
//       builder: (context, state) {
//         return SizedBox(
//           width: double.infinity,
//           height: 55,
//           child: ElevatedButton(
//             onPressed: state is ListLoading
//                 ? null
//                 : () {
//                     context
//                         .read<ListCubit>()
//                         .createList(controller.text);
//                   },
//             child: state is ListLoading
//                 ? const CircularProgressIndicator(color: Colors.white)
//                 : const Text("Add to my lists"),
//           ),
//         );
//       },
//     );
//   }
// }
