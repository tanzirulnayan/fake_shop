import 'package:fake_shop/models/common/error_model.dart';
import 'package:fake_shop/models/product/product.dart';

class ProductResponse extends ErrorModel {
  ProductResponse({
    required this.product,
  }) : super(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Oops! Something went wrong.',
        );

  Product product;
}
