import '../../../core/app_exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.isBackBtnVisible,
      this.title = "",
      this.leading,
      this.onTapBack,
      this.actions});

  final bool? isBackBtnVisible;
  final String title;
  final Widget? leading;
  final VoidCallback? onTapBack;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: leading ??
          (isBackBtnVisible ?? false
              ? IconButton(
                  onPressed: onTapBack ?? () => Get.back(),
                  icon: const Icon(Icons.chevron_left),
                  color: Colors.white)
              : null),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite,
      (AppBarTheme.of(Get.context!).toolbarHeight ?? kToolbarHeight));
}
