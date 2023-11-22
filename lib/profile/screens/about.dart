import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? _imageFile;
  String? _storedName;
  String? _storedBio;
  String? _storedEmail;
  String? _storedPhone;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    loadUserData(); // Load user data when the screen initializes.
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      // Load user data from SharedPreferences 
      _storedName = prefs.getString('name') ?? 'John Doe';
      _storedBio = prefs.getString('bio') ?? 'Enter your bio';
      _storedEmail = prefs.getString('email') ?? 'john.doe@example.com';
      _storedPhone = prefs.getString('phone') ?? '123-456-7890';
    });

    // Load the profile image.
    final imageString = prefs.getString('profileImage');
    if (imageString != null) {
      final bytes = Uint8List.fromList(imageString.codeUnits);
      setState(() {
        _imageFile = File.fromRawPath(bytes);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> saveUserData() async {
    final name = nameController.text;
    final bio = bioController.text;
    final email = emailController.text;
    final phone = phoneController.text;

    // Create an instance of SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Store user data in SharedPreferences
    prefs.setString('name', name);
    prefs.setString('bio', bio);
    prefs.setString('email', email);
    prefs.setString('phone', phone);

    // Check if an image was selected
    if (_imageFile != null) {
      // Read the selected image file as bytes and store it as a String in SharedPreferences
      final bytes = await _imageFile!.readAsBytes();
      final imageString = String.fromCharCodes(bytes);
      prefs.setString('profileImage', imageString);
    }

    // Provide feedback to the user (you can customize this based on your app's UI)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Data Saved'),
        content: const Text('Your data has been saved successfully.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void startEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void cancelEditing() {
    setState(() {
      _isEditing = false;
      // Reset the form fields with stored values when canceled.
      nameController.text = _storedName ?? '';
      bioController.text = _storedBio ?? '';
      emailController.text = _storedEmail ?? '';
      phoneController.text = _storedPhone ?? '';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: startEditing,
            ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (_isEditing) {
                    _pickImage();
                  }
                },
                child: _imageFile != null
                    ? CircleAvatar(
                        radius: 80.0,
                        backgroundImage: FileImage(_imageFile!),
                      )
                    : const CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('assets/manna.png'),
                      ),
              ),
              const SizedBox(height: 16.0),
              if (_isEditing)
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  controller: nameController,
                )
              else
                Text('Name: $_storedName'),
              const SizedBox(height: 16.0),
              if (_isEditing)
                TextField(
                  decoration: const InputDecoration(labelText: 'Bio'),
                  controller: bioController,
                )
              else
                Text('Bio: $_storedBio'),
              const SizedBox(height: 16.0),
              if (_isEditing)
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: emailController,
                )
              else
                Text('Email: $_storedEmail'),
              if (_isEditing)
                TextField(
                  decoration: const InputDecoration(labelText: 'Phone'),
                  controller: phoneController,
                )
              else
                Text('Phone: $_storedPhone'),
              const SizedBox(height: 16.0),
              if (_isEditing)
                ElevatedButton(
                  onPressed: saveUserData,
                  child: const Text('Save'),
                )
              else
                ElevatedButton(
                  onPressed: startEditing,
                  child: const Text('Edit'),
                ),
              if (_isEditing)
                TextButton(
                  onPressed: cancelEditing,
                  child: const Text('Cancel'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
