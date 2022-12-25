// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserListCollectionReference
    implements
        UserListQuery,
        FirestoreCollectionReference<UserList, UserListQuerySnapshot> {
  factory UserListCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserListCollectionReference;

  static UserList fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserListFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    UserList value,
    SetOptions? options,
  ) {
    return {..._$UserListToJson(value)}..remove('id');
  }

  @override
  CollectionReference<UserList> get reference;

  @override
  UserListDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserListDocumentReference> add(UserList value);
}

class _$UserListCollectionReference extends _$UserListQuery
    implements UserListCollectionReference {
  factory _$UserListCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserListCollectionReference._(
      firestore.collection('userLists').withConverter(
            fromFirestore: UserListCollectionReference.fromFirestore,
            toFirestore: UserListCollectionReference.toFirestore,
          ),
    );
  }

  _$UserListCollectionReference._(
    CollectionReference<UserList> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserList> get reference =>
      super.reference as CollectionReference<UserList>;

  @override
  UserListDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserListDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserListDocumentReference> add(UserList value) {
    return reference.add(value).then((ref) => UserListDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserListCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserListDocumentReference
    extends FirestoreDocumentReference<UserList, UserListDocumentSnapshot> {
  factory UserListDocumentReference(DocumentReference<UserList> reference) =
      _$UserListDocumentReference;

  DocumentReference<UserList> get reference;

  /// A reference to the [UserListCollectionReference] containing this document.
  UserListCollectionReference get parent {
    return _$UserListCollectionReference(reference.firestore);
  }

  late final ListItemCollectionReference items = _$ListItemCollectionReference(
    reference,
  );

  @override
  Stream<UserListDocumentSnapshot> snapshots();

  @override
  Future<UserListDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
  });
}

class _$UserListDocumentReference
    extends FirestoreDocumentReference<UserList, UserListDocumentSnapshot>
    implements UserListDocumentReference {
  _$UserListDocumentReference(this.reference);

  @override
  final DocumentReference<UserList> reference;

  /// A reference to the [UserListCollectionReference] containing this document.
  UserListCollectionReference get parent {
    return _$UserListCollectionReference(reference.firestore);
  }

  late final ListItemCollectionReference items = _$ListItemCollectionReference(
    reference,
  );

  @override
  Stream<UserListDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserListDocumentSnapshot._);
  }

  @override
  Future<UserListDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserListDocumentSnapshot._);
  }

  @override
  Future<UserListDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserListDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    final json = {
      if (name != _sentinel) _$UserListFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$UserListFieldMap['name']!: nameFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    final json = {
      if (name != _sentinel) _$UserListFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$UserListFieldMap['name']!: nameFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserListDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserListQuery
    implements QueryReference<UserList, UserListQuerySnapshot> {
  @override
  UserListQuery limit(int limit);

  @override
  UserListQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserListQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserListDocumentSnapshot? startAtDocument,
    UserListDocumentSnapshot? endAtDocument,
    UserListDocumentSnapshot? endBeforeDocument,
    UserListDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserListQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserListQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserListQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  UserListQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserListDocumentSnapshot? startAtDocument,
    UserListDocumentSnapshot? endAtDocument,
    UserListDocumentSnapshot? endBeforeDocument,
    UserListDocumentSnapshot? startAfterDocument,
  });

  UserListQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserListDocumentSnapshot? startAtDocument,
    UserListDocumentSnapshot? endAtDocument,
    UserListDocumentSnapshot? endBeforeDocument,
    UserListDocumentSnapshot? startAfterDocument,
  });
}

