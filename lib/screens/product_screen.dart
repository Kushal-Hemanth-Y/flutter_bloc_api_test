import 'package:bloc_pattern_cs_test/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
      ),

      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
            if(state is ProductsLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Loaded')));
          }
          else if(state is ProductsErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Not Loaded')));
          }
        },
        builder: (context, state) {
         if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
                itemCount: state.productsModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(state.productsModel[index].category.toString()),
                  );
                });
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
