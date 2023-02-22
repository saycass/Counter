import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    );
  }
}
double _like= 0.0;
double _unlike= 0.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  void decrement () {
    setState(() {
      count --;
    });
    if (kDebugMode) {
      print(count);
    }
  }

  void increment () {
    setState(() {
      count ++;
    });
    if (kDebugMode) {
      print (count);
    }
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  int counting = 0;

  void unlike () {
    setState(() {
      counting ++;
    });
    if (kDebugMode) {
      print(counting);
    }
  }

  void like () {
    setState(() {
      counting ++;
    });
    if (kDebugMode) {
      print (counting);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              isFull ? 'Lotado! ':'Pode entrar!',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white, fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox( height: 32),
            Text(
              count. toString(),
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox( height: 32),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty? null : decrement,
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size (100,100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const  Text (
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox( width: 32),
                  TextButton(
                    onPressed: isFull? null :increment,
                    style: TextButton.styleFrom(
                      backgroundColor:isFull? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size (100,100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child:  const Text (
                      'Entrou',
                      style: TextStyle(
                        color:Colors.black, fontSize: 16,
                      ),
                    ),
                  ),
                ]
            ),
            Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.sentiment_satisfied_sharp, color: Colors.white ),
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            counting. toString();
                            _like += 1;
                          });
                        },
                      ),
                      Text('Bom : $_like',
                        style: const TextStyle (
                          color: Colors.white, fontSize: 18,
                        ),
                      ),
                    ],),
                  const SizedBox( width: 80),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.sentiment_very_dissatisfied,color: Colors.white),
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            counting. toString();
                            _unlike += 1;
                          });
                        },
                      ),
                      Text('Ruim : $_unlike',
                        style: const TextStyle (
                          color: Colors.white, fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }


}