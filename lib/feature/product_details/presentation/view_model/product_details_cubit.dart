import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/feature/product_details/domain/use_case/product_details_use_case.dart';
import 'package:grocery1/feature/product_details/presentation/view_model/product_details_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsUseCase)
    : super(ProductDetailsInitialState());
  final ProductDetailsUseCase _productDetailsUseCase;
  Future<void> getProductDetails(int productId) async {
    emit(ProductDetailsLoadingState());
    final result = await _productDetailsUseCase.invoke(productId);
    result.fold(
      (failure) =>
          emit(ProductDetailsErrorState(errorMessage: failure.failuremessage)),
      (productDetails) => emit(
        ProductDetailsSuccessState(
          productDetailsResponseEntity: productDetails,
        ),
      ),
    );
  }
}
