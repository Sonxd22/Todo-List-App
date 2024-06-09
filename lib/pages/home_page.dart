import 'package:flutter/material.dart';
import '../models/item.dart';
import '../database/database_helper.dart';
import 'add_item_page.dart';
import 'edit_item_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final data = await dbHelper.getItems();
    setState(() {
      items = data;
    });
  }

  void _navigateToAddItemPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItemPage()),
    );
    if (result != null) {
      _loadItems();
    }
  }

  void _navigateToEditItemPage(Item item) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditItemPage(item: item)),
    );
    if (result != null) {
      _loadItems();
    }
  }

  void _deleteItem(String id) async {
    await dbHelper.deleteItem(id);
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.list, color: Colors.white),
                ),
                title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.teal),
                      onPressed: () => _navigateToEditItemPage(item),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => _deleteItem(item.id!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddItemPage,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
