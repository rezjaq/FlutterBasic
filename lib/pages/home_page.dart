// import 'package:flutter/material.dart';
// import 'package:flutter_fundamental/models/item.dart';
// import 'package:flutter_fundamental/widgets/footer.dart';
// import 'package:flutter_fundamental/widgets/item_card.dart';
// import 'package:flutter_fundamental/pages/item_page.dart';

// class HomePage extends StatelessWidget {
//   final List<Item> items = [
//     Item(
//       name: 'Sugar',
//       price: 5000,
//       imageUrl:
//           'https://th.bing.com/th/id/R.96c0be17b21250bc6033afed036b25b4?rik=czat0cEFPb7v7Q&riu=http%3a%2f%2fwww.visitcompletecare.com%2fwp-content%2fuploads%2f2020%2f11%2fshutterstock_1564269901-scaled.jpg&ehk=%2bJEboIJEbwUOxKRj%2b5wBwiOj5DE%2fq3vrKSG7tlbdm%2fk%3d&risl=&pid=ImgRaw&r=0',
//       stock: 50,
//       rating: 4.5,
//     ),
//     Item(
//       name: 'Salt',
//       price: 1000,
//       imageUrl:
//           'https://th.bing.com/th/id/OIP.-RKKKM-8vZ6yHj-D11MNcQHaE8?rs=1&pid=ImgDetMain',
//       stock: 100,
//       rating: 4.0,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Supermarket Online'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(8),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 2 / 3,
//               ),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final currentItem = items[index];
//                 return ItemCard(item: currentItem);
//               },
//             ),
//           ),
//           Footer(name: 'Your Name', nim: 'Your NIM'),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_fundamental/models/item.dart';
import 'package:flutter_fundamental/widgets/footer.dart';
import 'package:flutter_fundamental/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      imageUrl:
          'https://th.bing.com/th/id/R.96c0be17b21250bc6033afed036b25b4?rik=czat0cEFPb7v7Q&riu=http%3a%2f%2fwww.visitcompletecare.com%2fwp-content%2fuploads%2f2020%2f11%2fshutterstock_1564269901-scaled.jpg&ehk=%2bJEboIJEbwUOxKRj%2b5wBwiOj5DE%2fq3vrKSG7tlbdm%2fk%3d&risl=&pid=ImgRaw&r=0',
      stock: 50,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 1000,
      imageUrl:
          'https://th.bing.com/th/id/OIP.-RKKKM-8vZ6yHj-D11MNcQHaE8?rs=1&pid=ImgDetMain',
      stock: 100,
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supermarket Online'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final currentItem = items[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman item dengan 'extra' berisi data item
                    context.push('/item', extra: currentItem);
                  },
                  child: ItemCard(item: currentItem),
                );
              },
            ),
          ),
          const Footer(name: 'Your Name', nim: 'Your NIM'),
        ],
      ),
    );
  }
}
