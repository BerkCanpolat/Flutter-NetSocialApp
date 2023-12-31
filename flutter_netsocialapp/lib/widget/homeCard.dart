import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/fireStore.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/Comment/commentScreen.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:flutter_netsocialapp/widget/like.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeCartWidget extends StatefulWidget {
  final snap;
  const HomeCartWidget({super.key, this.snap});

  @override
  State<HomeCartWidget> createState() => _HomeCartWidgetState();
}

class _HomeCartWidgetState extends State<HomeCartWidget> {
  int commentlen = 0;
  bool isAnimating = false;
  bool isLoading = false;

  commentLen() async {
    setState(() {
      isLoading = true;
    });
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("UserPost")
          .doc(widget.snap["postId"])
          .collection("Comments")
          .get();

      commentlen = snap.docs.length;
      setState(() {});
    } catch (e) {
      e.toString();
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> delete(String postId, String uid) async {
    UserModel? currentUser =
        Provider.of<ProviderNet>(context, listen: false).getUserProvider;
    if (currentUser?.uid == uid) {
      try {
        await FirebaseFirestore.instance
            .collection("UserPost")
            .doc(postId)
            .delete();
            cherryMessage("Post Silindi", context);
      } catch (e) {
        showMessage("Post silinirken bir hata oluştu.");
      }
    } else {
      showMessage("Bu postu sadece sahibi silebilir.");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentLen();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.snap["profilePick"] == null
                  ? CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(
                          "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjcyNC0xODctcC5wbmc.png"),
                    )
                  : CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(widget.snap["profilePick"]),
                    ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.snap["name"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "@${widget.snap["userName"]}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                ],
              ),
              Container(
                width: 210,
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                // ...
                                InkWell(
                                  onTap: () {
                                    UserModel? currentUser =
                                        Provider.of<ProviderNet>(context,
                                                listen: false)
                                            .getUserProvider;
                                    if (widget.snap["uid"] == currentUser?.uid) {
                                      // Postun sahibiyle mevcut kullanıcı aynı ise postu sil
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Color(0xff9896f0),
                                            title: const Text(
                                              'Postu Sil',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            content: const Text(
                                              'Bu postu silmek istediğinize emin misiniz?',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            actions: [
                                              TextButton(
                                                child: const Text(
                                                  'Vazgeç',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text(
                                                  'Sil',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  delete(widget.snap["postId"],widget.snap["uid"]);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      // Postun sahibiyle mevcut kullanıcı aynı değilse hata mesajı göster
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Color(0xff9896f0),
                                            title: Text('Hata',style: TextStyle(color: Colors.white),),
                                            content: Text(
                                                'Bu postu sadece sahibi silebilir.' ,style: TextStyle(color: Colors.white),),
                                            actions: [
                                              TextButton(
                                                child: Text('Tamam',style: TextStyle(color: Colors.black),),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 10),
                                    child: Text('Sil'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onDoubleTap: () async {
              await FireStore().likeUpdate(
                  user!.uid!, widget.snap["postId"], widget.snap["like"]);
              setState(() {
                isAnimating = true;
              });
            },
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      Image.network(widget.snap["postUrl"], fit: BoxFit.cover),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isAnimating ? 1 : 0,
                child: LikeAnimation(
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xff9896f0),
                    size: 100,
                  ),
                  isAnimating: isAnimating,
                  duration: Duration(milliseconds: 300),
                  onEnd: () {
                    setState(() {
                      isAnimating = false;
                    });
                  },
                ),
              ),
            ]),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 2, right: 12),
          child: Row(
            children: [
              LikeAnimation(
                isAnimating: widget.snap["like"].contains(user!.uid),
                smallLike: true,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: widget.snap["like"].contains(user.uid)
                        ? Icon(Icons.favorite, color: Color(0xff9896f0))
                        : Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () async {
                      await FireStore().likeUpdate(user.uid!,
                          widget.snap["postId"], widget.snap["like"]);
                    }),
              ),
              Text(widget.snap["like"].length.toString()),
              SizedBox(
                width: 10,
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.maps_ugc_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    MainRoutes.instance.pushAndGo(
                        widget: CommentScreen(
                          snap: widget.snap,
                        ),
                        context: context);
                  }),
              Text("${commentlen} yorum"),
              Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateFormat.yMMMd()
                          .format(widget.snap["datePost"].toDate()),
                      style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                    )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.snap["name"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width: 300,
                    child: Text(
                      widget.snap["description"],
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 13,
                          letterSpacing: 1),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
