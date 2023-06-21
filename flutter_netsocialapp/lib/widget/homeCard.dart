import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCartWidget extends StatefulWidget {
  const HomeCartWidget({super.key});

  @override
  State<HomeCartWidget> createState() => _HomeCartWidgetState();
}

class _HomeCartWidgetState extends State<HomeCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        SizedBox(height: 20,),
        Padding(
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
        Divider(),
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 25,
                  backgroundImage: NetworkImage("https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("İsim",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 7,),
                    Text("@Kullanıcı ismi",style: TextStyle(fontSize: 12,color: Colors.grey[800]),),
                  ],
                ),
                Container(
                  width: 220,
                  alignment: Alignment.centerRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return Dialog(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                "Sil"
                              ].map((e) => InkWell(
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                                  child: Text(e),
                                ),
                              )
                              ).toList()
                            ),
                          );
                        },
                        );
                    }, child: Icon(Icons.more_horiz,color: Colors.black,)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network("https://images.unsplash.com/photo-1674574124340-c00cc2dae99c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",fit: BoxFit.cover)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 2,right: 12),
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(Icons.favorite_border,color: Colors.black,), 
                onPressed: (){}
                ),
                Text("200 like"),
                SizedBox(width: 10,),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(Icons.maps_ugc_outlined,color: Colors.black,), 
                onPressed: (){}
                ),
                Text("200 like"),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("22/22/2023",style: TextStyle(fontSize: 12,color: Colors.grey[800]),)
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}