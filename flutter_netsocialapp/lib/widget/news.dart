import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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