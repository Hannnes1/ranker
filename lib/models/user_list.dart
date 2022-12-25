import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:ranker/app/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_list.g.dart';

@Collection<UserList>('userLists')
@Collection<ListItem>('userLists/*/items')
final userListsRef = UserListCollectionReference();

@firestoreSerializable
class UserList {
  UserList({
    this.id,
    required this.name,
  });

  @Id()
  final String? id;
  final String name;
}

@firestoreSerializable
class ListItem {
  ListItem({
    this.id,
    required this.value,
    required this.category,
    required this.index,
  });

  @Id()
  final String? id;
  
  /// The primary value that the list should be sorted by.
  final String value;
  
  /// A category that the value is a part of.
  /// 
  /// For example the album, if the value is a song.
  final String category;

  /// The index of the item, if sorted.
  final int? index;

  factory ListItem.fromJson(Map<String, dynamic> json) => _$ListItemFromJson(json);
  Map<String, dynamic> toJson() => _$ListItemToJson(this);
}
