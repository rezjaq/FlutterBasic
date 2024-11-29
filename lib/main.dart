import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/http/http_helper.dart';
import 'package:flutter_fundamental/pages/pizza_detail.dart';
import 'package:flutter_fundamental/pages/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HttpHelper _helper = HttpHelper();

  Future<List<Pizza>> callPizza() async {
    return await _helper.getPizzaList();
  }

  Future<void> deletePizzaFromList(
      int pizzaId, int position, List<Pizza> pizzas) async {
    // Menampilkan loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await _helper.deletePizza(pizzaId);
      Navigator.pop(context); // Menutup loading dialog setelah berhasil

      setState(() {
        pizzas.removeAt(position);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pizza dengan ID $pizzaId berhasil dihapus'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        ),
      );
    } catch (e) {
      Navigator.pop(context); // Menutup loading dialog jika gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus pizza dengan ID $pizzaId'),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza List'),
      ),
      body: FutureBuilder<List<Pizza>>(
        future: callPizza(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data pizza.'));
          }

          final pizzas = snapshot.data!;
          return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (BuildContext context, int position) {
              final pizza = pizzas[position];
              return Dismissible(
                key: Key(pizza.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  await deletePizzaFromList(pizza.id, position, pizzas);
                  setState(() {}); // Memastikan daftar diperbarui
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  title: Text(pizza.pizzaName),
                  subtitle: Text('${pizza.description} - €${pizza.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailScreen(
                          pizza: pizza,
                          isNew: false,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza.empty(),
                isNew: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
