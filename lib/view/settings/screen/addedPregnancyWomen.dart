
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/theme/theme_helper.dart';
import '../../../core/constants/session_manager.dart';
import '../../../core/error_handler.dart';
import '../../../data/operations.dart';
import '../../../theme/app_color.dart';
import '../../../theme/text_style.dart';
import '../../auth/screen/register_screen.dart';
import '../../home/screen/home_screen.dart';

class Addedpregnancywomen extends StatefulWidget {
  const Addedpregnancywomen({super.key});

  @override
  State<Addedpregnancywomen> createState() => _AddedpregnancywomenState();
}

class _AddedpregnancywomenState extends State<Addedpregnancywomen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         children: [
           const CustomTopBarWidget(title: "pregnancy_woman_details"),
           Query(
             options: QueryOptions(
               document: gql(Operations.getFamily),
               variables: {"parentId": int.parse(SessionManager.getUserId()!),},
               onError: (error) {
                 if (error!.graphqlErrors[0].message == "Unauthorized") {
                   authorized(context);
                 }
               },
             ),
             builder: (result, {fetchMore, refetch}) {
               if (result.hasException) {
                 return Text(result.exception.toString());
               }
               if (result.isLoading) {
                 return Center(
                   child: CircularProgressIndicator(),
                 );
               }
               var users = result.data!["getFamilyMembers"];
               return Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   users.isEmpty
                       ? SizedBox(
                     height: 100.h,
                     child: Center(
                         child: Text("No family members found",
                           style: TextStyle(fontSize: 16,color: Colors.black),
                         )),
                   )
                       : ListView.builder(
                     shrinkWrap: true,
                     itemCount: users.length,
                     itemBuilder: (context, index) {
                       var user = users[index];
                       return Container(
                         margin: EdgeInsets.symmetric(horizontal: 20),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5),
                             color: AppColor.secondary),
                         padding: EdgeInsets.symmetric(horizontal: 10.w),
                         child: ListTile(
                           onTap: () {
                             SessionManager.setUserType(user["userType"]);
                             SessionManager.setUserId(user["id"].toString());
                             SessionManager.setMaternityId(user["maternityId"].toString());
                             SessionManager.setName(user["name"]);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                           },
                           // trailing: IconButton(
                           //   onPressed: () {
                           //     Navigator.push(
                           //       context,
                           //       MaterialPageRoute(builder: (context) => RegisterScreen(
                           //                 title: "edit_profile",
                           //                 user: user,
                           //       )),
                           //     );
                           //   },
                           //   icon: const Icon(
                           //     Icons.edit,
                           //     color: AppColor.white,
                           //   ),
                           // ),
                           leading: const CircleAvatar(
                             backgroundImage:
                             AssetImage("asset/images/User image (1).png"),
                           ),
                           title: Text(user["name"],
                             style: KtxtStyle().text14Whitew700,
                           ),
                           subtitle: Text("age ${user["age"]}",
                             style: KtxtStyle().text12Whitew700,
                           ),
                         ),
                       );
                     },
                   )
                 ],
               );
             },
           )
         ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              RegisterScreen(id: int.parse(SessionManager.getUserId()!),
                  title: "add_family_members")));
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add,color: Colors.white,size: 24),
        ),
      ),
    );
  }
}
