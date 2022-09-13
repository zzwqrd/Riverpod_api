

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod/screens/add_products/controller/model.dart';
import 'package:riverpod/screens/add_products/controller/rest_api.dart';

class ApiAddProducts extends GetxController with GetSingleTickerProviderStateMixin{
  var isLoading = false.obs;
  var list = <ProductsStoreModel>{}.obs;
  @override
  void onInit() {
    AddData();
    super.onInit();
  }

  _showProgressBar() {
    isLoading.value = true;
    update();
  }

  _hideProgressBar() {
    isLoading.value = false;
    update();
  }

  Future<void> AddData({
    ///     [][][][][][][] هنا بمرر الاسم الي هضيفه
     TextEditingController? nameController,

    ///     [][][][][][][] هنا بمرر الوصف الي هضيفه
     TextEditingController? descriptionController,

    ///     [][][][][][][] هنا بمرر التخفيض الي هضيفه
     TextEditingController? discountController,

    ///     [][][][][][][] هنا بمرر السعر الي هضيفه
     TextEditingController? priceController,

    ///     [][][][][][][] هنا بمرر الصوره  الي هضيفه
     File? image,
}) async {
    _showProgressBar();
    try {
      list.value = (await AddProducts().fetchData(
        nameController: nameController!,
        descriptionController: descriptionController!,
        discountController: discountController!,
        priceController: priceController!,
        image: image!,
      )) as Set<ProductsStoreModel>;
      _hideProgressBar();
    } catch (e) {
      log(e.toString());
      _hideProgressBar();
    }
    _hideProgressBar();
  }
}
