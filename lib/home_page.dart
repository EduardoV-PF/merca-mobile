import 'package:flutter/material.dart';

import 'page/inicio.dart';
import 'page/ofertas.dart';
import 'page/tendencias.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  
    paginas = [
  
      InicioPage(
        cambiarPagina: (index) {
    
          setState(() {
            selectedIndex = index;
          });
        },
      ),
  
      const OfertasPage(),
  
      const Tendencias(),
  
    ];
  }

  late final List<Widget> paginas;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: paginas[selectedIndex],
//bottones de navigación
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        

        selectedItemColor: const Color.fromARGB(255, 
        54, 136, 244),

        unselectedItemColor: const Color.fromARGB(
          255,
          120,
          120,
          120,
        ),

        type: BottomNavigationBarType.fixed,
        onTap: (index) {
        
          // Inicio
          if(index <= 2){
            setState(() {
              selectedIndex = index;
            });
          }
        
          // Pedidos
          if(index == 3){
            mostrarLoginSheet();
          }
        
          // Cuenta
          if(index == 4){
            mostrarLoginSheet();
          }
        
        },

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Inicio",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: "Ofertas",
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/iconmerca.png",
                  width: 42,
                  height: 42,
            ),
            label: "Tendencias",
          ),
    
          BottomNavigationBarItem(
             icon: Icon(Icons.shopping_bag_outlined),
             label: "Pedidos",
           ),
         
           BottomNavigationBarItem(
             icon: Icon(Icons.person_outline),
             label: "Cuenta",
           ),

        ],
      ),
    );
  }


void mostrarLoginSheet() {
  showModalBottomSheet(
    context: context,

    isScrollControlled: true,

    backgroundColor: Colors.white,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),

    builder: (context) {

      return SizedBox(

        height: 450,

        child: Column(

          children: [

            const SizedBox(height: 15),

            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Para continuar, debes:",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,

              children: [

                Column(
                  children: [

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.person_outline,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Inicia sesión",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: const Color.fromARGB(255, 54, 184, 244),
                      child: Icon(
                        Icons.badge_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),

            Container(
              width: double.infinity,
              height: 70,
              color: const Color.fromARGB(255, 54, 174, 244),

              child: const Center(
                child: Text(
                  "Beneficios exclusivos próximamente",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}




}