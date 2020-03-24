import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/presentation/screens/register/bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc registerBloc;
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    _nameController = TextEditingController();

    if (mounted) {
      registerBloc.add(GetEmployee(email: 'ariiq.dio@dkatalis.com'));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bloc provider ambil disini
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if (state is RegisterInitial) {}

              if (state is EmployeeLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is EmployeeLoaded) {
                _nameController.text = state.employee.fullName;

                return Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                    ),
                    Text(state.employee.gender.toString()),
                  ],
                );
              }

              if (state is EmployeeError) {
                return Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.red),
                );
              }

              return Text('aaaa');
            },
          ),
        ),
      ),
    );
  }
}
