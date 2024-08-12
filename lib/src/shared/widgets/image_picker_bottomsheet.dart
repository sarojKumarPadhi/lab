import '../../../core/app_exports.dart';

void imagePickerBottomSheet(
    {required VoidCallback onTapGallery, required VoidCallback onTapCamera}) {
  if (Get.isBottomSheetOpen == false) {
    Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CloseButton(
              onPressed: () {
                Get.back();
              },
              color: Theme.of(Get.context!).colorScheme.onBackground,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(Get.context!).colorScheme.background),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 17, top: 17, right: 17, bottom: 16),
                  // decoration: AppDecorationhiteFill.copyWith(
                  //   borderRadius: BorderRadiusStyle.customBorderTL20,
                  // ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select or capture image",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            //  style: AppStyle.lato14colorHeading800,
                          ),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: onTapGallery,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(12),
                                    // decoration: AppDecoration.cta.copyWith(
                                    //   borderRadius: BorderRadius.circular(50),
                                    // ),
                                    child: Icon(
                                      Icons.image_rounded,
                                      size: 34,
                                      color: Theme.of(Get.context!)
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Container(
                                      child: const Text(
                                        "Gallery",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        //  style:
                                        //  AppStyle.montserrat13textTwo500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: onTapCamera,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(12),
                                    // decoration: AppDecoration.cta.copyWith(
                                    //   borderRadius: BorderRadius.circular(50),
                                    // ),
                                    child: Icon(
                                      Icons.camera,
                                      size: 34,
                                      color: Theme.of(Get.context!)
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.0, bottom: 10),
                                    child: Text(
                                      "Camera",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      //   style: AppStyle.montserrat13textTwo500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // backgroundColor: ColorshiteithOpacity(0),
      elevation: 0,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

  // Future<void> getImage(
  //   ImageSource img,
  // ) async {
  //   try {
  //     final pickedFile = await ImagePicker().pickImage(
  //       source: img,
  //     );

  //     String? xfilePick = pickedFile?.path;

  //     if (xfilePick != null && pickedFile != null) {
  //       if (await pickedFile.length() < 5000000) {
  //         imgFile.value = File(pickedFile.path);
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

