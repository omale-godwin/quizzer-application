import 'package:flutter/material.dart';
import 'package:login_signup/constants/constants.dart';
import 'package:login_signup/ui/widgets/custom_shape.dart';
import 'package:login_signup/ui/widgets/responsive_ui.dart';
import 'package:login_signup/ui/widgets/textformfield.dart';


class forgetpasswordpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: forgetpasswordScreen(),
    );
  }
}


class forgetpasswordScreen extends StatefulWidget {
  @override
  _forgetpasswordScreenState createState() => _forgetpasswordScreenState();
}

class _forgetpasswordScreenState extends State<forgetpasswordScreen> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Quizzer(),
              forgetpasswordText(),
              forgetTextRow(),
              form(),
              button(),
            ],
          ),
        ),
      ),
    );
  }


  Widget Quizzer() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
              child: Container(
                height:_large? _height/4 : (_medium? _height/3.75 : _height/3.5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[200], Colors.lightGreen],
                  ),
                ),
              )
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: _large? _height/30 : (_medium? _height/25 : _height/20)),
          child: Image.asset(
            'assets/images/login.png',
            height: _height/3.5,
            width: _width/3.5,
          ),
        ),
      ],
    );
  }

  Widget forgetpasswordText(){
    return Container(
      margin: EdgeInsets.only(left: _width / 50, top: _height / 20 ),
      child: Row(
        children: <Widget>[
          Text(
            '''
            Do you Forget Your Password
            
            ''',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large? 30 : (_medium? 25 : 20),
            )
          )
        ],
      ),
    );
  }

  Widget forgetTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Enter Your Email Address",
            style: TextStyle(

              fontWeight: FontWeight.w300,
              fontSize: _large? 20 : (_medium? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0,
          right: _width / 12.0,
          top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),


          ],
        ),
      ),
    );
  }
  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Recover Your Password",
    );

  }
  Widget button() {

    return Container(
      margin: EdgeInsets.only(top: 30),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () {
          print("Routing to your account");
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text('Login Successful')));

        },
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          alignment: Alignment.center,
          width: _large? _width/4 : (_medium? _width/3.75: _width/3.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
              colors: <Color>[Colors.orange[200], Colors.pinkAccent],
            ),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text('Submit',style: TextStyle(fontSize: _large? 14: (_medium? 12: 10))),
        ),
      ),
    );
  }
}

