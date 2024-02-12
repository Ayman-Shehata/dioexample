import 'package:flutter/material.dart';

class ListDataItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  final String phone;
  const ListDataItem(
      {super.key,
      required this.title,
      required this.subtitle,
      this.onTap,
      this.phone = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Image.network(
              'https://www.pngall.com/wp-content/uploads/5/Profile-Transparent.png'),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  Text(phone),
                ],
              )
            ],
          ),
          trailing: const Icon(Icons.person),
          onTap: onTap,
        ),
      ),
    );
  }
}
