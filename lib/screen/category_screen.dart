import 'package:flutter/material.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category',
          style: Font.title2(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 61, 57, 82),
            Color.fromARGB(255, 43, 40, 68),
          ],
        )),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    spreadRadius: -1,
                    
                  )
                ]
              ),
              child: ListTile(
                onTap: () {
                  
                },
                leading: CircleAvatar(
                  radius: 18,
                  child: Text(
                    '${index + 1}',
                    style: Font.subTitle2(),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'data',
                    style: Font.subTitle1(),
                  ),
                ),
                trailing: Icon(Icons.navigate_next,color: AppColor.white,size: 26,),
              ),
            );
          },
        ),
      ),
    );
  }
}
