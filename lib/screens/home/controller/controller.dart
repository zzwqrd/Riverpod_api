import 'package:riverpod/helper/server_gate.dart';
import 'package:riverpod/screens/home/controller/model.dart';

class ApiProducts {
  final ServerGate serverGate = ServerGate();
  ProductsModel model = ProductsModel();
  Future<List<ProductData>> fetchData() async {
    serverGate.addInterceptors();
    CustomResponse response = await serverGate.getFromServer(
      url: 'product/index',
    );
    model = ProductsModel.fromJson(response.response!.data);
    return model.data!;
  }
}




