import 'package:flutter/material.dart';
import '../models/item.dart';
import '../database/database_helper.dart';

class EditItemPage extends StatefulWidget {
  final Item item;

  EditItemPage({required this.item});

  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.item.name;
    _descriptionController.text = widget.item.description;
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      final updatedItem = Item(
        id: widget.item.id,
        name: _nameController.text,
        description: _descriptionController.text,
      );
      await dbHelper.updateItem(updatedItem);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveItem,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
