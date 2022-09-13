import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod/helper/btn.dart';
import 'package:riverpod/screens/home/controller/model_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListViewModel>(
      builder: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MVVM with GetX'),
          ),
          body: data.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.list.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Image.network(data.list[index].image,width: 100,height: 120,),
                        Text(data.list[index].name!),
                      ],
                    );
                  },
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Btn(
            onTap: () {
              Get.toNamed('/add_products');
            },
            txt: 'Add Products',
          ),
        );
      },
    );
  }
}
