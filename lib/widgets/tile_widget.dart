import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/utils/string_capitalization.dart';



buildTileWidget({title, value}) {
  return Row(
    children: [
      empDetails('$title :  ', KtxtStyle().text14DarkBlackw600),
      SizedBox(
        width: 140.h,
        child: empDetails(value == null ? "N/A" : value.toString(),
           KtxtStyle().text14DarkBlackw600),
      )
    ],
  );
}

empDetails(String text, TextStyle style) {
  return Text(
    text.toTitleCase(),
    textAlign: TextAlign.start,
    style: style,
  );
}
