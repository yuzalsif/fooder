import 'package:flutter/material.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size get size => MediaQuery.of(context).size;
  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();
  // String _userName = '';
  // String _passWord = '';
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  // void intiState() {
  //   super.initState();
  //   _userNameController.addListener(() {
  //     setState(() {
  //       _userName = _userNameController.text;
  //     });
  //   });

  //   _passWordController.addListener(() {
  //     setState(() {
  //       _passWord = _passWordController.text;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _userNameController.dispose();
  //   _passWordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: size.width / 4,
                  height: size.height / 4,
                  child: const Image(
                    image: AssetImage('assets/fooderlich_asset/rw_logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                buildTextField('🍔 username', _userNameController),
                const SizedBox(
                  height: 16,
                ),
                buildTextField('🎹 password', _passWordController),
                const SizedBox(
                  height: 16,
                ),
                buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      cursorColor: rwColor,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            height: 0.5,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          )),
    );
  }

  Widget buildButton() {
    // final appStateManager =
    // Provider.of<AppStateManager>(context, listen: false);
    return SizedBox(
      height: 55,
      child: MaterialButton(
        onPressed: () {
          context.read<AppStateManager>().login('Yusuf', 'testpass1');
        },
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
