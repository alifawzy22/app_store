import 'package:app_store/models/model_product.dart';
import 'package:app_store/services/update_product.dart';
import 'package:app_store/widgets/custom_button.dart';
import 'package:app_store/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});
  static String id = 'Update Page';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  GlobalKey<FormState> _formKey = GlobalKey();

  late String title;

  late double price;

  late String desc;

  late String image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ModelProduct modelProduct =
        ModalRoute.of(context)!.settings.arguments as ModelProduct;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  initValue: modelProduct.title,
                  hintText: 'Product title',
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'product title required';
                    } else {
                      return null;
                    }
                  },
                  onSave: (value) {
                    title = value!;
                  },
                ),
                CustomTextFormField(
                  initValue: modelProduct.price,
                  hintText: 'Product price',
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'product price required';
                    } else {
                      return null;
                    }
                  },
                  onSave: (value) {
                    price = double.parse(value!);
                  },
                ),
                CustomTextFormField(
                  initValue: modelProduct.description,
                  hintText: 'Product Description',
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'product Description required';
                    } else {
                      return null;
                    }
                  },
                  onSave: (value) {
                    desc = value!;
                  },
                ),
                CustomTextFormField(
                  initValue: modelProduct.image,
                  hintText: 'Product image',
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'product image required';
                    } else {
                      return null;
                    }
                  },
                  onSave: (value) {
                    image = value!;
                  },
                ),
                CustomButton(
                    text: 'Update',
                    textColor: Colors.white,
                    color: Colors.blue,
                    ontap: () async {
                      bool validData = _formKey.currentState!.validate();
                      if (validData) {
                        _formKey.currentState!.save();
                        isLoading = true;
                        setState(() {});
                        try {
                          Map<String, dynamic> data =
                              await UpdateProductService().updateProduct(
                            id: modelProduct.id.toString(),
                            title: title,
                            price: price.toString(),
                            decs: desc,
                            image: image,
                            category: modelProduct.category,
                          );

                          print(data);
                        } catch (e) {
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
