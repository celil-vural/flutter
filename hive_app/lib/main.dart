import 'package:flutter/material.dart';
import 'package:hive_app/model/student.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  await Hive.initFlutter('uygulama');
  await Hive.openBox('test');
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(EyesColorAdapter());
  await Hive.openBox<Student>('students');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  int _counter=0;
  var box=Hive.box('test');
  void _incrementCounter(){
    setState(() {
      
      _counter++;
      box.put('counter', _counter);    
    });
    
  }
  void _customData()async{
    var celil=Student(5, 'celil', EyesColor.BLACK);
    var emre=Student(6, 'emre', EyesColor.BLUE);
    var box=Hive.box<Student>('students');
    box.add(celil);
    box.add(emre);
    }
  @override
  Widget build(BuildContext context){
    _counter=box.get('counter', defaultValue: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Örneği'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Butona basıldı:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _customData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    ); 
  }
}