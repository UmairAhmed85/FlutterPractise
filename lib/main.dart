import 'package:flutter/material.dart';

class User{
  final String name;
  final String occupation;

  const User(this.name, this.occupation);
}

void main() {
  const userList = [
    User("User - 1", "Software Engineer"),
    User("User - 2", "Android Engineer"),
    User("User - 3", "IOS Engineer"),
    User("User - 4", "Electrical Engineer"),
    User("User - 5", "Mechanical Engineer")
  ];
  runApp(
    const MaterialApp(
      title: 'Demo',
      home: UsersScreen(
        users: userList,
      ),
    ),
  );
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].occupation),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserDetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: users[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  // In the constructor, require a User.
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    // Use the User to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text("${user.name} is ${user.occupation}"),
      ),
    );
  }
}