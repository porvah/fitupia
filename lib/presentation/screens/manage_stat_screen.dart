import 'package:first_app/logic/manage_weight_cubit/manage_weight_cubit.dart';
import 'package:first_app/models/state_item.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/custom_button.dart';
import 'package:first_app/presentation/widgets/label_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageStatScreen extends StatefulWidget {
  static const String routeName = '/manage_stats';

  const ManageStatScreen({super.key});

  @override
  State<ManageStatScreen> createState() => _ManageStatScreenState();
}

class _ManageStatScreenState extends State<ManageStatScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late ManageWeightCubit weightCubit;

  // List<List<dynamic>> stats = [
  //   ['1/1', 120],
  //   ['1/2', 100],
  //   ['1/3', 110],
  //   ['1/4', 80],
  //   ['1/4', 60],
  // ];

  @override
  void initState() {
    super.initState();
    weightCubit = BlocProvider.of<ManageWeightCubit>(context);

    weightCubit.getAllWeights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Manage Stats',
        Colors.white,
        const Color.fromARGB(255, 165, 63, 63),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildInputFields(),
            _buildSaveButton(),
            _buildStatsHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Row(
        children: [
          Expanded(
            child: LabelInputField(
              title: 'Title',
              hintText: 'title of stats',
              color: const Color.fromARGB(255, 165, 63, 63),
              textColor: const Color.fromARGB(255, 165, 63, 63),
              textEditingController: titleController,
              validateInput: _validateTitle,
            ),
          ),
          Expanded(
            child: LabelInputField(
              title: 'Weight',
              hintText: 'your current weight',
              color: const Color.fromARGB(255, 165, 63, 63),
              textColor: const Color.fromARGB(255, 165, 63, 63),
              textEditingController: valueController,
              validateInput: _validateWeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        title: 'Add',
        onPressed: _onSaveMeal,
        backgroundColor: const Color.fromARGB(255, 165, 63, 63),
        color: Colors.white,
        fontSize: 22,
        icon: Icons.add,
      ),
    );
  }

  Widget _buildStatsHistory() {
    var stats = weightCubit.allWeights;

    return Expanded(
      child: ListView.builder(
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return _buildItem(stats[index]);
        },
      ),
    );
  }

  Widget _buildItem(StateItem item) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Date: ${_getStringVal(item.title)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Weight: ${_getStringVal(item.value.toString())}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () => _onDelete(item),
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          color: Colors.white,
        ),
      ]),
    );
  }

  String? _validateTitle(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field can\'t be empty!';
    }
    return null;
  }

  String? _validateWeight(String? val) {
    if (val == null) {
      return "Field can't be empty";
    }

    try {
      double newVal = double.parse(val);
      if (newVal <= 0) {
        return "Weight must be greater than zero";
      }
      if (newVal >= 400) {
        return "Weight must be less than 400";
      }
    } catch (e) {
      return "Weight must be number";
    }
    return null;
  }

  Future<void> _onSaveMeal() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
      return;
    }

    var nav = Navigator.of(context);

    String title = titleController.text;
    double weight = double.parse(valueController.text);

    await weightCubit.addWeight(StateItem(title: title, value: weight));
    nav.pop();
  }

  Future<void> _onDelete(StateItem item) async {
    await weightCubit.deleteWeight(item);
    setState(() {});
  }

  String _getStringVal(String val) {
    if (val.length > 5) {
      return '${val.substring(0, 5)}..';
    }
    return val;
  }
}
