import 'package:flutter/material.dart';
class CouuntryCard extends StatelessWidget {
  const CouuntryCard({Key? key, required this.name, required this.countryCode, required this.currency, required this.native}) : super(key: key);
  final String name;
  final String countryCode;
  final String? currency;
  final String native;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(countryCode),
      title: Text(name),
      subtitle: Text(native),
      trailing: Text(currency??''),
    );
  }
}
