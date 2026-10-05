import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController maritalController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController qualificationController =
      TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {

    if (nameController.text.trim().isEmpty ||
        mobileController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        fatherController.text.trim().isEmpty ||
        genderController.text.trim().isEmpty ||
        birthController.text.trim().isEmpty ||
        maritalController.text.trim().isEmpty ||
        religionController.text.trim().isEmpty ||
        languageController.text.trim().isEmpty ||
        qualificationController.text.trim().isEmpty ||
        experienceController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );

      return;
    }

    await firestore.collection('biodata').add({
      'name': nameController.text.trim(),
      'mobile': mobileController.text.trim(),
      'email': emailController.text.trim(),
      'fatherName': fatherController.text.trim(),
      'gender': genderController.text.trim(),
      'dateOfBirth': birthController.text.trim(),
      'maritalStatus': maritalController.text.trim(),
      'religion': religionController.text.trim(),
      'languagesKnown': languageController.text.trim(),
      'qualification': qualificationController.text.trim(),
      'experience': experienceController.text.trim(),
      'address': addressController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Biodata saved successfully'),
      ),
    );

    nameController.clear();
    mobileController.clear();
    emailController.clear();
    fatherController.clear();
    genderController.clear();
    birthController.clear();
    maritalController.clear();
    religionController.clear();
    languageController.clear();
    qualificationController.clear();
    experienceController.clear();
    addressController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    fatherController.dispose();
    genderController.dispose();
    birthController.dispose();
    maritalController.dispose();
    religionController.dispose();
    languageController.dispose();
    qualificationController.dispose();
    experienceController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bio Data'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: mobileController,
              decoration: const InputDecoration(
                labelText: 'Mobile',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: fatherController,
              decoration: const InputDecoration(
                labelText: "Father's Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: birthController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: maritalController,
              decoration: const InputDecoration(
                labelText: 'Marital Status',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: religionController,
              decoration: const InputDecoration(
                labelText: 'Religion',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: languageController,
              decoration: const InputDecoration(
                labelText: 'Languages Known',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: qualificationController,
              decoration: const InputDecoration(
                labelText: 'Qualification',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: experienceController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}