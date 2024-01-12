import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezda_assessent_task/bloc/product_cubit.dart';
import 'package:tezda_assessent_task/model/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().isProductInFavorites(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(listener: (context, state) {
      print('State is $state');
      if (state is ProductIsFavorite) {
        isFavorite = state.isFavorite;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
          actions: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? Colors.red
                    : const Color.fromARGB(255, 220, 211, 211),
              ),
              onPressed: () {
                _toggleFavorite();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 50),
            color: const Color.fromARGB(255, 150, 186, 215),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    'Title: ${widget.product.title}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Text('Description: ${widget.product.description}'),
                ),
                const Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(
                    'Price: \$${widget.product.price}',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(
                    'Category: ${widget.product.category}',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(
                    'Rating: ${widget.product.rating.rate} ★ (${widget.product.rating.count} reviews)',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _toggleFavorite() {
    final productCubit = context.read<ProductCubit>();
    if (isFavorite) {
      productCubit.removeProductFromFavorites(widget.product);
    } else {
      productCubit.addProductToFavorites(widget.product);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }
}
