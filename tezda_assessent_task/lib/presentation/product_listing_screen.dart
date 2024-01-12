import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezda_assessent_task/bloc/product_cubit.dart';
import 'package:tezda_assessent_task/config/app_router.dart';
import 'package:tezda_assessent_task/model/product_model.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  late ProductCubit productCubit;

  @override
  void initState() {
    super.initState();
    productCubit = BlocProvider.of<ProductCubit>(context);
    productCubit.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOP NOW'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_rounded,
              color: Colors.orange,
            ),
            onPressed: () {
              _navigateToFavoritesPage(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: StreamBuilder<List<Product>>(
          stream: productCubit.productsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;
              return _buildGrid(products);
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading products'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildGrid(List<Product> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              _navigateToDetailsPage(context, products[index]);
            },
            child: _buildProductCard(products[index]));
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Container(
                width: 200,
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('\$${product.price}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailsPage(BuildContext context, Product product) {
    GoRouter.of(context)
        .push(Routes.productDetail, extra: {'product': product});
  }

  void _navigateToFavoritesPage(BuildContext context) {
    GoRouter.of(context).push(Routes.favorites);
  }

  @override
  void dispose() {
    productCubit.close();
    super.dispose();
  }
}
