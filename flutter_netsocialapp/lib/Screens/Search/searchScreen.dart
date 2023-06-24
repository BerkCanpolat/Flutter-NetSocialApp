import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/Account/accountScreen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController _showUser = TextEditingController();
  bool iShowUser = false;
  bool isLoading = false;

  void clear(){
    setState(() {
      iShowUser = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _showUser.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: iShowUser ? AppBar(
        title: SizedBox(
          height: 50,
          child: TextFormField(
            controller: _showUser,
            decoration: InputDecoration(
              hintText: "Ara..",
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              prefixIcon: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: clear,
                child: Icon(Icons.arrow_back,color: Colors.black,),
                ),
            ),
          ),
        ),
      ) : AppBar(
        title: SizedBox(
          height: 50,
          child: TextFormField(
            controller: _showUser,
            decoration: InputDecoration(
              hintText: "Ara..",
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff9896f0),)),
              prefixIcon: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                child: Icon(Icons.search,color: Colors.black,),
                ),
            ),
            onFieldSubmitted: (String _) {
              setState(() {
                iShowUser = true;
              });
            },
          ),
        ),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(),) : iShowUser ? FutureBuilder(
        future: FirebaseFirestore.instance.collection("Users").where("name", isEqualTo: _showUser.text).get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountScreen(uid: snapshot.data!.docs[index]["uid"]))),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data!.docs[index]["userPhoto"]),
                  ),
                  title: Text(snapshot.data!.docs[index]["name"]),
                  subtitle: Text("@${snapshot.data!.docs[index]["userName"]}"),
                ),
              );
            },
          );
        },
      ) : FutureBuilder(
              future: FirebaseFirestore.instance.collection("UserPost").get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      (snapshot.data! as dynamic).docs[index]["postUrl"],fit: BoxFit.cover,
                    ),
                  ),
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                    (index % 7 == 0) ? 2 : 1,
                    (index % 7 == 0) ? 2 : 1,
                  ),
                );
              },
            ),
    );
  }
}