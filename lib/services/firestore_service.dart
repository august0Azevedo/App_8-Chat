import 'package:app_8/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  postFeedback(message) async {
    String username = await FirebaseAuthService().checkUser();

    // Adiciona feedback
    await db.collection('Feedbacks').add({
      "username": username,
      "profileImage": "",
      "message": message,
      "created_at": DateTime.now()
    });

    // Adiciona usuário se não existir
    var userDoc = await db.collection('Users').where('username', isEqualTo: username).get();
    if (userDoc.docs.isEmpty) {
      await db.collection('Users').add({
        "username": username,
      });
      print("Usuário $username adicionado à coleção Users.");
    } else {
      print("Usuário $username já existe na coleção Users.");
    }
  }

  getFeedback() async {
    return await db.collection('Feedbacks').orderBy('created_at').snapshots();
  }
}