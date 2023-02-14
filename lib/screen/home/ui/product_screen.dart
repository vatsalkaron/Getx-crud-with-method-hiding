import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/screen/home/ui/add_product.dart';
import 'package:testgetx/screen/home/controllers/product_controller.dart';
import 'package:testgetx/screen/home/data/repository_adapter.dart';
import 'package:testgetx/screen/home/model/productModel.dart';

class ProductScreen extends GetView<ProductController> {
  IHomeRepository homeRepository = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
        ),
      ),
      body: controller.obx(
        (state) => RefreshIndicator(
          color: Theme.of(context).primaryColor,
          displacement: 100,
          onRefresh: () => homeRepository.getProduct(),
          child: ListView.separated(
            padding: EdgeInsets.all(5),
            physics: BouncingScrollPhysics(),
            itemCount: state!.productList.length,
            separatorBuilder: (_,__) => Divider(),
            itemBuilder: (ctx, index) {
              ProductModel data = state.productList[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                title: Text(
                  data.pname!,
                  maxLines: 1,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "QTY =  ${data.qty!.toString()}",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Price = ${data.price!.toString()}",
                    ),
                  ],
                ),
                trailing: Container(
                  width: MediaQuery.of(context).size.width / 3.6,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.setAddPagecntrlData(data);
                            Get.to(()=>AddProduct(isEdited: true));
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Delete",
                              middleText: "Are you sure you want to delete?",
                              confirm: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        "No",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                        elevation: MaterialStatePropertyAll(2),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Text("Yes"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.blue),
                                        elevation: MaterialStatePropertyAll(2),
                                      ),
                                      onPressed: () async{
                                        Get.back();
                                        controller.deleteProduct(pid: data.pid);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              radius: 10,
                            );
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  child: Text(
                    data.pname!.isNotEmpty ? data.pname![0] : "p",
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(()=>AddProduct());
          },
          child: Icon(Icons.add)),
    );
  }
}
