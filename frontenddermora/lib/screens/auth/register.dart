import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontenddermora/screens/auth/login.dart';

import '../primary_questions/intro.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  bool checkedValue = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          height: 50.0,
          child: TextField(
            style: GoogleFonts.poppins(color: Color(0xFF000000)),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person_outlined,
                color: const Color(0xff7B6F72),
              ),
              hintText: 'First Name',
              hintStyle: GoogleFonts.poppins(color: const Color(0xff7B6F72)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          height: 50.0,
          child: TextField(
            style: GoogleFonts.poppins(color: Color(0xFF000000)),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person_outlined,
                color: const Color(0xff7B6F72),
              ),
              hintText: 'Last Name',
              hintStyle: GoogleFonts.poppins(color: const Color(0xff7B6F72)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.poppins(color: Color(0xFF000000)),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: const Color(0xff7B6F72),
              ),
              hintText: 'Email',
              hintStyle: GoogleFonts.poppins(color: const Color(0xff7B6F72)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          height: 50.0,
          child: TextField(
            obscureText: !passwordVisible,
            style: GoogleFonts.poppins(color: Color(0xFF000000)),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: const Color(0xff7B6F72),
              ),
              hintText: 'Password',
              hintStyle: GoogleFonts.poppins(color: const Color(0xff7B6F72)),
              suffixIcon: IconButton(
                color: const Color(0xff7B6F72),
                splashRadius: 1,
                icon: Icon(passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
                onPressed: togglePassword,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildconfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          height: 50.0,
          child: TextField(
            obscureText: !passwordVisible,
            style: GoogleFonts.poppins(color: Color(0xFF000000)),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: const Color(0xff7B6F72),
              ),
              hintText: 'Confirm Password',
              hintStyle: GoogleFonts.poppins(color: const Color(0xff7B6F72)),
              suffixIcon: IconButton(
                color: const Color(0xff7B6F72),
                splashRadius: 1,
                icon: Icon(passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
                onPressed: togglePassword,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCondtionPrivacyCheckbox() {
    return Container(
      width: double.infinity,
      child: CheckboxListTile(
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: "By creating an account, you agree to our ",
                style: TextStyle(
                  color: const Color(0xffADA4A5),
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print('Conditions of Use');
                  },
                  child: Text(
                    "Conditions of Use",
                    style: TextStyle(
                      color: const Color(0xffADA4A5),
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: " and ",
                style: TextStyle(
                  color: const Color(0xffADA4A5),
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print('Privacy Notice');
                  },
                  child: Text(
                    "Privacy Notice",
                    style: TextStyle(
                      color: const Color(0xffADA4A5),
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        activeColor: const Color(0xff7B6F72),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                Color(0xFF9DCEFF),
                Color(0XFF92A3FD),
              ],
            ),
            color: Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(99),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99.0),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(315, 60)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              // elevation: MaterialStateProperty.all(3),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrimaryQuestionsScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text('Register',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18.0,
                  )),
            ),
          ),
        ),
      ),
    );
    /*return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => print('Register Button Pressed'),
        padding: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Color(0xff92A3FD),
        child: Text('Register',
            style: GoogleFonts.poppins(
              color: Color(0xFFFFFFFF),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            )),
      ),
    );*/
  }

  Widget _buildSignUpWithText() {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
          Text(
            'OR',
            style: GoogleFonts.poppins(
              color: Color(0xff1D1617),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
        ]),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Color(0xffADA4A5)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/images/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/images/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSigninBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: GoogleFonts.poppins(
                color: Color(0xff1D1617),
                fontSize: 16.0,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: GoogleFonts.poppins(
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Color(0xffEEA4CE),
                      Color(0xffC58BF2),
                    ],
                  ).createShader(
                    const Rect.fromLTWH(
                      0.0,
                      0.0,
                      200.0,
                      70.0,
                    ),
                  ),
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hey There!',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff1D1617),
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        "Create an Account",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff1D1617),
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 35.0),
                      _buildFirstNameTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildLastNameTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildconfirmPasswordTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildCondtionPrivacyCheckbox(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildRegisterBtn(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildSignUpWithText(),
                      _buildSocialBtnRow(),
                      SizedBox(
                        height: 25.0,
                      ),
                      _buildSigninBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
