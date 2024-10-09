import 'package:app_8/services/auth_service.dart';
import 'package:app_8/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Feedbacks').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(color: const Color.fromARGB(25, 255, 255, 255)), 
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(
                    snapshot.data.docs[index]['username'],
                    style: TextStyle(color: Colors.white), 
                  ),
                  subtitle: Text(
                    snapshot.data.docs[index]['message'],
                    style: TextStyle(color: Colors.white), 
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: {
                        'Nome': snapshot.data.docs[index]['username'],
                        'message': snapshot.data.docs[index]['message'],
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30,
        color: const Color.fromARGB(71, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.white), 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(33, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      var message = await FirestoreService()
                          .postFeedback(messageController.text);

                      messageController.clear();
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Icon(Icons.send),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}