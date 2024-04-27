import 'package:flutter/material.dart';

class TelleringPage extends StatefulWidget {
  @override
  _TelleringPageState createState() => _TelleringPageState();
}

class _TelleringPageState extends State<TelleringPage> {
  String selectedConcern = 'Select Concerns'; // Default selected concern
  TextEditingController subjectController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    emailController.dispose();
    additionalInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TELLERING',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.receipt,
                  size: 80,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'This page allows you to select your particular concerns. You may also contact the tellering office for further concerns.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'CONCERNS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedConcern,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedConcern = newValue!;
                  });
                },
                items: <String>[
                  'Select Concerns',
                  'Balance',
                  'Tuition Fee',
                  'Adding/Removing Course',
                  'ID',
                  'School Uniform',
                  'Library Card',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: value == 'Select Concerns'
                          ? const TextStyle(color: Colors.black)
                          : null,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              if (selectedConcern != 'Select Concerns') _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please provide details for $selectedConcern:',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: subjectController,
          decoration: const InputDecoration(
              labelText: 'Student Number',
              labelStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              labelText: 'Student Name',
              labelStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),
        ),
        TextField(
          controller: additionalInfoController,
          decoration: const InputDecoration(
              labelText: 'Mode of Payment (Indicate Cash or Card)',
              labelStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),
          maxLines: 2, // Allof
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle form submission here
              // You can access the entered values using:
              // nameController.text, emailController.text, and additionalInfoController.text
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TelleringPage(),
  ));
}
