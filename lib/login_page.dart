import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: const Color(0xFF4284DB),
      body: Stack(
        children: [

          Column(
            children: [

              // IMAGEN SUPERIOR
              Expanded(
                flex: 15,
             child: Transform.translate(
                offset: const Offset(0, 0),

                child: Container(
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/portada.jpg",
                      ),
      
                       fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              ),

              // PANEL INFERIOR
              Expanded(
                flex: 15,
  child: Transform.translate(
    offset: const Offset(0, -30),
                child: Container(
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF29EAC4),
                        Color(0xFF4284DB),
                      ],
                    ),

                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 65,
                      left: 25,
                      right: 25,
                    ),

                    child: Column(
                      children: [

                        const Text(
                          "Bienvenido a MERCA",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Compra fácil, rápido y desde donde estés.",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,

                          children: [

                            Column(
                              children: [

                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,

                                  child: IconButton(
                                    onPressed: () {},

                                    icon: const Icon(
                                      Icons.badge_outlined,
                                      size: 35,
                                      color: Color(0xFF4284DB),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                const Text(
                                  "Registrarme",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [

                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,

                                  child: IconButton(
                                    onPressed: () {},

                                    icon: const Icon(
                                      Icons.person_outline,
                                      size: 35,
                                      color: Color(0xFF4284DB),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                const Text(
                                  "Iniciar sesión",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                    const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          height: 55,

                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>const HomePage(),
                                ),
                              );
                            },

                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30),
                              ),
                            ),

                            child: const Text(
                              "Continuar como invitado",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                      ],
                    ),
                  ),
                ),
  )
              ),

            ],
          ),

          // LOGO FLOTANTE ENTRE AMBAS SECCIONES
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,

            left: 0,
            right: 0,

            child: Center(
              child: Container(
                width: 140,
                height: 140,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Image.asset(
                    "assets/iconmerca.png",
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}