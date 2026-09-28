import 'package:latkuis_mobile_124240085/models/data.dart';
import 'package:latkuis_mobile_124240085/screens/detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filteredMenus = selectedCategory == 'Semua'
        ? menus
        : menus.where((menu) => menu.category == selectedCategory).toList();

    return Column(
      children: [
        DropdownButton<String>(
          value: selectedCategory,
          items: ['Semua', 'Mie', 'Dimsum', 'Minuman']
              .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ))
              .toList(),
          onChanged: (category) {
            if (category != null) {
              setState(() => selectedCategory = category);
            }
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredMenus.length,
            itemBuilder: (context, index) {
              final menu = filteredMenus[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(menu: menu),
                    ),
                  );
                },
                title: Text(menu.name),
                subtitle: Text("Rp ${menu.price}"),
                leading: Image.network(menu.image),
                trailing: Icon(Icons.arrow_forward),
              );
            },
          ),
        ),
      ],
    );
  }
}
