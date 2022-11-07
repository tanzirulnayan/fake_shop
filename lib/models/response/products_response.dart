import 'package:fake_shop/models/common/error_model.dart';
import 'package:fake_shop/models/product/product.dart';

class ProductsResponse extends ErrorModel {
  ProductsResponse({
    required this.productList,
  }) : super(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Oops! Something went wrong.',
        );

  List<Product> productList;
}
