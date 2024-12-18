// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedChipIndex = 0;
  void handleChipSelected(int index) {
    selectedChipIndex = index;

    notifyListeners();
  }
}
// class HomeProvider with ChangeNotifier {
//   HomeProvider();

//   final customerCuntroller = TextEditingController();
//   final productController = TextEditingController();
//   final gumController = TextEditingController();

//   bool _loading = false;
//   bool get loading => _loading;

//   JobsModel _selectedJob = JobsModel();
//   JobsModel get selectedJob => _selectedJob;

//   double _quantity = 0;
//   int? _selectedNumber;
//   int? get gumCount => _selectedNumber;
//   double get quantity => _quantity;
//   bool _withHandle = false;
//   bool get withHandle => _withHandle;
//   ProductDataModel? _selectedProduct;
//   ProductDataModel? get selectedProduct => _selectedProduct;
//   Gum? _selectedGum;
//   Gum? get selectedGum => _selectedGum;
//   CustomerDataModel? _selectedCustomer;
//   CustomerDataModel? get selectedCustomer => _selectedCustomer;

//   setCustomer(CustomerDataModel customer) {
//     _selectedCustomer = customer;
//     customerCuntroller.text = customer.name ?? '';
//     _selectedProduct = null;
//     productController.clear();
//   }

//   setProduct(ProductDataModel product) {
//     _selectedProduct = product;
//     productController.text = product.name ?? '';
//   }

//   setGum(Gum gum) {
//     _selectedGum = gum;
//     gumController.text = gum.name ?? '';
//   }

//   setGumCount(int? value) {
//     _selectedNumber = value ?? 0;
//   }

//   setQuantity(value) {
//     _quantity = double.tryParse(value) ?? 0;
//   }

//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   setProductList(ApiResponse<ProductModel> response) {
//     ProductList = response;
//     notifyListeners();
//   }

//   setCustomerList(ApiResponse<CustomerModel> response) {
//     CustomerList = response;
//     notifyListeners();
//   }

//   Future<void> requestPayout(BuildContext context) async {
//     setLoading(true);

//     await homeRepository.requestPayoutApi().then((value) {
//       setLoading(false);
//       Utils.toastMessage(value['message']);
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       print(stackTrace);
//       Utils.handleApiError(error.toString(), context);
//     });
//   }

//   Future<void> addHandle(BuildContext context, String data) async {
//     await homeRepository.addHandle({"id": data}).then((value) {
//       setLoading(false);
//       Utils.toastMessage(value['message']);
//       context.dataProvider.fetchJobListApi();
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       print(stackTrace);
//       Utils.handleApiError(error.toString(), context);
//     });
//   }

//   Future<void> addGum(
//     BuildContext context,
//   ) async {
//     setLoading(true);

//     await homeRepository.addGumConsumption({
//       "id": _selectedGum?.id.toString(),
//       "quantity": _selectedNumber.toString(),
//       "date": Utils.getFormattedDate(DateTime.now()),
//     }).then((value) {
//       setLoading(false);
//       Utils.toastMessage(value['message']);
//       Navigator.pop(context);
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       print(stackTrace);
//       Utils.handleApiError(error.toString(), context);
//     });
//   }

//   Future<void> addNewJob(BuildContext context) async {
//     setLoading(true);

//     await homeRepository.addNewJob({
//       "date": Utils.getFormattedDate(DateTime.now()),
//       "quantity": _quantity.toString(),
//       "product": _selectedProduct?.id.toString(),
//       "customer": _selectedCustomer?.id.toString(),
//       "with_handle": _withHandle ? '1' : '0'
//     }).then((value) {
//       setLoading(false);
//       if (kDebugMode) {
//         print(value);
//       }
//       Utils.toastMessage(value['message']);
//       context.dataProvider.fetchJobListApi();
//       Navigator.pop(context);
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       if (kDebugMode) {
//         print(error);
//         print(stackTrace);
//       }
//       Utils.handleApiError(error.toString(), context);
//     });
//   }

//   void isCheckboxChanged(bool? value) {
//     _withHandle = !_withHandle;
//     if (kDebugMode) {
//       print(_withHandle ? 1 : 0);
//     }
//     notifyListeners();
//   }

//   void resetFields() {
//     _loading = _withHandle = false;
//     _quantity = 0;
//     _selectedProduct =
//         _selectedCustomer = _selectedGum = _selectedNumber = null;
//     customerCuntroller.clear();
//     productController.clear();
//     gumController.clear();
//   }
// }
