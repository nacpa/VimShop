import 'package:flutter/material.dart';

import 'Page/MainPage.dart';

void main() {
  runApp(const MyApp());

}


class Sample extends StatelessWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(body: Container(child: Text('hgsssdsdsdfsdfsfssdfyjkvsjghcfdrtkyhvcgdgvcgdtgchdgchdjcfdfxdfcnfhcnxffcxndfcxndjfcnxdjfcxnjchj',overflow: TextOverflow.ellipsis,),)),
    );
  }
}


