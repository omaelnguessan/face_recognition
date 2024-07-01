import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/report/report_view_model.dart';

class InputMatriculeWidget extends StatelessWidget {
  InputMatriculeWidget({super.key});

  final reportVM = Get.put(ReportViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: reportVM.matriculeController.value,
      focusNode: reportVM.matriculeFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("matricule", 'matricule');
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "Entrez votre QuickLookId",
          labelText: "quickLookID",
          border: OutlineInputBorder()),
    );
  }
}
