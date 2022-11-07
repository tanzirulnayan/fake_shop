import 'package:fake_shop/features/home/view/home_page.dart';
import 'package:fake_shop/features/login/bloc/login_bloc.dart';
import 'package:fake_shop/features/sign_up/view/sign_up_page.dart';
import 'package:fake_shop/helpers/constants/lottie_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.of(context).pushReplacementNamed(
                              HomePage.routeName,
                            );
                          }
                          if (state is LoginFailed) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.message,
                                  ),
                                  backgroundColor: Theme.of(context).errorColor,
                                ),
                              );
                            });
                          }
                        },
                        builder: (context, state) {
                          return Container();
                        },
                      ),
                      Container(
                        color: Theme.of(context).primaryColor,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                24,
                                40,
                                24,
                                24,
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Lottie.asset(
                                    LottieAsset.shoppingCart,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(
                                'FAKE SHOP',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text(
                              'Please log in to your registered account',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(32),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(),
                          ),
                          Flexible(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Username',
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  labelText: 'Username',
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  contentPadding: const EdgeInsets.all(18),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: const Icon(Icons.person_outlined),
                                  filled: true,
                                  fillColor: Theme.of(context).cardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'Required';
                                  }
                                  return null;
                                },
                                controller: userNameController,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(),
                          ),
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(18),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Password',
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                labelText: 'Password',
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                ),
                                filled: true,
                                fillColor: Theme.of(context).cardColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                              controller: passwordController,
                            ),
                          ),
                          Flexible(
                            child: Container(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(),
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              height: 46,
                              width: double.maxFinite,
                              margin: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context).add(
                                      LoginButtonOnpress(
                                        userName: userNameController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).secondaryHeaderColor,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                    ),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.login_rounded,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(SignUpPage.routeName),
                  child: const Text("Don't have an account? Sign up here."),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
