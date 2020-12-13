import 'dart:async';
import 'package:ezzy/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy/datamodel/Post.dart';
import 'package:ezzy/datamodel/EndUser.dart';
import 'package:ezzy/datamodel/SecondUser.dart';
import 'package:ezzy/global.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final StreamController<List<Post>> _postController = StreamController<List<Post>>.broadcast();
  List<Post> _fetchedPosts;
  int limit = 2;

  Future createEndUser(EndUser endUser) async {
    try {
      await _db.collection('endUsers').doc(endUser.userID).set(endUser.toMap());
      await _db.collection('endUsers/${endUser.userID}/AdditionalDetails')
          .doc('Following')
          .set({'FollowingUID': []});
      print("createUser Success");
    } catch (e) {
      print("createUser fail");
      print(e.toString());
    }
  }

  Future getSecondUser(String UID) async {
    try {
      return await _db.collection('secondUsers')
          .doc(UID)
          .get()
          .then((snapshot) => SecondUser.fromMap(snapshot.data()));
    } catch (e) {
      return e.toString();
    }
  }

  Future getEndUser(String UID) async {
    try {
      return await _db.collection('endUsers')
          .doc(UID)
          .get()
          .then((snapshot) => EndUser.fromMap(snapshot.data()));
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<Post> getPostbyPID(PID) async {
    try {
      return await _db.collection('posts')
          .doc(PID)
          .get()
          .then((snap) {
        Post p = Post.fromMap(
            snap.data()); // replace with (snap)=> Post.fromMap(snap.data());
        print(p.toString());
        return p;
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future getUserFollower(String UID) async {
  //   try {
  //     return await _db.collection('users/$UID/AdditionalDetails')
  //         .doc('Followers')
  //         .get()
  //         .then((snapshot) => snapshot.data()['FollowingUID']);
  //   } catch (e) {
  //
  //   }
  // }

  // Future<void> addPost(Post post) {
  //   try {
  //     _db.collection('posts').add(post.toMap()).then((docref) {
  //       docref.update({'PID': docref.id});
  //       print("${post.title} added successfully");
  //       docref.collection('AdditionalDetails').doc('PostComments').set(
  //           {'Comments': []});
  //       docref.collection('AdditionalDetails').doc('PostLikes').set(
  //           {'LikesUID': []});
  //       print('empty additional details document created successfully');
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }

  Future addLike(String PID, String UID) async {
    try {
      await _db.doc('posts/$PID/AdditionalDetails/PostLikes')
          .update({'LikesUID': FieldValue.arrayUnion([UID])});
      await _db.doc('posts/$PID')
          .update({'likesCount': FieldValue.increment(1)});
    } catch (e) {
      print(e.toString());
    }
  }

  DocumentSnapshot _lastDoc;
  bool _hasMorePosts = true;

  Stream postsListener(postTag tag) {
    // Register the handler for when the posts data changes
    getPostsPaginated(tag);
    return _postController.stream;
  }

  Future getPostsPaginated(postTag tag) async {
    try {

      if(!_hasMorePosts){
        return null;
      }

      var postQuery = _db.collection('posts')
          .where('tag', isEqualTo: tagToString(tag))
          .orderBy('createTimeStamp').limit(limit);

      if (_lastDoc != null) {
        postQuery = postQuery.startAfterDocument(_lastDoc);
      }

      QuerySnapshot querySnapshot = await postQuery.get();
      _lastDoc = querySnapshot.docs.last;
      _fetchedPosts =  querySnapshot.docs.map((e) => Post.fromMap(e.data()));

      if(_fetchedPosts.length < limit){
        _hasMorePosts = false;
      }
      _postController.add(_fetchedPosts);
    } catch (e) {
      print(e.toString());
    }
  }

  Future addFollower(String UIDfrom, String UIDto) async {
    try {
      await _db.doc('endUsers/$UIDfrom/AdditionalDetails/Following')
          .update({'FollowingUID' : FieldValue.arrayUnion([UIDto])});
      await _db.doc('endUsers/$UIDfrom')
          .update({'followingCount' : FieldValue.increment(1)});
      await _db.doc('secondUsers/$UIDto/AdditionalDetails/Followers')
          .update({'FollowersUID' : FieldValue.arrayUnion([UIDfrom])});
      await _db.doc('secondUsers/$UIDto')
          .update({'followerCount' : FieldValue.increment(1)});
    } catch (e) {

    }
  }

}
