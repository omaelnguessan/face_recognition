import 'package:flutter/material.dart';

import 'package:face_recognition/res/colors/app_color.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_models/controller/setting/setting_view_model.dart';



class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  late SettingViewModel settingController;

  @override
  void initState() {
    super.initState();
    settingController = Get.put(SettingViewModel());
    settingController.getCurrentSiteValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(backButton: true),
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() {

        return Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 70.0, 60, 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: settingController.site.isEmpty ? settingController.list.first : settingController.site.value,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    settingController.setSite(value!);
                  },
                  items: settingController.list.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    settingController.updateDropdown();
                  },
                  icon: const Icon(
                    Icons.check_circle,
                    color: AppColor.whiteColor,
                  ),
                  label: const Text(
                    "Valider",
                    style: TextStyle(color: AppColor.whiteColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.orangeColor,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }),
    );
  }
}
