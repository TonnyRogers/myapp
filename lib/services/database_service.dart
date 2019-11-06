import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';
import '../utilities/constants.dart';

class DatabaseService{

  static void updateUser(User user) async{
    await usersRef.document(user.id).updateData({
      'name':user.name,
      'bio':user.bio,
      'profileImageUrl':user.profileImageUrl,
    });
  }

  static Future<QuerySnapshot> searchUsers(String name) async{
    Future<QuerySnapshot> users = 
    usersRef.where('name', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }
}