import 'package:fake_shop/features/product_details/view/product_details_page.dart';
import 'package:fake_shop/models/product/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              product.title.toString(),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).canvasColor,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsPage.routeName,
                arguments: product,
              );
            },
            child: Image.network(
              product.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
