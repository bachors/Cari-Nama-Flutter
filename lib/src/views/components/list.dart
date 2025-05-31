import 'package:flutter/material.dart';

// Model
import '../../models/nama_model.dart';

class MyList extends StatelessWidget {
  final Nama nama;
  const MyList({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: nama.kelamin,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://raw.githubusercontent.com/bachors/Cari-Nama-Flutter/refs/heads/master/assets/image/${nama.kelamin}.png'),
              ),
            ),
            title: Text(nama.nama),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kelamin: ${nama.kelamin}'),
                Text('Asal: ${nama.asal}'),
                Text('Arti: ${nama.arti}'),
              ],
            ),
            onTap: () {
              //
            },
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}