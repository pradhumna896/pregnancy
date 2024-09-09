import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/utils/custom_toast.dart';
import 'package:pragnancy_app/view/auth/screen/login_screen.dart';
import '../../../comman/routes/routes.dart';

class LogOutPopUpDialog extends StatefulWidget {
  const LogOutPopUpDialog({
    super.key,
  });

  @override
  State<LogOutPopUpDialog> createState() => _LogOutPopUpDialogState();
}

class _LogOutPopUpDialogState extends State<LogOutPopUpDialog> {
  @override
  void initState() {
   toast.init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String logout = r'''
   mutation Mutation {
  logout
} ''';
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200.h,
        width: size.width,
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getLocalized(context, "sign_out"),
                style: KtxtStyle().text28DarkBlackw600),
            Text(
              getLocalized(context, "are_you_sure"),
              textAlign: TextAlign.left,
              style: KtxtStyle().text16Blackw400,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mutation(
                  options: MutationOptions(
                    document: gql(logout),
                    onCompleted: (data) {
                      SessionManager.removeToken();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false,
                      );
                      showSuccessToast(toast, "Logout Successfully");
                    },
                    onError: (error) {},
                  ),
                  builder: (runMutation, result) {
                    return TextButton(
                        onPressed: () {
                          runMutation({});
                        },
                        child: Text(
                          getLocalized(context, "ok"),
                          style: KtxtStyle().text18Secondary500,
                        ));
                  },
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      getLocalized(context, "cancel"),
                      style: KtxtStyle().text18Secondary500,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
