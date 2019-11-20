
import 'package:flutter/material.dart';
import 'package:theme_change_using_provider/dashboard.dart';


class Login extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: SingleChildScrollView(
        child:
             LoginForm(),
        ),
    );
  }


}
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();


}

class _LoginFormState extends State<LoginForm> {
  var _loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditingController =  new TextEditingController();
  TextEditingController dobTextEditingController =  new TextEditingController();
  TextEditingController passwordTextEditingController =  new TextEditingController();

  @override
  Widget build(BuildContext context) {

    _onLoginButtonPressed() {
      if(_loginFormKey.currentState.validate()) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashBoard()));
      }
    }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    TextFormField(controller: usernameTextEditingController,
                      decoration: InputDecoration(labelText: "Username",  ),validator: _userNameValidator,),
                    //Password EditText goes below....
                    TextFormField(controller: dobTextEditingController,
                      decoration: InputDecoration(labelText: "Date of Birth"),keyboardType: TextInputType.number,validator: _dobValidator,),

                    TextFormField(controller: passwordTextEditingController,obscureText: true,validator: _passwordValidator,
                      decoration: InputDecoration(labelText: "Password"),keyboardType: TextInputType.text,),

                    RaisedButton(
                      onPressed:_onLoginButtonPressed,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  String _userNameValidator(String value){
    if(value.isEmpty){
      return "Username cannot be empty";
    }
  }

  String _dobValidator(String value){
    if(value.isEmpty){
      return "DOB cannot be empty";
    }
  }

  String _passwordValidator(String value){
    if(value.isEmpty){
      return "Password cannot be empty";
    }
  }
}
