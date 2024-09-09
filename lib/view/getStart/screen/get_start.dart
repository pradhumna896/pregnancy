import 'package:pragnancy_app/view/auth/screen/login_screen.dart';
import '../../../comman/routes/routes.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFFBE1653)])),
        child: Column(
          children: [
            const Spacer(),
            CustomImageView(
             imagePath: "asset/images/logo.png",
            ),
            SizedBox(height: 20.h,),
            Text(
              getLocalized(context, "namaskar"),
              style: KtxtStyle().text64red400,
            ),
            Text(
              getLocalized(context, "splash_title"),
              style: KtxtStyle().text20Primary600,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomElevatedButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LoginScreen(),
                      ));
                },
                text: Text(getLocalized(context, "get_started"),
                    style: KtxtStyle().text18Whitew700)),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
