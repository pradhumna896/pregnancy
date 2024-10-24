import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../comman/routes/routes.dart';
import '../../../core/error_handler.dart';
import '../../../widgets/custom_loader.dart';
import '../../schemeForPragnantWomens/model/scheme_model.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  String faq = r'''query Paginatedfaqs($paginationInput: FaqPaginationInput!) {
  paginatedfaqs(paginationInput: $paginationInput) {
    data {
      id
      title
      description
      question
      answer
      createdAt
      updatedAt
    }
  }
}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopBarWidget(title: "FAQ"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomTextFormField(
                    hintText: "Search",
                    prefix: Icon(Icons.search),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "FAQ",
                    style: KtxtStyle().text16DarkBlackw700,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Query(
              options: QueryOptions(
                document: gql(faq),
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
                final data = result.data!['paginatedfaqs']['data'];
                List<FaModel> schemesList = [];
                for (var element in data) {
                  schemesList.add(FaModel.fromJson(element));
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: schemesList.length,
                  itemBuilder: (context, index) {
                    var data = schemesList[index];
                    return Column(
                      children: [
                        ExpansionTile(
                          trailing: const Icon(Icons.add),
                          title: Text(data.question,
                            style: KtxtStyle().text16DarkBlackw600,
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(data.answer,
                                style: KtxtStyle().text16Blackw400,
                              ),
                            ),
                          ],
                        ),
                        const Divider()
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 138.h,
              width: 335.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.r),
                    bottomRight: Radius.circular(35.r),
                  ),
                  color: AppColor.primary),
              child: Stack(
                children: [
                  Positioned(
                    right: -180.h,
                    bottom: -180.h,
                    child: Container(
                      height: 269.h,
                      width: 269.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffFFF9F9).withOpacity(0.2)),
                    ),
                  ),
                  Positioned(
                    right: 30.h,
                    bottom: 30.h,
                    child: Container(
                      height: 39.h,
                      width: 39.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffFFF9F9).withOpacity(0.2)),
                    ),
                  ),
                  Positioned(
                      left: 20.w,
                      top: 10.h,
                      right: 60,
                      child: Column(
                        children: [
                          Text(
                            "Any question or remarks? Just contact us:",
                            style: KtxtStyle().text14Whitew700,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }

  Column _buildExpansionTile(SchemeModel scheme) {
    return Column(
      children: [
        ExpansionTile(
          trailing: const Icon(Icons.add),
          title: Text(
            "How to apply for a Lorem ipsum dolor?",
            style: KtxtStyle().text16DarkBlackw600,
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Provides financial assistance of ₹5,000 in three installments to pregnant and lactating women for the first live birth. The scheme aims to compensate for wage loss and improve the health of mother and child.",
                style: KtxtStyle().text16Blackw400,
              ),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
