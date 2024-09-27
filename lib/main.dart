// import 'package:flutter/material.dart';
// import 'package:flutter_fundamental/basic_widgets/selection_widget.dart';
// import 'package:flutter_fundamental/basic_widgets/text_widget.dart';
// import 'package:flutter_fundamental/basic_widgets/image_widget.dart';
// import 'package:flutter_fundamental/basic_widgets/loading_cupertino.dart';
// import 'package:flutter_fundamental/basic_widgets/fab_widget.dart';
// import 'package:flutter_fundamental/basic_widgets/dialog_widget.dart';
// import 'package:flutter_fundamental/basic_widgets/text_file_widget.dart';
// import 'dart:async';

// // void main() => runApp(const MyApp());

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'Contoh Date Picker',
// //       home: MyHomePage(title: 'Contoh Date Picker'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   // Variable/State untuk mengambil tanggal
// //   DateTime selectedDate = DateTime.now();

// //   //  Initial SelectDate FLutter
// //   Future<void> _selectDate(BuildContext context) async {
// //     // Initial DateTime FIinal Picked
// //     final DateTime? picked = await showDatePicker(
// //         context: context,
// //         initialDate: selectedDate,
// //         firstDate: DateTime(2015, 8),
// //         lastDate: DateTime(2101));
// //     if (picked != null && picked != selectedDate) {
// //       setState(() {
// //         selectedDate = picked;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[
// //             Text("${selectedDate.toLocal()}".split(' ')[0]),
// //             const SizedBox(
// //               height: 20.0,
// //             ),
// //             ElevatedButton(
// //               onPressed: () => {
// //                 _selectDate(context),
// //                 // ignore: avoid_print
// //                 print(selectedDate.day + selectedDate.month + selectedDate.year)
// //               },
// //               child: const Text('Pilih Tanggal'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // void main() {
// //   runApp(const MyApp());
// // }

// // Langlah 5
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: const Text("Contoh TextField")),
// //         body: const TextField(
// //           obscureText: false,
// //           decoration: InputDecoration(
// //             border: OutlineInputBorder(),
// //             labelText: 'Nama',
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // Langkah 4
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       home: Scaffold(
// //         body: MyLayout(),
// //       ),
// //     );
// //   }
// // }

// // class MyLayout extends StatelessWidget {
// //   const MyLayout({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: ElevatedButton(
// //         child: const Text('Show alert'),
// //         onPressed: () {
// //           showAlertDialog(context);
// //         },
// //       ),
// //     );
// //   }
// // }

// // showAlertDialog(BuildContext context) {
// //   // set up the button
// //   Widget okButton = TextButton(
// //     child: const Text("OK"),
// //     onPressed: () {
// //       Navigator.pop(context);
// //     },
// //   );

// //   // set up the AlertDialog
// //   AlertDialog alert = AlertDialog(
// //     title: const Text("My title"),
// //     content: const Text("This is my message."),
// //     actions: [
// //       okButton,
// //     ],
// //   );

// //   // show the dialog
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return alert;
// //     },
// //   );
// // }

// // Langkah 3
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.red,
// //       ),
// //       home: const MyHomePage(title: 'My Increment App'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         child: Container(
// //           height: 50.0,
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment Counter',
// //         child: const Icon(Icons.add),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //     );
// //   }
// // }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             MyImageWidget(),
//             MyTextWidget(),
//             MyLayout(),
//             DatePickerWidget(),
//             TextFieldWidget(),
//             LoadingCupertinoWidget(),
//             // FabWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Minggu ke - 5
// Langkah 2
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Pulau Lombok, Nusa Tenggara Barat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Pulau Lombok, Nusa Tenggara Barat',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Praktikum 2
    // Lngkah 2
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Call'),
        _buildButtonColumn(color, Icons.near_me, 'Route'),
        _buildButtonColumn(color, Icons.share, 'Share'),
      ],
    );

    // Praktikum 3
    // langkah 1
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Rinjani adalah gunung yang berlokasi di Pulau Lombok, Nusa Tenggara Barat. '
        'Gunung yang merupakan gunung berapi kedua tertinggi di Indonesia dengan ketinggian 3.726 mdpl '
        'serta terletak pada lintang 8º25 LS dan 116º28 BT ini merupakan gunung favorit bagi pendaki Indonesia '
        'karena keindahan pemandangannya.\n\n'
        'Gunung ini merupakan bagian dari Taman Nasional Gunung Rinjani '
        'yang memiliki luas sekitar 41.330 ha dan diusulkan penambahannya sehingga menjadi 76.000 ha ke arah barat dan timur.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Rizqi Reza Danuarta dan 2241720057',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: ListView(
            children: [
              Image.asset(
                'lib/image/rinjani.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection(),
              buttonSection,
              textSection,
              const Center(
                child: Text('Rizqi Reza Danuarta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // praktikum 2
  // langkah 1
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
