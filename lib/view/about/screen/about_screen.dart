import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../comman/routes/routes.dart';
import '../../../core/error_handler.dart';
import '../../../widgets/custom_loader.dart';
import 'about_model.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  String aboutUs = r'''query PaginatedAbout($paginationInput: AboutPaginationInput!) {
  paginatedAbout(paginationInput: $paginationInput) {
    data {
      id
      title
      description
      createdAt
      updatedAt
    }
  }
}
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTopBarWidget(title: "about"),
          Query(
            options: QueryOptions(
              document: gql(aboutUs),
              variables: const {
                "paginationInput": {
                  "limit": 10,
                  "page": 1
                }
              },
              onError: (error) {
                if (error!.graphqlErrors[0].message == "Unauthorized") {
                  authorized(context);
                }
              },
            ),
              builder: (result, {fetchMore, refetch}){
                if (result.hasException) {
                  return Center(
                    child: Text(result.exception!.graphqlErrors[0].message),
                  );
                }
                if (result.isLoading) {
                  return const Center(child: CustomLoader());
                }
                final data = result.data!['paginatedAbout']['data'];
                List<AboutModel> aboutList = [];
                for (var element in data) {
                  aboutList.add(AboutModel.fromJson(element));
                }
              return ListView.builder(
                itemCount: aboutList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                  var aboutData = aboutList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(aboutData.title,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: AppColor.black),
                          ),
                          Text(aboutData.description,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: AppColor.black),
                          ),
                        ],
                      ),
                    );
                  });
              }
          ),
        ],
      ),
    );
  }
}
