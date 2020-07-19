import 'package:doctor_app/enums/enums.dart';
import 'package:doctor_app/locator.dart';
import 'package:doctor_app/service/authentication_service.dart';
import 'package:doctor_app/ui/fonts/text_style.dart';
import 'package:doctor_app/viewmodel/loginmodel.dart';
import 'package:doctor_app/ui/helper/UIHelper.dart';
import 'package:doctor_app/ui/colors/colorsUI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {

   BaseAuth auth;
   Key key;

 // LoginView(this.key,);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginViewState();
  }

}

class _LoginViewState extends State<LoginView> {
  final _formKey = new GlobalKey<FormState>();

  String email;
  String password;
  String _errorMessage;
  bool _isLoading;
  bool _isLogged;

  @override
  void initState() {
    _isLoading = false;
    _isLogged = false;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (context, model, child) =>
            Scaffold(
              body: Container(
                color: whiteColor,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    _showForm(model),
                    _showCircularProgress(model)
                    //showSecondaryButton(),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }


  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
  }

  Widget _showForm(LoginModel model) {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              Visibility(
                child: _showLogo(),
                visible: model.state == ViewState.Idle,
              ),
              UIHelper.verticalSpaceMedium(),
              Visibility(child: _showText(),
                visible: model.state == ViewState.Idle,
              ),
              UIHelper.verticalSpaceSmall(),
              Visibility(
                child: _createAccount(context),
                visible: model.state == ViewState.Idle,
              ),
              UIHelper.verticalSpaceSmall(),
              Visibility(
                child: showEmailInput(),
                visible: model.state == ViewState.Idle,),
              UIHelper.verticalSpaceSmall(),
              Visibility(
                child: showPasswordInput(),
                visible: model.state == ViewState.Idle,),
              UIHelper.verticalSpaceSmall(),
              Visibility(
                  visible: model.state == ViewState.Idle,
                  child: showErrorMessage(model)),

              Visibility(
                  visible: model.state == ViewState.Idle,
                  child: _showForgotPassword()
              ),
              UIHelper.verticalSpaceSmall(),
              Visibility(
                child: showPrimaryButton(model),
                visible: model.state == ViewState.Idle,
              ),
          /*    UIHelper.verticalSpaceMedium(),
              Visibility(
                visible: model.state == ViewState.Idle,
                child: _signButton(model) ,
              )
*/
            ],
          ),
        ));
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) =>
        (value.isEmpty
            ? 'Email não pode ser vazio'
            : null),
        onSaved: (value) => email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Palavra Passe',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) =>
        value.isEmpty
            ? 'Palavra Passe não pode ser vazia'
            : null,
        onSaved: (value) => password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton(LoginModel model) {
    return new Padding(
        padding:EdgeInsets.all(0.0),
        child: Center(
          child: SizedBox(
            height: 40.0,
            child: new RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0)),
                color: primaryColor,
                child: new Text('Entrar',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () => validateAndSubmit(model)
            ),
          ),
        ));
  }

  // Perform login or signup
  void validateAndSubmit(LoginModel model) async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      /*_isLogged = await model.login(
          userEmail: email, userPassword: password, userIdText: "1");*/
      if ( true ) {
        Navigator.pushNamed(context, 'instruction');
      }
      else {
      }
    }
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text('Cria uma conta',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }

  Widget _showCircularProgress(LoginModel model) {
    if (model.state == ViewState.Busy) {
      return Center(
          child: CircularProgressIndicator(backgroundColor: primaryColor,));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showLogo() {
    return Container(
      height: 200.0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50.0,
          child: Image.asset('assets/logo.jpeg',),
        ),
      ),
    );
  }

  Widget _signButton(LoginModel model) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: ()  async{
//          Future<bool> signed= model.signWithGoogle().whenComplete(() => Navigator.pushNamed(context, 'homeWidget'));

      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Row(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/google_logo.png"), height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Entrar com  Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    )]
    )
    );
  }

}

Widget _showForgotPassword() {
  return Container(
    child: Align(
        alignment: Alignment.bottomRight,
        child: Text('Esqueceu a Palavra Passe?', style: normalStyle,)),
  );
}

Widget _createAccount(BuildContext context) {
  return Container(
      child: Row(
        children: <Widget>[
          Text('Não tem uma conta?', style: normalStyle,),
          GestureDetector(
            child: Text('Criar uma conta.', style: warningStyle,),
            onTap: () => Navigator.pushNamed(context, 'switchUser'),
          ),
        ],
      )
  );
}

Widget showErrorMessage(LoginModel model) {
  return model.errorMessage == null ? Container(width: 0.0, height: 0.0,) :
  Container(
    child: Text('${model.errorMessage}', style: warningStyle,),
  );
}

Widget _showText() {
  return Container(
    child: Text('Login', style: headerStyleWithColorPropriety,),
  );
}