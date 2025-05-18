import 'package:flutter/material.dart';

// Model
import '../../models/nama_model.dart';

// Controller
import '../../controllers/nama_controller.dart';

// Components
import '../components/loading.dart';
import '../components/list.dart';
import '../components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Nama> _characters = <Nama>[];
  List<Nama> _charactersDisplay = <Nama>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCharacters().then((value) {
      setState(() {
        _isLoading = false;
        _characters.addAll(value);
        _charactersDisplay = _characters;
        // print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Nama'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? MySearch(
                hintText: 'ex: nama, arti or asal.',
                onChanged: (searchText) {
                  searchText = searchText.toLowerCase();
                  setState(() {
                    _charactersDisplay = _characters.where((u) {
                      var nameLowerCase = u.nama.toLowerCase();
                      var nicknameLowerCase = u.arti.toLowerCase();
                      var portrayedLowerCase = u.asal.toLowerCase();
                      return nameLowerCase.contains(searchText) ||
                          nicknameLowerCase.contains(searchText) ||
                          portrayedLowerCase.contains(searchText);
                    }).toList();
                  });
                },
              )
                  : MyList(nama: _charactersDisplay[index - 1]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _charactersDisplay.length + 1,
        ),
      ),
    );
  }
}