// import 'package:flutter/material.dart';
// import 'package:flutter_fundamental/models/item.dart';

// class ItemPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(itemArgs.name),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Hero(
//               tag: itemArgs.name,
//               child: Image.network(
//                 itemArgs.imageUrl,
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Price: Rp.${itemArgs.price}',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Stock: ${itemArgs.stock}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.orange, size: 24),
//                 SizedBox(width: 8),
//                 Text(
//                   '${itemArgs.rating}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.name,
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: Rp.${item.price}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Stock: ${item.stock}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${item.rating}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
