import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/user.dart';

class ProfileDetailScreen extends StatefulWidget {
  final User user;
  const ProfileDetailScreen({super.key, required this.user, });

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  /* ? */
  TextEditingController nameController = TextEditingController(); /* ? */

  @override
  void initState() {
    if (widget.user.name != "") {
      nameController.text = widget.user.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue[200]
                    ),
                    child: const Icon(Icons.chevron_left)
                  ),
                ),
                const SizedBox( width: 8),
                const Flexible(
                  child: Text(
                    "Profile Detail",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          isDense: true,
                          label: const Text("Name"),
                          hintText: "Masukan nama anda",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nama wajib diisi";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        // controller: usernameController,
                        decoration: InputDecoration(
                          isDense: true,
                          label: const Text("Username"),
                          hintText: "Masukan username anda",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username wajib di isi";
                          }
                          return null;
                        },
                      ),
                    ),

                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  log("simpan");
                } else {
                  log("gagal simpan");
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: const Center(
                  child: Text("Simpan")
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}