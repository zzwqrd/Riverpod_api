import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod/screens/home/controller/model_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListViewModel>(
      builder: (ProductListViewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MVVM with GetX'),
          ),
          body: ProductListViewModel.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ProductListViewModel.list.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(ProductListViewModel.list[index].name!),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
