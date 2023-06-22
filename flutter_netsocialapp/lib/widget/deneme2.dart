import 'package:flutter/material.dart';

class Deneme2 extends StatefulWidget {
  const Deneme2({super.key});

  @override
  State<Deneme2> createState() => _Deneme2State();
}

class _Deneme2State extends State<Deneme2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Color.fromARGB(255, 101, 98, 243),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,)),
                  ),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                          ),
                        ],
                      ),
                      Text("Sara"),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}