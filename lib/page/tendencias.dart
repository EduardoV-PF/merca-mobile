import 'package:flutter/material.dart';
import '../widgets/tendencias_cards.dart';

class Tendencias extends StatelessWidget {

  const Tendencias({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: SingleChildScrollView(

        child: Column(

          children: [


//banner o panle superior 
       Container(
        height: 180,
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
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
      
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
      
          child: Row(
            children: [
      
              const Expanded(
                child: Text(
                  "Tendencias",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/tendenbens.png",
                  height: 190,
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),

       //imagen inferior enorme
       Container(
         margin: const EdgeInsets.all(20),
       
         height: 350,
       
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25),
       
           image: const DecorationImage(
             image: AssetImage(
               "assets/galeriamamerca.jpg",
             ),
             fit: BoxFit.cover,
           ),
         ),
       
         child: Container(
           padding: const EdgeInsets.all(25),
       
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(25),
       
             color: Colors.black.withOpacity(0.35),
           ),
       
           child: const Align(
             alignment: Alignment.centerLeft,
       
             child: Text(
               "Supermercados Merca\nAhora Realiza tus\nCompras donde estes.....",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 28,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
         ),
       ),

    //scroll de beneficios 
      SizedBox(
        height: 220,
      
        child: ListView(
          scrollDirection: Axis.horizontal,
      
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
      
          children: const [
      
            TendenciaCard(
              imagen: "assets/banner/ban1.jpg",
              titulo: "Beneficios Merca",
              descripcion:
                  "Obtén promociones exclusivas.",
            ),
      
            TendenciaCard(
              imagen: "assets/banner/ban2.jpg",
              titulo: "Descuentos",
              descripcion:
                  "Ahorra más en tus compras.",
            ),
      
            TendenciaCard(
              imagen: "assets/banner/ban3.jpg",
              titulo: "Ofertas",
              descripcion:
                  "Promociones especiales cada día.",
            ),
      
            TendenciaCard(
              imagen: "assets/banner/ban4.jpg",
              titulo: "Programa Merca",
              descripcion:
                  "Beneficios exclusivos para miembros.",
            ),
      
          ],
        ),
      ),




          Container(
            margin: const EdgeInsets.all(20),
          
            padding: const EdgeInsets.all(20),
          
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
          
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF29EAC4),
                  Color(0xFF4284DB),
                ],
              ),
            ),
          
            child: Column(
              children: [
          
                const Text(
                  "Beneficios Merca",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                const SizedBox(height: 25),
          
                beneficioItem(
                  "assets/iconmerca.png",
                  "COMPRA",
                  "Tus productos favoritos en un solo lugar.",
                ),
          
                const SizedBox(height: 20),
          
                beneficioItem(
                  "assets/iconmerca.png",
                  "DISFRUTA",
                  "Accede a promociones y descuentos exclusivos.",
                ),
          
                const SizedBox(height: 20),
          
                beneficioItem(
                  "assets/iconmerca.png",
                  "AHORRA",
                  "Obtén mejores precios y beneficios especiales.",
                ),
          
                const SizedBox(height: 30),
          
                Container(
                  height: 220,
                  width: double.infinity,
          
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
          
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/good.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
          
                  child: Container(
                    padding: const EdgeInsets.all(20),
          
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
          
                      color: Colors.black.withOpacity(0.35),
                    ),
          
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
          
                      children: [
          
                        const Text(
                          "¡AFÍLIATE YA!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
          
                        const SizedBox(height: 15),
          
                        SizedBox(
                          width: double.infinity,
          
                          child: ElevatedButton(
                            onPressed: () {},
          
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
          
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
          
                            child: const Text(
                              "Afiliarme",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
          
                      ],
                    ),
                  ),
                ),
          
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}


// lista de beneficios 
Widget beneficioItem(
  String imagen,
  String titulo,
  String descripcion,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      CircleAvatar(
        radius: 32,
        backgroundColor: Colors.white,

        child: Image.asset(
          imagen,
          width: 40,
        ),
      ),

      const SizedBox(width: 15),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              descripcion,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),

          ],
        ),
      ),

    ],
  );
}