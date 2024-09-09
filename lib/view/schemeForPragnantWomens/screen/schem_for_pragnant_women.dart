import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/core/error_handler.dart';
import 'package:pragnancy_app/view/schemeForPragnantWomens/model/scheme_model.dart';
import 'package:pragnancy_app/widgets/custom_loader.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SchemForPragnantWomen extends StatelessWidget {
  SchemForPragnantWomen({super.key});

  String schemes = r'''query AllSchemes {
  allSchemes {
    id
    title
    description
    url
    createdAt
    updatedAt
  }
}
''';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomTopBarWidget(title: "schemes_for_pregnant_women"),
          Query(
            options: QueryOptions(
              document: gql(schemes),
              onError: (error) {
                if (error!.graphqlErrors[0].message == "Unauthorized") {
                  authorized(context);
                }
              },
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.hasException) {
                return Center(
                  child: Text(result.exception!.graphqlErrors[0].message),
                );
              }
              if (result.isLoading) {
                return const Center(child: CustomLoader());
              }
          
              List<SchemeModel> schems = [];
              result.data!['allSchemes'].forEach((element) {
                schems.add(SchemeModel.fromJson(element));
              });
              return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildExpansionTile(schems[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 40.h,
                        );
                      },
                      itemCount: schems.length));
            },
          )
        ],
      ),
    );
  }

  ExpansionTile _buildExpansionTile(SchemeModel scheme) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      backgroundColor: AppColor.secondary,
      collapsedBackgroundColor: AppColor.secondary,
      title: Text(
        scheme.title!,
        style: KtxtStyle().text16DarkWhitew600,
      ),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            textAlign: TextAlign.left,
            scheme.description!,
            style: KtxtStyle().text16Whitew400,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextButton(
            onPressed: () {
              launchUrl(Uri.parse(scheme.url!));
            },
            child: Text(
              textAlign: TextAlign.left,
              scheme.url!,
              style: KtxtStyle().text16Whitew400,
            ),
          ),
        ),
      ],
    );
  }
}
