import 'package:pragnancy_app/theme/theme_helper.dart';

import '../core/app_export.dart';

showAlertDialog(context, VoidCallback deleteTap, {title, msg}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: appTheme.whiteA700,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Delete !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appTheme.black900,
                      fontSize: 25,
                      fontFamily: "OpenSans"),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Icon(
                  Icons.info,
                  size: 80,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Are you sure! You want to delete this ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: appTheme.blueGray900,
                    fontFamily: "OpenSans"),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: appTheme.blueGray900,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No',
                style: TextStyle(color: appTheme.whiteA700, fontSize: 15),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: Colors.red,
            ),
            onPressed: deleteTap,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Yes, delete it',
                style: TextStyle(color: appTheme.whiteA700, fontSize: 15),
              ),
            ),
          ),
        ],
      );
    },
  );
}
