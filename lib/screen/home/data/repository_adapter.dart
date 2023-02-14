import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:testgetx/screen/home/model/productModel.dart';

//ignore: one_member_abstracts
abstract class IHomeRepository {
  Future<CasesModel> getProduct();
  Future<CasesModel> deleteProduct(FormData body);
  Future<CasesModel> addProduct(FormData body);
  Future<CasesModel> editProduct(FormData body);
}
