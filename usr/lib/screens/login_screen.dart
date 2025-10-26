import 'package:flutter/material.dart';

enum UserType { Student, Teacher, Admin }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserType _selectedUserType = UserType.Student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildUserTypeSelector(),
              const SizedBox(height: 30),
              _buildLoginForm(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement login logic and navigation
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserTypeSelector() {
    return SegmentedButton<UserType>(
      segments: const <ButtonSegment<UserType>>[
        ButtonSegment<UserType>(
            value: UserType.Student,
            label: Text('Student'),
            icon: Icon(Icons.school)),
        ButtonSegment<UserType>(
            value: UserType.Teacher,
            label: Text('Teacher'),
            icon: Icon(Icons.person)),
        ButtonSegment<UserType>(
            value: UserType.Admin,
            label: Text('Admin'),
            icon: Icon(Icons.admin_panel_settings)),
      ],
      selected: <UserType>{_selectedUserType},
      onSelectionChanged: (Set<UserType> newSelection) {
        setState(() {
          _selectedUserType = newSelection.first;
        });
      },
    );
  }

  Widget _buildLoginForm() {
    switch (_selectedUserType) {
      case UserType.Student:
        return _StudentLoginForm();
      case UserType.Teacher:
        return _TeacherLoginForm();
      case UserType.Admin:
        return _AdminLoginForm();
    }
  }
}

class _StudentLoginForm extends StatefulWidget {
  @override
  __StudentLoginFormState createState() => __StudentLoginFormState();
}

class __StudentLoginFormState extends State<_StudentLoginForm> {
  String _educationType = 'school';
  String? _class, _division, _department, _year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(decoration: const InputDecoration(labelText: 'Name')),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(labelText: 'Username')),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(labelText: 'Gmail')),
        const SizedBox(height: 10),
        TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true),
        const SizedBox(height: 10),
        TextFormField(
            decoration:
                const InputDecoration(labelText: 'Parent/Guardian Contact')),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("School"),
            Radio<String>(
              value: 'school',
              groupValue: _educationType,
              onChanged: (value) {
                setState(() {
                  _educationType = value!;
                });
              },
            ),
            const Text("College"),
            Radio<String>(
              value: 'college',
              groupValue: _educationType,
              onChanged: (value) {
                setState(() {
                  _educationType = value!;
                });
              },
            ),
          ],
        ),
        if (_educationType == 'school') ...[
          DropdownButtonFormField<String>(
            value: _class,
            hint: const Text("Select Class"),
            onChanged: (value) => setState(() => _class = value),
            items: List.generate(12, (i) => '${i + 1}')
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _division,
            hint: const Text("Select Division"),
            onChanged: (value) => setState(() => _division = value),
            items: ['A', 'B', 'C', 'D']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
        ] else ...[
          DropdownButtonFormField<String>(
            value: _department,
            hint: const Text("Select Department"),
            onChanged: (value) => setState(() => _department = value),
            items: ["Art's", "Science", "Engineering"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _year,
            hint: const Text("Select Year"),
            onChanged: (value) => setState(() => _year = value),
            items: ["1st", "2nd", "3rd", "4th", "5th"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _TeacherLoginForm extends StatefulWidget {
  @override
  __TeacherLoginFormState createState() => __TeacherLoginFormState();
}

class __TeacherLoginFormState extends State<_TeacherLoginForm> {
  String _educationType = 'school';
  String? _class, _section, _department, _year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(decoration: const InputDecoration(labelText: 'Name')),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(labelText: 'Username')),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(labelText: 'Gmail')),
        const SizedBox(height: 10),
        TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("School"),
            Radio<String>(
              value: 'school',
              groupValue: _educationType,
              onChanged: (value) {
                setState(() {
                  _educationType = value!;
                });
              },
            ),
            const Text("College"),
            Radio<String>(
              value: 'college',
              groupValue: _educationType,
              onChanged: (value) {
                setState(() {
                  _educationType = value!;
                });
              },
            ),
          ],
        ),
        if (_educationType == 'school') ...[
          DropdownButtonFormField<String>(
            value: _class,
            hint: const Text("Select Class to Monitor"),
            onChanged: (value) => setState(() => _class = value),
            items: List.generate(12, (i) => '${i + 1}')
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _section,
            hint: const Text("Select Section to Monitor"),
            onChanged: (value) => setState(() => _section = value),
            items: ['A', 'B', 'C', 'D']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
        ] else ...[
          DropdownButtonFormField<String>(
            value: _department,
            hint: const Text("Select Department to Monitor"),
            onChanged: (value) => setState(() => _department = value),
            items: ["Art's", "Science", "Engineering"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _year,
            hint: const Text("Select Year to Monitor"),
            onChanged: (value) => setState(() => _year = value),
            items: ["1st", "2nd", "3rd", "4th", "5th"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _AdminLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(decoration: const InputDecoration(labelText: 'Name')),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(labelText: 'Username')),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(labelText: 'Gmail')),
        const SizedBox(height: 10),
        TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true),
      ],
    );
  }
}
