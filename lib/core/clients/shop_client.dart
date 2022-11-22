import 'dart:convert';

import 'package:fake_shop/core/clients/base_client.dart';
import 'package:fake_shop/core/constants/action_url.dart';
import 'package:fake_shop/models/product/product.dart';
import 'package:fake_shop/models/response/product_response.dart';
import 'package:fake_shop/models/response/products_response.dart';

class ShopClient {
  final _baseClient = BaseClient();

  Future<ProductsResponse> getProducts() async {
    final productsResponse = ProductsResponse(productList: <Product>[]);
    final productList = <Product>[];

    final result = await _baseClient.dioGet(
      actionUrl: ActionUrl.getProducts,
    );

    final deserializedProducts =
        jsonDecode(result.responseStr) as List<dynamic>;
    for (final element in deserializedProducts) {
      final product = Product.fromJson(jsonEncode(element));
      productList.add(product);
    }

    productsResponse
      ..productList = result.hasError ? <Product>[] : productList
      ..hasError = result.hasError
      ..errorType = 'Error'
      ..errorMessage = result.errorMessage;

    return productsResponse;
  }

  Future<ProductResponse> addProduct({
    required Product prod,
  }) async {
    final productResponse = ProductResponse(product: const Product());

    final params = <String, dynamic>{
      'title': prod.title,
      'price': prod.price,
      'description': prod.description,
      'image': prod.image,
      'category': prod.category
    };

    final result = await _baseClient.dioPost(
      actionUrl: ActionUrl.getProducts,
      queryParams: params,
    );

    final product = Product.fromJson(result.responseStr);

    productResponse
      ..product = result.hasError ? const Product() : product
      ..hasError = result.hasError
      ..errorType = 'Error'
      ..errorMessage = result.errorMessage;

    return productResponse;
  }

  Future<ProductResponse> deleteProduct({required int id}) async {
    final productResponse = ProductResponse(product: const Product());

    final result = await _baseClient.dioDelete(
      actionUrl: ActionUrl.getProducts,
      id: id,
    );

    final product = Product.fromJson(result.responseStr);

    productResponse
      ..product = result.hasError ? const Product() : product
      ..hasError = result.hasError
      ..errorType = 'Error'
      ..errorMessage = result.errorMessage;

    return productResponse;
  }
}
