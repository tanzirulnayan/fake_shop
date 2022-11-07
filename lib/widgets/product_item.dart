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
            // leading: Consumer<Product>(
            //   builder: (ctx, product, child) => IconButton(
            //     onPressed: () {
            //       product.toggleFavorite();
            //     },
            //     icon: Icon(
            //         product.isFavorite ? Icons.favorite : Icons.favorite_outline),
            //     color: Theme.of(context).accentColor,
            //   ),
            // ),
            title: Text(
              product.title.toString(),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                // cart.addItem(product.id, product.price, product.title);
                // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text(
                //       'Item added to cart!',
                //       textAlign: TextAlign.start,
                //     ),
                //     duration: Duration(seconds: 2),
                //     action: SnackBarAction(
                //       label: 'UNDO',
                //       onPressed: () => cart.removeSingleItem(product.id),
                //     ),
                //   ),
                // );
              },
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).canvasColor,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context).pushNamed(
              //   ProductDetailsScreen.routeName,
              //   arguments: product.id,
              // );
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
