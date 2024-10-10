import 'package:flutter/material.dart';
import 'package:flutter_fundamental/pages/home_page.dart';
import 'package:flutter_fundamental/pages/item_page.dart';
import 'package:flutter_fundamental/models/item.dart';
import 'package:go_router/go_router.dart';

// import 'package:go_router/go_router.dart';
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
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Widget titleSection() {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: const Text(
//                     'Wisata Gunung di Pulau Lombok, Nusa Tenggara Barat',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   'Pulau Lombok, Nusa Tenggara Barat',
//                   style: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Icon(
//             Icons.star,
//             color: Colors.red,
//           ),
//           const Text('41'),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Praktikum 2
//     // Lngkah 2
//     Color color = Theme.of(context).primaryColor;
//     Widget buttonSection = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildButtonColumn(color, Icons.call, 'Call'),
//         _buildButtonColumn(color, Icons.near_me, 'Route'),
//         _buildButtonColumn(color, Icons.share, 'Share'),
//       ],
//     );

//     // Praktikum 3
//     // langkah 1
//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: const Text(
//         'Gunung Rinjani adalah gunung yang berlokasi di Pulau Lombok, Nusa Tenggara Barat. '
//         'Gunung yang merupakan gunung berapi kedua tertinggi di Indonesia dengan ketinggian 3.726 mdpl '
//         'serta terletak pada lintang 8º25 LS dan 116º28 BT ini merupakan gunung favorit bagi pendaki Indonesia '
//         'karena keindahan pemandangannya.\n\n'
//         'Gunung ini merupakan bagian dari Taman Nasional Gunung Rinjani '
//         'yang memiliki luas sekitar 41.330 ha dan diusulkan penambahannya sehingga menjadi 76.000 ha ke arah barat dan timur.',
//         softWrap: true,
//       ),
//     );

//     return MaterialApp(
//       title: 'Flutter layout: Rizqi Reza Danuarta dan 2241720057',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: Center(
//           child: ListView(
//             children: [
//               Image.asset(
//                 'lib/image/rinjani.jpeg',
//                 width: 600,
//                 height: 240,
//                 fit: BoxFit.cover,
//               ),
//               titleSection(),
//               buttonSection,
//               textSection,
//               const Center(
//                 child: Text('Rizqi Reza Danuarta'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // praktikum 2
//   // langkah 1
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(icon, color: color),
//         Container(
//           margin: const EdgeInsets.only(top: 8),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// membuat reels ig

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {},
//           ),
//           title: Text(
//             'Reels',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: IconButton(
//                 icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//         body: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               child: Image.network(
//                 'https://th.bing.com/th/id/OIP.YtJGUxCT6FB3FWJFLo5FtwAAAA?rs=1&pid=ImgDetMain',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               right: 16,
//               bottom: 20,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Icon(Icons.favorite_border, color: Colors.white, size: 30),
//                   SizedBox(height: 16),
//                   Icon(Icons.chat_bubble_outline,
//                       color: Colors.white, size: 30),
//                   SizedBox(height: 16),
//                   Icon(Icons.send, color: Colors.white, size: 30),
//                   SizedBox(height: 16),
//                   Icon(Icons.more_vert, color: Colors.white, size: 30),
//                 ],
//               ),
//             ),
//             Positioned(
//               left: 16,
//               bottom: 16,
//               right: 16,
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         'https://example.com/profile_image.jpg'), // Ganti dengan URL gambar profil
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'minggumendaki',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 2,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(color: Colors.white),
//                             ),
//                             child: Text(
//                               'Ikuti',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         'Rahasia Hati (Nidji)',
//                         style: TextStyle(
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.grey[600],
//           unselectedItemColor: Colors.grey[600],
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add_box),
//               label: 'Add',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.video_library_outlined),
//               label: 'Reels',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Belanja',
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       theme: ThemeData(
//         useMaterial3: true,
//         primaryColor: Colors.blue,
//         textTheme: TextTheme(
//           bodyMedium: TextStyle(fontSize: 16),
//         ),
//       ),
//       routes: {
//         '/': (context) => HomePage(),
//         '/item': (context) => ItemPage(),
//       },
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Buat instance GoRouter
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/item',
          builder: (context, state) {
            final item = state.extra as Item;
            return ItemPage(item: item);
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      title: 'Belanja',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
