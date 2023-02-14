import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/config/config.dart';
import 'package:testgetx/screen/home/data/repository_adapter.dart';
import 'package:testgetx/screen/home/model/productModel.dart';
import 'package:testgetx/utility/network/api_handler.dart';
import 'package:testgetx/utility/network/error_handler.dart';

class ProductController extends StateController<CasesModel>{
  ProductController({required this.homeRepository});

  final IHomeRepository homeRepository;

  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  set productList(List<ProductModel> value) {
    _productList = value;
    update();
  }

  var _isLoading = false.obs;
  get isLoading => _isLoading.value;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String editproductId = ''.obs();

  @override
  void onInit() {
    super.onInit();
    futurize(homeRepository.getProduct);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    qtyController.dispose();
  }

  setAddPagecntrlData(ProductModel productModel) {
    nameController.text = productModel.pname ?? "";
    priceController.text = productModel.price ?? "";
    qtyController.text = productModel.qty ?? "";
    editproductId = productModel.pid ?? "";
  }

  addProduct() async {
    FocusScope.of(Get.context!).unfocus();
    if (formKey.currentState!.validate()) {
      FormData form = FormData({
        "pname": nameController.text,
        "qty": qtyController.text,
        "price": priceController.text,
      });
      await homeRepository.addProduct(form).then((response) {
        if(response.status=="true"){
          futurize(homeRepository.getProduct);
          Get.back();
          nameController.clear();
          qtyController.clear();
          priceController.clear();
        }
      });
    }
  }

  editProduct() async {
    FocusScope.of(Get.context!).unfocus();
    if (formKey.currentState!.validate()) {
      FormData form = FormData({
        "pid": editproductId,
        "pname": nameController.text,
        "qty": qtyController.text,
        "price": priceController.text,
      });
      await homeRepository.editProduct(form).then((response) {
        if(response.status=="true"){
          futurize(homeRepository.getProduct);
          Get.back();
          nameController.clear();
          qtyController.clear();
          priceController.clear();
        }
      });
    }
  }

  deleteProduct({required pid}) async {
    FormData form = FormData({
      "pid": pid,
    });
    await homeRepository.deleteProduct(form).then((response) {
      if(response.status=="true"){
        futurize(homeRepository.getProduct);
      }
    });
  }
}
