import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/widgets/notebook_card.dart';
import 'package:flutter/material.dart';

import '../helper/hand_Book_category.dart';

class NoteBookScreen extends StatefulWidget {
  static const String routeName = '/notebook_screen';

  const NoteBookScreen({super.key});

  @override
  State<NoteBookScreen> createState() => _NoteBookScreenState();
}

class _NoteBookScreenState extends State<NoteBookScreen> {
  bool isSearching = false;
  final TextEditingController _controller = TextEditingController();
  late List<CardContent> curHandBookCards;

  @override
  void initState() {
    super.initState();
    curHandBookCards = handbookCards;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(context),
      appBar: isSearching ? _buildSearchAppBar() : _buildDefaultAppBar(),
      body: ListView.builder(
        itemCount: curHandBookCards.length,
        itemBuilder: (ctx, index) {
          return NoteBookCard(
            card: curHandBookCards[index],
            toBeDisplayedList: index,
          );
        },
      ),
    );
  }

  AppBar _buildDefaultAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 190, 199, 206),
      foregroundColor: Colors.black,
      title: const Text(
        "Hand Book",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 190, 199, 206),
      foregroundColor: Colors.black,
      title: _buildTextField(),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for meal',
        hintStyle: TextStyle(color: Colors.black45, fontSize: 18),
      ),
      cursorColor: Colors.black,
      autofocus: true,
      enableSuggestions: true,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: _onChange,
    );
  }

  void _onChange(String val) {
    List<CardContent> newCards = handbookCards
        .where((e) => e.name.toLowerCase().contains(val.trim().toLowerCase()))
        .toList();

    setState(() {
      curHandBookCards = newCards;
    });
  }

  void _startSearching() {
    setState(() {
      ModalRoute.of(context)!.addLocalHistoryEntry(
        LocalHistoryEntry(onRemove: _stopSearching),
      );
      isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      curHandBookCards = handbookCards;
      isSearching = false;
      _controller.clear();
    });
  }
}
