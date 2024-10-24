
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/data/operations.dart';
import 'package:pragnancy_app/view/home/usha/pages/usha_regitation.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBarWidget(title: "Patients"),
          Query(
            options: QueryOptions(
                document: gql(Operations.PagiganationUser),
                variables: {
                  "paginationInput": {
                    "limit": 10,
                    "page": 1,
                    "filterBy": {
                      "parentId": int.parse(SessionManager.getUserId().toString())
                    },
                  }
                }),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return const Center(child: CustomLoader());
              }
              if (result.hasException) {
                return Text("Add Patient");
              }
              var patients = result.data!['paginatedPatients']['data'] as List;
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  var patient = patients[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF3F51B5),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: ListTile(
                      title: Text("Name : ${patient['name']}",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w500)),
                      subtitle: Text("Address : ${patient['city']}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp,color: Colors.white)),
                      trailing: Icon(Icons.person,color: Colors.white,size: 20),
                      onTap: () {
                        /// switch account and view patient details
                        /// check with user login id and switch account id
                        /// when switch the account home is as patient home screen

                        SessionManager.setUserType(patient["userType"]);
                        SessionManager.setUserId(patient["id"].toString());
                        SessionManager.setMaternityId(patient["maternityId"].toString());
                        SessionManager.setName(patient["name"]);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                        //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(title: "edit_profile", user: patient)));
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UshaRegitationForm(
            title: "registration",
          )));
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add,size: 24,color: Colors.white),
        ),
      ),
    );
  }
}
