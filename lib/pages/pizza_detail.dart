import 'package:flutter/material.dart';
import 'package:flutter_fundamental/pages/pizza.dart';
import 'package:flutter_fundamental/http/http_helper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen({
    super.key,
    required this.pizza,
    required this.isNew,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txId = TextEditingController();
  final TextEditingController txName = TextEditingController();
  final TextEditingController txPrice = TextEditingController();
  final TextEditingController txDescription = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();

  String operationResult = '';

  @override
  void initState() {
    super.initState();
    if (!widget.isNew) {
      // Inisialisasi nilai TextField jika bukan 'new' pizza
      txId.text = widget.pizza.id.toString();
      txName.text = widget.pizza.pizzaName;
      txDescription.text = widget.pizza.description;
      txPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
    }
  }

  // Fungsi untuk menyimpan atau memperbarui pizza
  Future<void> savePizza() async {
    Pizza pizza = Pizza(
      id: int.tryParse(txId.text) ?? 0,
      pizzaName: txName.text,
      description: txDescription.text,
      price: double.tryParse(txPrice.text) ?? 0.0,
      imageUrl: txtImageUrl.text,
    );

    HttpHelper helper = HttpHelper();
    String result;

    // Periksa apakah pizza baru atau memperbarui pizza yang ada
    if (widget.isNew) {
      result = await helper.postPizza(pizza);
    } else {
      result = await helper.putPizza(pizza);
    }

    setState(() {
      operationResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txName,
                decoration:
                    const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txDescription,
                decoration:
                    const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                child: const Text('Save Pizza'),
                onPressed: savePizza, // Menggunakan savePizza di sini
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers ketika widget dihapus
    txId.dispose();
    txName.dispose();
    txPrice.dispose();
    txDescription.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }
}
