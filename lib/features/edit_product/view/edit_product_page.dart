import 'package:fake_shop/features/edit_product/bloc/edit_product_bloc.dart';
import 'package:fake_shop/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({
    super.key,
    required this.product,
  });
  static const routeName = '/editProduct';
  final Product product;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final GlobalKey<FormState> _editProductFormKey = GlobalKey();

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments! as Product;

    titleController.text = product.title!;
    priceController.text = product.price!.toString();
    descriptionController.text = product.description!;
    imageController.text = product.image!;
    categoryController.text = product.category!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _editProductFormKey,
            child: Column(
              children: [
                BlocConsumer<EditProductBloc, EditProductState>(
                  builder: (context, state) {
                    return Container();
                  },
                  listener: (context, state) {
                    if (state is EditProductSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                    if (state is EditProductFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Theme.of(context).errorColor,
                        ),
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      flex: 12,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Title',
                            hintStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Title',
                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            contentPadding: const EdgeInsets.all(18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.production_quantity_limits_outlined,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: titleController,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      flex: 12,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Price',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          labelText: 'Price',
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding: const EdgeInsets.all(18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.price_change_outlined,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: priceController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      flex: 12,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Description',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          labelText: 'Description',
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding: const EdgeInsets.all(18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.description_outlined,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: descriptionController,
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      flex: 12,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Image Link',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          labelText: 'Image Link',
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding: const EdgeInsets.all(18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.image_outlined,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: imageController,
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      flex: 12,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Category',
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          labelText: 'Category',
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          contentPadding: const EdgeInsets.all(18),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.category_outlined,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: categoryController,
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(),
                    ),
                    Flexible(
                      flex: 12,
                      child: SizedBox(
                        height: 46,
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_editProductFormKey.currentState!.validate()) {
                              final prod = Product(
                                id: product.id,
                                title: titleController.text,
                                price: double.parse(priceController.text),
                                description: descriptionController.text,
                                image: imageController.text,
                                category: categoryController.text,
                              );

                              BlocProvider.of<EditProductBloc>(context).add(
                                EditProductOnTap(
                                  product: prod,
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).secondaryHeaderColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Edit Product',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
