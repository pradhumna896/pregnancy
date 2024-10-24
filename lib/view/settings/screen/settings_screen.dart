import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pragnancy_app/bloc/localization/localization_bloc.dart';
import 'package:pragnancy_app/bloc/localization/localization_state.dart';
import 'package:pragnancy_app/core/error_handler.dart';
import 'package:pragnancy_app/data/operations.dart';
import 'package:pragnancy_app/view/about/screen/about_screen.dart';
import 'package:pragnancy_app/view/auth/screen/register_screen.dart';
import 'package:pragnancy_app/view/faq/screen/faq_screen.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import '../../../bloc/localization/localization_event.dart';
import '../../../comman/routes/routes.dart';
import '../../home/usha/pages/asha_editProfile.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String userFind = r"""query FindUserById($findUserByIdId: Float!) {
  findUserById(id: $findUserByIdId) {
    id
    name
    mobileNo
    email
    age
    feet
    inches
    weight
    status
    isLoggedIn
    lastMenstrualDate
    createdBy
    createdAt
    updatedAt
    userType
    slug
    parentId
    superParentId
    state
    district
    city
    tehsil
    maternityId
  }
}""";

  dynamic user; // Define user at the class level

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    load();
  }
  load(){}

  Future<void> _fetchUserData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final result = await _fetchFromNetwork();
      if (result != null) {
        setState(() {
          user = result;
        });
        await _saveToHive(result);
      } else {
        _loadFromHive();
      }
    } else {
      _loadFromHive();
    }
  }

  Future<dynamic> _fetchFromNetwork() async {
    final options = QueryOptions(
      document: gql(userFind),
      variables: {
        "findUserByIdId": int.parse(SessionManager.getUserId()!)
      },
    );

    final result = await GraphQLProvider.of(context).value.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      return null;
    }
    return result.data!["findUserById"];
  }

  Future<void> _saveToHive(dynamic userData) async {
    final box = await Hive.openBox('userBox');
    box.put('user', userData);
  }

  Future<void> _loadFromHive() async {
    final box = await Hive.openBox('userBox');
    final userData = box.get('user');
    if (userData != null) {
      setState(() {
        user = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          if (user == null) {
            return const Center(child: CustomLoader());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomTopBarWidget(
                  title: "settings",
                  onPress: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                  },
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: const BoxDecoration(color: AppColor.secondary),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("asset/images/User image (1).png"),
                    ),
                    title: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: AppColor.secondary,
                          context: context,
                          builder: (context) {
                            return ShowCustomModelBottomSheet(
                              parentId: int.parse(SessionManager.getUserId()!),
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            user['name'] ?? "No Name",
                            style: KtxtStyle().text14Whitew700,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      "${getLocalized(context, "age")} ${user["age"] ?? "N/A"}",
                      style: KtxtStyle().text12Whitew700,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        SessionManager.getUserType().toString() == "usha" ?
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ashaProfile())) :
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(title: "edit_profile", user: user)));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Radio(
                //         value: SessionManager.getLanguage() == "en",
                //         groupValue: true,
                //         onChanged: (val) {
                //           context
                //               .read<LocalizationBloc>()
                //               .add(const LoadLocalization("en"));
                //         }),
                //     Text(
                //       "English",
                //       style: KtxtStyle().text14DarkBlackw700,
                //     ),
                //     Radio(
                //         value: SessionManager.getLanguage() != "en",
                //         groupValue: true,
                //         onChanged: (val) {
                //           context
                //               .read<LocalizationBloc>()
                //               .add(const LoadLocalization("hi"));
                //         }),
                //     Text(
                //       "Hindi",
                //       style: KtxtStyle().text14DarkBlackw700,
                //     ),
                //   ],
                // ),
                ProfileMenuWidget(
                  title: getLocalized(context, "add_family_members"),
                  icon: "asset/svg/add_family_member.svg",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        RegisterScreen(id: int.parse(SessionManager.getUserId()!),
                            title: "add_family_members")));
                  },
                ),
                ProfileMenuWidget(
                  title: getLocalized(context, 'faq'),
                  icon: "asset/svg/faq.svg",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FaqScreen(),
                        ));
                  },
                ),
                ProfileMenuWidget(
                  title: getLocalized(context, "about"),
                  icon: "asset/svg/about.svg",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutScreen(),
                      ),
                    );
                  },
                ),

                /// login user and api user id == show size box and id not match show switch button

                SessionManager.getUserIdSwitch().toString() == user['id'].toString() ?
                SizedBox() :
                ProfileMenuWidget(
                  endIcon: false,
                  title: getLocalized(context, "switch"),
                  icon: "asset/svg/add_family_member.svg",
                  onTap: () {
                    SessionManager.setUserType(SessionManager.getUserTypeSwitch().toString());
                    SessionManager.setUserId(SessionManager.getUserIdSwitch().toString());
                    SessionManager.setMaternityId(SessionManager.getMaternityIdSwitch().toString());
                    SessionManager.setName(SessionManager.getNameSwitch().toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()),);
                  },
                ),

                ProfileMenuWidget(
                  endIcon: false,
                  title: getLocalized(context, "sign_out"),
                  icon: "asset/svg/signout.svg",
                  onTap: () {
                    onTapLogout(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  onTapLogout(context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return const LogOutPopUpDialog();
      },
    );
  }
}

// ignore: must_be_immutable
class ShowCustomModelBottomSheet extends StatelessWidget {
  final int parentId;
  ShowCustomModelBottomSheet({
    super.key,
    required this.parentId,
  });

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(Operations.getFamily),
        variables: {"parentId": parentId},
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
        return Container(
          decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(39.r),
                topRight: Radius.circular(39.r),
              )),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              users.isEmpty
                  ? SizedBox(
                      height: 100.h,
                      child: Center(
                          child: Text("No family members found",
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      )),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        var user = users[index];
                        return ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              SessionManager.setUserType(user["userType"]);
                              SessionManager.setUserId(user["id"].toString());
                              SessionManager.setMaternityId(user["maternityId"].toString());
                              SessionManager.setName(user["name"]);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()),);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: AppColor.white,
                            ),
                          ),
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
                        );
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;
  final bool endIcon;
  final Color? textColor;
  final Color? conColor;
  const ProfileMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      this.endIcon = true,
      this.textColor = AppColor.secondary,
      this.conColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40.h,
        height: 40.h,
        decoration: BoxDecoration(
            color: conColor ?? const Color(0xff858EA9).withOpacity(0.1),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: CustomImageView(
            svgPath: icon,
          ),
        ),
      ),
      title: Text(title,
          style: TextStyle(
              fontFamily: "Relwaye",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87)),
      trailing: endIcon
          ? Container(
              width: 30.h,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey[600],
                size: 18.sp,
              ),
            )
          : null,
    );
  }
}
