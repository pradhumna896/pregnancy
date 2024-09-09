import '../comman/routes/routes.dart';

class NoRowsFoundWidget extends StatelessWidget {
  const NoRowsFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 50,
          bottom: 50,
          left: 0,
          right: 0,
        ),
        child: const Center(
          child: Text("No Rows Found"),
        ));
  }
}