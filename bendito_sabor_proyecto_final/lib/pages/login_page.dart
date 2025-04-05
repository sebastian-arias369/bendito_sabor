import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffFAF1E6),
              Color(0xffEFF3EA),
              Color(0xffFFFDF0),
              Color(0xffFFFDF0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
           Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            ),
           image: const DecorationImage(
              image: AssetImage('assets/images/benditosabor.jpg'),
              fit: BoxFit.cover,
              ),
            ),
          ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Iniciar Sesión",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField("Ingresar el correo", Icons.email),
                      const SizedBox(height: 15),
                      _buildTextField("Ingresar la contraseña", Icons.lock, isPassword: true),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(-5, 0), // Mueve "Recordar Contraseña" a la izquierda
                            child: Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                ),
                                const Text("Recordar Contraseña"),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Transform.translate(
                            offset: const Offset(-15, 0), // Mueve "Has olvidado tu contraseña?" a la izquierda
                            child: InkWell(
                              onTap: () {
                                // Acción cuando se toca el texto
                              },
                              
                              child: const Text(
                                "Has olvidado tu\ncontraseña?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 7, 207, 14),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿Aún no tienes cuenta?"),
                          InkWell(
                            onTap: (
                            ) {
                              // Acción cuando se toca "Regístrate Aquí"
                              Navigator.push(
                                context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                                );
                        
                            },
                            child: const Text(
                              " Regístrate Aquí",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: Icon(icon, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
