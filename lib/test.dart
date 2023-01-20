import 'package:flutter/material.dart';
import 'package:live_tv/services/native_method_implement.dart';

class NativeCodeTest extends StatefulWidget {
  const NativeCodeTest({super.key});

  @override
  State<NativeCodeTest> createState() => _NativeCodeTestState();
}

class _NativeCodeTestState extends State<NativeCodeTest> {
  int radomNum = 0;

  _getRandomNumber() async {
    radomNum = await NativeCodeImplement.getRandomNumber();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              radomNum.toString(),
              style: const TextStyle(fontSize: 20,color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getRandomNumber(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
