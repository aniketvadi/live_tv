import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:live_tv/constant/app_font.dart';

class NoDatFound extends StatelessWidget {
  const NoDatFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Data Found !',
            style: Font.subTitle2(),
          )
        ],
      ),
    );
  }
}
