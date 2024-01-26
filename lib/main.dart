import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String enteredPin = '';

  // ฟังก์ชันเพิ่มตัวเลข PIN เมื่อปุ่มถูกแตะ
  void updatePin(String digit) {
    setState(() {
      if (enteredPin.length < 6) {
        enteredPin += digit;
      }
    });
  }

  // ฟังก์ชันลบตัวเลขล่าสุดใน PIN
  void deleteLastDigit() {
    setState(() {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    });
  }

  // ฟังก์ชันล้างค่า PIN ทั้งหมด
  void clearPin() {
    setState(() {
      enteredPin = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ส่วนแรก: รูป Shield และข้อความ "PIN LOGIN"
                Column(
                  children: [
                    Icon(Icons.shield_outlined, size: 65.0),
                    Text(
                      "PIN LOGIN",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),

                // ส่วนที่สอง: แสดง PIN ที่กำลังป้อน
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      enteredPin.padRight(6, '_'),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),

                // ส่วนที่สาม: ปุ่มตัวเลข
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // สร้างปุ่มตัวเลขด้วยลูป for
                    for (int i = 1; i <= 3; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int j = 1; j <= 3; j++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => updatePin(((i - 1) * 3 + j).toString()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  width: 60.0,
                                  height: 60.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ((i - 1) * 3 + j).toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'text',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                    // ปุ่มพิเศษ: ปุ่มลบตัวเลขล่าสุด ปุ่ม 0 และ ปุ่มลบ PIN ทั้งหมด
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ปุ่มลบ PIN ทั้งหมด
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: clearPin,
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        // ปุ่ม 0
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => updatePin('0'),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: Colors.grey,
                                ),
                              ),
                              width: 60.0,
                              height: 60.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'zero',
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ปุ่มลบตัวเลขล่าสุด
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: deleteLastDigit,
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              child: Icon(Icons.backspace_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}