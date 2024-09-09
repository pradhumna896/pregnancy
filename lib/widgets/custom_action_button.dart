import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pragnancy_app/theme/app_color.dart';
import 'package:pragnancy_app/theme/text_style.dart';

import '../core/app_export.dart';

class CustomActionButton extends StatelessWidget {
  final List<int>? ids;
  final Function()? activatePress;
  final Function()? deactivatePress;
  final Function()? deletePress;
  final Function()? restorePress;
  final bool? isTrashed;
  final bool? isDelete;
  final bool? isStatus;
  final bool? isRestore;

  const CustomActionButton(
      {super.key,
      this.activatePress,
      this.deactivatePress,
      this.deletePress,
      this.restorePress,
      this.ids,
      this.isTrashed,
      this.isDelete,
      this.isStatus,
      this.isRestore});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ids!.isNotEmpty ? _buildShowMenu(context) : null;
      },
      child: Container(
        width: 158.w,
        height: 44.h,
        decoration: BoxDecoration(
            color: AppColor.primary, borderRadius: BorderRadius.circular(15)),
        child:
            Center(child: Text("Action", style: KtxtStyle().text14Whitew700)),
      ),
    );
  }

  Future<dynamic> _buildShowMenu(BuildContext context) {
    return showMenu(
        context: context,
        position: RelativeRect.fromDirectional(
            textDirection: TextDirection.ltr,
            start: 20,
            top: isTrashed! ? 260.h : 190.h,
            end: 60,
            bottom: 50),
        items: isTrashed!
            ? [
                if (isRestore!)
                  PopupMenuItem(
                    onTap: restorePress,
                    child: Row(
                      children: [
                        const Icon(Icons.restore),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          "Restore",
                        ),
                      ],
                    ),
                  ),
              ]
            : [
                if (isStatus!)
                  PopupMenuItem(
                    onTap: activatePress,
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          "Activate",
                        ),
                      ],
                    ),
                  ),
                if (isStatus!)
                  PopupMenuItem(
                    onTap: deactivatePress,
                    child: Row(
                      children: [
                        const Icon(Icons.airplanemode_on_sharp),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          "Deactivate",
                        ),
                      ],
                    ),
                  ),
                if (isDelete!)
                  PopupMenuItem(
                    onTap: deletePress,
                    child: Row(
                      children: [
                        const Icon(Icons.delete_outline),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          "Delete",
                        ),
                      ],
                    ),
                  ),
              ]);
  }
}
