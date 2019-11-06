import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../pages/profile.dart';
import '../services/database_service.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> _users;

  _buildUserTile(User user){
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: user.profileImageUrl.isEmpty 
          ? AssetImage('assets/images/user_placeholder.jpg')
          : CachedNetworkImageProvider(user.profileImageUrl),
      ),
      title: Text(user.name),
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (_) => ProfilePage(userId: user.id,)
        )
      ),
    );
  }

  _clearSearch(){
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => _searchController.clear());
      _users = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            hintText: 'Explore',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
                icon: Icon(
                Icons.clear,
                size: 30.0,
                color: Colors.black,
              ),
              onPressed: _clearSearch,
            ),
            filled: true,
          ),
          onSubmitted: (input) {
            if(input.isNotEmpty){
            setState(() {
              _users = DatabaseService.searchUsers(input);
            });
            }
          },
          ),
      ),
      body: _users == null 
        ? Center(child: Text(
          'Procure por usuários',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
          ),
          ) 
        : FutureBuilder(
        future: _users,
        builder: (context, snapshot){

          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }

          if(snapshot.data.documents.length == 0){
            return Center(
              child: Text('Nenhum usuário encontrado! Tente novamente'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index){
              User user = User.fromDoc(snapshot.data.documents[index]);
              return _buildUserTile(user);
            },
          );
        },
        )
    );
  }
}