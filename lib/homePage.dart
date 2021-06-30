import 'package:firebase_chat_app/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/chatRoom.dart';

class HomePage extends StatefulWidget{
  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  //instance of firebase auth
  final auth = FirebaseAuth.instance;
  //instance of cloud firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late String currentUserID = auth.currentUser!.uid;

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'), 
          centerTitle: true, 
          actions: <Widget>[
            //Log out icon button
            IconButton(
              icon: Icon(Icons.logout,color: Colors.white), 
              //on pressed, will show alert dialog asking for user to confirm logging out
              onPressed: () => showDialog(
                context: context, 
                builder: (BuildContext context) => AlertDialog(
                  //description message in alert dialog
                  content: Text('Are you sure you want to log out?'),
                  actions: <Widget>[
                    //will cancel and return back to home page
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context, 'Cancel'),                
                    ),
                    //will sign out user and return to splash screen
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {                                            
                        auth.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SplashScreen()));               
                      },      
                    ),            
                  ]
                )
              )
            )
          ]
        ),
        //Stream builder returns message posts from firesetore database
        body: StreamBuilder<QuerySnapshot>(
          //returns document of users that excludes the current users document
          stream: firestore.collection('users').where('user_id', isNotEqualTo: currentUserID).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
            //maps document snapshot content from query snapshot
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return Card(
                    child: ListTile(
                      title: Text(doc['username']),
                      trailing: ElevatedButton(
                        onPressed: (){
                          //saves username and userID of person user will be chatting with 
                          String username = doc['username'];
                          String userID = doc['user_id'];
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(otherUser: username, otherUserID: userID)));
                        },
                        child: Text('Message')
                      )
                    ),
                  );
                }).toList(),
              );
          },
        ),
      ),
    );
  }
}

