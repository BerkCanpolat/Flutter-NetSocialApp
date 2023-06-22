import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return         SafeArea(
      child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Haber Akışı",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,letterSpacing: 1),),
                  SizedBox(height: 12,),
                  Text("Öne çıkan hikayeler",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),),
                ],
              ),
            ),
          ),
    );
  }
}