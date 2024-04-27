import 'package:flutter/material.dart';

class RegistrarPage extends StatefulWidget {
  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
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
          'SCHOOL REGISTRAR',
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
                  Icons.school,
                  size: 80,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'This page is designed to address various queries and issues related to student enrollment, academic records, and institutional policies. You may also contact the registrar office for further concerns.',
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
                  'Registration and Enrollment',
                  'Evaluation of Records',
                  'Request for Alumni',
                  'Follow-Up',
                  'Course Accreditation',
                  'Application for Scholarships',
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
              labelText: 'Subject', labelStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              labelText: 'Email', labelStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),
        ),
        TextField(
          controller: additionalInfoController,
          decoration: const InputDecoration(
              labelText: 'What is your concern',
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
    home: RegistrarPage(),
  ));
}
