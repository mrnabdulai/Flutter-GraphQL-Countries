import 'package:flutter/material.dart';
import 'package:flutter_graphql_demo/ui/country_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shimmer/shimmer.dart';
class HomeScreen extends StatelessWidget {

  final String readCountryByCode = """
 query Query {
 countries {
   name
   code
   currency
   emoji
   native
   languages {
     name
   }
 }
}


  """;


  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GraphQL Countries"),
        centerTitle: true,
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readCountryByCode),

          // pollInterval: Duration(seconds: 10),
          // variables: {
          //   "code": "US",
          // },

        ),
          builder: (QueryResult result, {Future<QueryResult> Function(FetchMoreOptions)? fetchMore,Future<QueryResult?> Function()? refetch, }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );

          }

          // it can be either Map or List
          List countries = result.data!['countries'];
          //
          return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return CouuntryCard(
                  name: countries[index]['name'],
                  countryCode: countries[index]['code'],
                  currency: countries[index]['currency'],
                  native: countries[index]['native'],
                );
              });
        },
      ),
    );
  }
}