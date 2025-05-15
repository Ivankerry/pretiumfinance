import 'package:flutter/material.dart';

class ToDelete extends StatefulWidget {
  const ToDelete({super.key});

  @override
  State<ToDelete> createState() => _ToDeleteState();
}

class _ToDeleteState extends State<ToDelete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Welcome to flutter", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),

            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  child: Center(child: Text("box 1")),
                ),
                SizedBox(width: 10),

                Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
