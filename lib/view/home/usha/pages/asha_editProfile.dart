
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../core/constants/session_manager.dart';
import '../../../../core/error_handler.dart';
import '../../../../data/state.dart';
import '../../../../helper/localization_helper.dart';
import '../../../../theme/app_color.dart';
import '../../../../theme/text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../../utils/custom_toast.dart';
import '../../../../widgets/custom_drodown.dart';
import '../../../../widgets/custom_eleveted_button.dart';
import '../../../../widgets/custom_loader.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../settings/screen/settings_screen.dart';
import '../../screen/home_screen.dart';

class ashaProfile extends StatefulWidget {
  const ashaProfile({super.key});

  @override
  State<ashaProfile> createState() => _ashaProfileState();
}

class _ashaProfileState extends State<ashaProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController searchStateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController tehController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedState;
  String? selectDistrict;
  List<String> districtList = [];

  String userFind = r'''query FindUserById($findUserByIdId: Float!) {
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
}''';

  static const String ashaProfile =
   r'''mutation UpdateProfile($data: UpdateProfileDto!) {
  updateProfile(data: $data) {
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
    deviceToken
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
}''';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
          options: QueryOptions(
            document: gql(userFind),
            variables: {
              "findUserByIdId": int.parse(SessionManager.getUserId()!)
            },
            onError: (error) {
              if (error!.graphqlErrors[0].message == "Unauthorized"){
                authorized(context);
              }
            },
          ),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception!.graphqlErrors[0].message);
            }
            if (result.isLoading) {
              return const Center(child: CustomLoader());
            }
            var user = result.data!["findUserById"];
            nameController.text = user['name'].toString();
            cityController.text = user['city'].toString();
            tehController.text = user['tehsil'].toString();
            return Column(
              children: [
                CustomTopBarWidget(
                    onPress: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false,);
                    },
                    title: getLocalized(context, "edit_profile")),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty|| value.trim().isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                            controller: nameController,
                            hintText: getLocalized(context, "enter_your_name"),
                            labelText: getLocalized(context, "name"),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30)
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(getLocalized(context, "state")),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey,width: 1)
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(getLocalized(context, "state")),
                                items: state.map((item) => DropdownMenuItem(
                                  value: item["state"].toString(),
                                  child: Text(item["state"].toString(),
                                    style: TextStyle(color: Colors.black87, fontSize: 14.sp,fontWeight: FontWeight.w400,),
                                  ),
                                )).toList(),
                                value: selectedState,
                                onChanged: (value) {
                                  selectedState = value;
                                  for (var i in state) {
                                    if (i["state"] == selectedState) {
                                      setState(() {
                                        districtList = i["districts"];
                                      });
                                    }

                                  }
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 40,
                                  width: 200,
                                ),
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 200,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                                dropdownSearchData: DropdownSearchData(
                                  searchController: searchStateController,
                                  searchInnerWidgetHeight: 50,
                                  searchInnerWidget: Container(
                                    height: 50,
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                      expands: true,
                                      maxLines: null,
                                      controller: searchStateController,
                                      textCapitalization: TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                        hintText: getLocalized(context, "state"),
                                        hintStyle: const TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w400),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide:
                                          BorderSide(color: AppColor.primary.withOpacity(0.2), width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppColor.primary, width: 1)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: BorderSide(color: Colors.red.withOpacity(0.8), width: 1)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide:
                                            BorderSide(color: appTheme.orange.withOpacity(0.2), width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: Colors.grey, width: 1)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: Colors.grey, width: 1)),
                                      ),
                                      onChanged: (value) {
                                        for (var i in state) {
                                          if (i["state"] == selectedState) {
                                            setState(() {
                                              districtList = i["districts"];
                                            });
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  searchMatchFn: (item, searchValue) {
                                    return item.value.toString().contains(searchValue);
                                  },
                                ),
                                onMenuStateChange: (isOpen) {
                                  if (!isOpen) {
                                    searchStateController.clear();
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          if (selectedState != null)
                            CustomDropdown(
                              labelText: getLocalized(context, "district"),
                              listName: districtList,
                              onChng: (p0) {
                                selectDistrict = p0;
                              },
                            ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            controller: cityController,
                            hintText: getLocalized(context, "enter_your_city"),
                            labelText: getLocalized(context, "city"),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20)
                            ],
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            controller: tehController,
                            hintText: getLocalized(context, "enter_your_tehsil"),
                            labelText: getLocalized(context, "tehsil"),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20)
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Mutation(
                            options: MutationOptions(
                              document: gql(ashaProfile),
                              onError: (error) {
                                showErrorToast(toast, error!.graphqlErrors[0].message);
                              },
                              onCompleted: (resultData){
                                if (resultData != null){
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SettingsScreen()), (route) => false);
                                }
                              },
                            ),
                            builder: (runMutation, result) {
                              return result!.isLoading
                                  ? const CustomLoader() :
                                CustomElevatedButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()){
                                      runMutation({
                                        "data" : {
                                          "id": int.parse(SessionManager.getUserId()!),
                                          "city": cityController.text.trim(),
                                          "district": selectDistrict,
                                          "email": "",
                                          "name": nameController.text.trim(),
                                          "state": selectedState,
                                          "tehsil": tehController.text.trim()
                                        }
                                      });
                                    }
                                  },
                                  text: Text(getLocalized(context, "done"),
                                    style: KtxtStyle().text18White700,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },),
    );
  }
}