class _$UserListQuery extends QueryReference<UserList, UserListQuerySnapshot>
    implements UserListQuery {
  _$UserListQuery(
    this._collection, {
    required Query<UserList> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserListQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserListQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserListQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserListQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserListQuery limit(int limit) {
    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserListQuery limitToLast(int limit) {
    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserListQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserListDocumentSnapshot? startAtDocument,
    UserListDocumentSnapshot? endAtDocument,
    UserListDocumentSnapshot? endBeforeDocument,
    UserListDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserListQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserListQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserListQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserListFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserListQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserListDocumentSnapshot? startAtDocument,
    UserListDocumentSnapshot? endAtDocument,
    UserListDocumentSnapshot? endBeforeDocument,
    UserListDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserListQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserListDocumentSnapshot? startAtDocument,
    UserListDocumentSnapshot? endAtDocument,
    UserListDocumentSnapshot? endBeforeDocument,
    UserListDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserListFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserListQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserListQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserListDocumentSnapshot extends FirestoreDocumentSnapshot<UserList> {
  UserListDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserList> snapshot;

  @override
  UserListDocumentReference get reference {
    return UserListDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserList? data;
}

class UserListQuerySnapshot
    extends FirestoreQuerySnapshot<UserList, UserListQueryDocumentSnapshot> {
  UserListQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserListQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserList> snapshot,
  ) {
    final docs = snapshot.docs.map(UserListQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserListDocumentSnapshot._,
      );
    }).toList();

    return UserListQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserListDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserListDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserListDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserList> snapshot;

  @override
  final List<UserListQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserListDocumentSnapshot>> docChanges;
}

class UserListQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserList>
    implements UserListDocumentSnapshot {
  UserListQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserList> snapshot;

  @override
  final UserList data;

  @override
  UserListDocumentReference get reference {
    return UserListDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ListItemCollectionReference
    implements
        ListItemQuery,
        FirestoreCollectionReference<ListItem, ListItemQuerySnapshot> {
  factory ListItemCollectionReference(
    DocumentReference<UserList> parent,
  ) = _$ListItemCollectionReference;

  static ListItem fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ListItem.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    ListItem value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<ListItem> get reference;

  /// A reference to the containing [UserListDocumentReference] if this is a subcollection.
  UserListDocumentReference get parent;

  @override
  ListItemDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ListItemDocumentReference> add(ListItem value);
}

class _$ListItemCollectionReference extends _$ListItemQuery
    implements ListItemCollectionReference {
  factory _$ListItemCollectionReference(
    DocumentReference<UserList> parent,
  ) {
    return _$ListItemCollectionReference._(
      UserListDocumentReference(parent),
      parent.collection('items').withConverter(
            fromFirestore: ListItemCollectionReference.fromFirestore,
            toFirestore: ListItemCollectionReference.toFirestore,
          ),
    );
  }

  _$ListItemCollectionReference._(
    this.parent,
    CollectionReference<ListItem> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserListDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<ListItem> get reference =>
      super.reference as CollectionReference<ListItem>;

  @override
  ListItemDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ListItemDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ListItemDocumentReference> add(ListItem value) {
    return reference.add(value).then((ref) => ListItemDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ListItemCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ListItemDocumentReference
    extends FirestoreDocumentReference<ListItem, ListItemDocumentSnapshot> {
  factory ListItemDocumentReference(DocumentReference<ListItem> reference) =
      _$ListItemDocumentReference;

  DocumentReference<ListItem> get reference;

  /// A reference to the [ListItemCollectionReference] containing this document.
  ListItemCollectionReference get parent {
    return _$ListItemCollectionReference(
      reference.parent.parent!.withConverter<UserList>(
        fromFirestore: UserListCollectionReference.fromFirestore,
        toFirestore: UserListCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ListItemDocumentSnapshot> snapshots();

  @override
  Future<ListItemDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String value,
    FieldValue valueFieldValue,
    String category,
    FieldValue categoryFieldValue,
    int? index,
    FieldValue indexFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String value,
    FieldValue valueFieldValue,
    String category,
    FieldValue categoryFieldValue,
    int? index,
    FieldValue indexFieldValue,
  });
}

class _$ListItemDocumentReference
    extends FirestoreDocumentReference<ListItem, ListItemDocumentSnapshot>
    implements ListItemDocumentReference {
  _$ListItemDocumentReference(this.reference);

  @override
  final DocumentReference<ListItem> reference;

  /// A reference to the [ListItemCollectionReference] containing this document.
  ListItemCollectionReference get parent {
    return _$ListItemCollectionReference(
      reference.parent.parent!.withConverter<UserList>(
        fromFirestore: UserListCollectionReference.fromFirestore,
        toFirestore: UserListCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ListItemDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ListItemDocumentSnapshot._);
  }

  @override
  Future<ListItemDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ListItemDocumentSnapshot._);
  }

  @override
  Future<ListItemDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(ListItemDocumentSnapshot._);
  }

  Future<void> update({
    Object? value = _sentinel,
    FieldValue? valueFieldValue,
    Object? category = _sentinel,
    FieldValue? categoryFieldValue,
    Object? index = _sentinel,
    FieldValue? indexFieldValue,
  }) async {
    assert(
      value == _sentinel || valueFieldValue == null,
      "Cannot specify both value and valueFieldValue",
    );
    assert(
      category == _sentinel || categoryFieldValue == null,
      "Cannot specify both category and categoryFieldValue",
    );
    assert(
      index == _sentinel || indexFieldValue == null,
      "Cannot specify both index and indexFieldValue",
    );
    final json = {
      if (value != _sentinel) _$ListItemFieldMap['value']!: value as String,
      if (valueFieldValue != null)
        _$ListItemFieldMap['value']!: valueFieldValue,
      if (category != _sentinel)
        _$ListItemFieldMap['category']!: category as String,
      if (categoryFieldValue != null)
        _$ListItemFieldMap['category']!: categoryFieldValue,
      if (index != _sentinel) _$ListItemFieldMap['index']!: index as int?,
      if (indexFieldValue != null)
        _$ListItemFieldMap['index']!: indexFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? value = _sentinel,
    FieldValue? valueFieldValue,
    Object? category = _sentinel,
    FieldValue? categoryFieldValue,
    Object? index = _sentinel,
    FieldValue? indexFieldValue,
  }) {
    assert(
      value == _sentinel || valueFieldValue == null,
      "Cannot specify both value and valueFieldValue",
    );
    assert(
      category == _sentinel || categoryFieldValue == null,
      "Cannot specify both category and categoryFieldValue",
    );
    assert(
      index == _sentinel || indexFieldValue == null,
      "Cannot specify both index and indexFieldValue",
    );
    final json = {
      if (value != _sentinel) _$ListItemFieldMap['value']!: value as String,
      if (valueFieldValue != null)
        _$ListItemFieldMap['value']!: valueFieldValue,
      if (category != _sentinel)
        _$ListItemFieldMap['category']!: category as String,
      if (categoryFieldValue != null)
        _$ListItemFieldMap['category']!: categoryFieldValue,
      if (index != _sentinel) _$ListItemFieldMap['index']!: index as int?,
      if (indexFieldValue != null)
        _$ListItemFieldMap['index']!: indexFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ListItemDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ListItemQuery
    implements QueryReference<ListItem, ListItemQuerySnapshot> {
  @override
  ListItemQuery limit(int limit);

  @override
  ListItemQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ListItemQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ListItemQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ListItemQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ListItemQuery whereValue({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ListItemQuery whereCategory({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ListItemQuery whereIndex({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });

  ListItemQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  });

  ListItemQuery orderByValue({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  });

  ListItemQuery orderByCategory({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  });

  ListItemQuery orderByIndex({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  });
}

class _$ListItemQuery extends QueryReference<ListItem, ListItemQuerySnapshot>
    implements ListItemQuery {
  _$ListItemQuery(
    this._collection, {
    required Query<ListItem> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ListItemQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(ListItemQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ListItemQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ListItemQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ListItemQuery limit(int limit) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ListItemQuery limitToLast(int limit) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  ListItemQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ListItemQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ListItemQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ListItemQuery whereValue({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ListItemFieldMap['value']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ListItemQuery whereCategory({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ListItemFieldMap['category']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ListItemQuery whereIndex({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ListItemFieldMap['index']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  ListItemQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ListItemQuery orderByValue({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ListItemFieldMap['value']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ListItemQuery orderByCategory({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ListItemFieldMap['category']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ListItemQuery orderByIndex({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ListItemDocumentSnapshot? startAtDocument,
    ListItemDocumentSnapshot? endAtDocument,
    ListItemDocumentSnapshot? endBeforeDocument,
    ListItemDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ListItemFieldMap['index']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ListItemQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ListItemQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ListItemDocumentSnapshot extends FirestoreDocumentSnapshot<ListItem> {
  ListItemDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ListItem> snapshot;

  @override
  ListItemDocumentReference get reference {
    return ListItemDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ListItem? data;
}

class ListItemQuerySnapshot
    extends FirestoreQuerySnapshot<ListItem, ListItemQueryDocumentSnapshot> {
  ListItemQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ListItemQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ListItem> snapshot,
  ) {
    final docs = snapshot.docs.map(ListItemQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ListItemDocumentSnapshot._,
      );
    }).toList();

    return ListItemQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ListItemDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ListItemDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ListItemDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ListItem> snapshot;

  @override
  final List<ListItemQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ListItemDocumentSnapshot>> docChanges;
}

class ListItemQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ListItem>
    implements ListItemDocumentSnapshot {
  ListItemQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ListItem> snapshot;

  @override
  final ListItem data;

  @override
  ListItemDocumentReference get reference {
    return ListItemDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) => UserList(
      id: json['id'] as String?,
      name: json['name'] as String,
    );

const _$UserListFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
};

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ListItem _$ListItemFromJson(Map<String, dynamic> json) => ListItem(
      id: json['id'] as String?,
      value: json['value'] as String,
      category: json['category'] as String,
      index: json['index'] as int?,
    );

const _$ListItemFieldMap = <String, String>{
  'id': 'id',
  'value': 'value',
  'category': 'category',
  'index': 'index',
};

Map<String, dynamic> _$ListItemToJson(ListItem instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'category': instance.category,
      'index': instance.index,
    };
