import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/presentation/screens/main_screen/main_screen.dart';
import 'package:ticketify/presentation/widgets/loading_indicator.dart';
import '../../../../blocs/authentication/auth_bloc.dart';
import '../../../../blocs/authentication/auth_event.dart';
import '../../../../blocs/authentication/auth_state.dart';
import '../splash_screen/splash_screen.dart';

class SignIN extends StatefulWidget {
  const SignIN({super.key});

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthBloc>().add(AuthInitialRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ticketify", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255,87,33,72)),),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state){
      if (state is AuthFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              state.err.toString(),
            ),
          ),
        );
      }

      if (state is AuthSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
              (route) => false,
        );
      }
      if(state is GoogleSignInSuccess){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
              (route) => false,
        );
      }
    },
        builder: (context, state) {
          if(state is AuthLoading || state is AuthInitial || state is GoogleSignInSuccess){
            return buildLoadingIndicator();
          }
          else if(state is Unauthorised) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sign In", style: TextStyle(fontSize: 38,
                        color: Color.fromARGB(255, 251, 88, 80),
                        fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Enter your email",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.email),)
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Enter your password",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons
                              .remove_red_eye),)
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot Password?", style: TextStyle(fontSize: 16),)),
                    const SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                            AuthLoginRequested(email: emailController.text,
                                password: passwordController.text));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 87, 33, 72)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius
                                  .circular(5))),
                          minimumSize: MaterialStateProperty.all(Size(MediaQuery
                              .of(context)
                              .size
                              .width, 50))

                      ),
                      child: const Text("Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                    const SizedBox(height: 10,),
                    const Align(
                        alignment: Alignment.center,
                        child: Text("OR")),
                    const SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius
                                  .circular(5), side: const BorderSide(
                                  color: Color.fromARGB(255, 87, 33, 72)))),
                          minimumSize: MaterialStateProperty.all(Size(MediaQuery
                              .of(context)
                              .size
                              .width, 50))

                      ),
                      child: const Text("Request OTP", style: TextStyle(
                          color: Color.fromARGB(255, 87, 33, 72), fontSize: 16),),
                    ),
                    const SizedBox(height: 10,),
                    const Align(
                        alignment: Alignment.center,
                        child: Text("OR")),
                    const SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(GoogleSignInRequested());
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 87, 33, 72)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius
                                  .circular(5))),
                          minimumSize: MaterialStateProperty.all(Size(MediaQuery
                              .of(context)
                              .size
                              .width, 50))

                      ),
                      child: const Text("Sign In with Google",
                        style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                    const SizedBox(height: 30,),
                    const Align(
                        alignment: Alignment.center,
                        child: Text("Don't have an account? Sign Up",
                          style: TextStyle(fontSize: 16),)),
                  ],
                ),
              ),
            );
          }
          else if(state is SplashLoading){
            return SplashHomePage();
          }
          return const Center(child: Text("Something unexpected occurred. Please re-start the app or try clearing the cache"),);
        }
      )
    );
  }
}
