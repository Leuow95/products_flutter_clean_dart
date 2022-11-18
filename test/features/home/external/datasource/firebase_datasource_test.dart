// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:products_challenge/features/home/external/datasource/firebase_datasource_v2.dart';
// import 'package:products_challenge/features/home/infra/models/product_model.dart';
// import 'package:products_challenge/firebase_options.dart';

// class MockDataSnapShot extends Mock implements DataSnapshot {}

// class FirestoreMock extends Mock implements FirebaseFirestore {}

// void main() async {
//   late FirestoreDataSource dataSource;
//   late FirestoreMock firestoreMock;

//   setUp(() {
//     dataSource = FirestoreDataSource();
//     firestoreMock = FirestoreMock();
//   });
//   test("getProducts |", () async {
//     final snapShot = FirestoreMock();
//     when(() => firestoreMock.collection(any()).get())
//         .thenAnswer((_) => snapShot));

//     when(() => mockFirebase.get()).thenAnswer((_) async => snapShot);

//     final result = await dataSource.getProducts();

//     expect(result, isA<List<ProductModel>>());
//   });
//   test("getProducts |", () async {
//     WidgetsFlutterBinding.ensureInitialized();

//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     final DatabaseReference realDataBase = FirebaseDatabase.instance.ref();
//     final FirebaseDataSource productsDataSource =
//         FirebaseDataSource(realDataBase);

//     final result = await productsDataSource.getProducts();

//     expect(result, isA<List<ProductModel>>());
//   });
// }

// const json = [
//   {
//     "title": "Brown eggs",
//     "type": "dairy",
//     "description": "Raw organic brown eggs in a basket",
//     "filename": "0.jpg",
//     "height": 600,
//     "width": 400,
//     "price": 28.1,
//     "rating": 4
//   },
//   {
//     "title": "Sweet fresh stawberry",
//     "type": "fruit",
//     "description": "Sweet fresh stawberry on the wooden table",
//     "filename": "1.jpg",
//     "height": 450,
//     "width": 299,
//     "price": 29.45,
//     "rating": 4
//   }
// ];
