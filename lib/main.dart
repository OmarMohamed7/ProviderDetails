import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: ((context) => ObjectProvider()),
          builder: (context, child) => const MyHomePage()),
    );
  }
}

@immutable
class BaseObject {
  final String id;
  final String lastUpdated;

  BaseObject()
      : id = const Uuid().v4(),
        lastUpdated = DateTime.now().toIso8601String();

  @override
  bool operator ==(covariant BaseObject other) => other.id == id;

  @override
  int get hashCode => id.hashCode;
}

@immutable
class ExpensiveObject extends BaseObject {}

@immutable
class CheapObject extends BaseObject {}

class ObjectProvider extends ChangeNotifier {
  String id;
  CheapObject _cheapObject;
  StreamSubscription? _cheapObjectstreamSubs;

  ExpensiveObject _expensiveObject;
  StreamSubscription? _expensiveObjectstreamSubs;

  CheapObject get cheapObject => _cheapObject;
  ExpensiveObject get expensiveObject => _expensiveObject;

  ObjectProvider()
      : id = const Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject();

  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  void start() {
    _cheapObjectstreamSubs =
        Stream.periodic(const Duration(seconds: 1)).listen((_) {
      _cheapObject = CheapObject();
      notifyListeners();
    });

    _expensiveObjectstreamSubs =
        Stream.periodic(const Duration(seconds: 10)).listen((_) {
      _expensiveObject = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _cheapObjectstreamSubs!.cancel();
    _expensiveObjectstreamSubs!.cancel();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CheapWidget(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ExpensiveWidghet(),
                )
              ],
            ),
            const ObjectProviderWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      context.read<ObjectProvider>().start();
                    },
                    child: const Text("Start")),
                TextButton(
                    onPressed: () {
                      context.read<ObjectProvider>().stop();
                    },
                    child: const Text("Stop"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ExpensiveWidghet extends StatelessWidget {
  const ExpensiveWidghet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final expensiveObject = context.select<ObjectProvider, ExpensiveObject>(
      (provider) => provider.expensiveObject,
    );
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(
        children: [
          const Text("Expensive Widget"),
          const Text("Last updated"),
          Text(expensiveObject.lastUpdated),
        ],
      ),
    );
  }
}

class CheapWidget extends StatelessWidget {
  const CheapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cheapObject = context.select<ObjectProvider, CheapObject>(
      (prov) => prov.cheapObject,
    );
    return Container(
      height: 100,
      color: Colors.green,
      child: Column(
        children: [
          const Text("Cheap Widget"),
          const Text("Last updated"),
          Text(cheapObject.lastUpdated),
        ],
      ),
    );
  }
}

class ObjectProviderWidget extends StatelessWidget {
  const ObjectProviderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObjectProvider>();
    return Container(
      height: 100,
      color: Colors.purple.withOpacity(0.5),
      child: Column(
        children: [
          const Text("Object Provider Widget"),
          const Text("ID"),
          Text(provider.id),
        ],
      ),
    );
  }
}
