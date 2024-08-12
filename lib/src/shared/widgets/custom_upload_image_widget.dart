import 'dart:io';
import '../../../core/app_exports.dart';
import '../theme/app_style.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key, this.file, this.onTap, this.url});
  final File? file;
  final String? url;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,

      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(right: 12),
      // padding: file != null || url != null
      //     ? EdgeInsets.zero
      //     : EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              fit: BoxFit.fill,
              svgPath: file == null ? ImageConstant.uploadSvg : null,
              radius: BorderRadius.circular(5),
              height: file != null || url != null ? 140 - 2 : 50,
              width: file != null || url != null ? 140 - 2 : 50,
              file: file,
              url: url,
            ),
            file != null || url != null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 1.25),
                    child: Text(
                      "Upload",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.roboto12w600,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
