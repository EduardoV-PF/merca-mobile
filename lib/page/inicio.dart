import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/productoswidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



// ================================
// CONFIG API
// ================================

// Local
const String API_URL = "https://merca-api-qqzd.onrender.com";


const Map<String, String> imagenesCategorias = {
  "Carnes": "assets/categorias/carness.png",
  "Lácteos": "assets/categorias/lacteos.png",
  "Panadería": "assets/categorias/panaderia.png",
  "Bebidas": "assets/categorias/bebidas.png",
  "Frutas": "assets/categorias/frutas.png",
  "Limpieza": "assets/categorias/limpieza.png",
  "Mascotas": "assets/categorias/mascotas.png",
};

const Map<String, String> imagenesProductos = {
  "Carnes": "assets/categorias/carness.png",
  "Lácteos": "assets/categorias/lacteos.png",
  "Panadería": "assets/categorias/panaderia.png",
  "Bebidas": "assets/categorias/bebidas.png",
  "Frutas": "assets/categorias/frutas.png",
  "Limpieza": "assets/categorias/limpieza.png",
  "Mascotas": "assets/categorias/mascotas.png",
};

// Celular físico
// const String API_URL = "http://192.168.1.100:8000";

// Producción Render
// const String API_URL = "https://supermerca-api.onrender.com";



class InicioPage extends StatefulWidget{

  final Function(int)? cambiarPagina;
    const InicioPage({
    super.key,
    this.cambiarPagina,
  });
  
@override
State<InicioPage> createState() => _InicioPageState();
}
class _InicioPageState extends State<InicioPage> {

  int currentIndex = 0;
  List categorias = [];
  List productos = [];
  
  bool cargandoCategorias = true;
  bool cargandoProductos = true;

@override
void initState() {
  super.initState();

  cargarCategorias();
  cargarProductos();
}



//invocación nde datos parra panel de categorias 
Future<void> cargarCategorias() async {
  try {
    final response = await http.get(
      Uri.parse('$API_URL/categorias'),
    );

    print(response.body);

    final datos = jsonDecode(response.body);

    print(datos);

    setState(() {
      categorias = datos;
      cargandoCategorias = false;
    });

  } catch (e) {
    print(e);

    setState(() {
      cargandoCategorias = false;
    });
  }
}

//invocación de datos para panel de productos
Future<void> cargarProductos() async {
  try {
    final response = await http.get(
      Uri.parse('$API_URL/productos-destacados'),
    );

    if (response.statusCode == 200) {
      setState(() {
        productos = jsonDecode(response.body);
        cargandoProductos = false;
      });
    }
  } catch (e) {
    print('Error productos: $e');
  }
}

  
  

  @override
  Widget build(BuildContext context) {

    

    return SafeArea(

      child: SingleChildScrollView(

        child: Column(

          children: [

            const SizedBox(height: 15),

            // Buscador

            Container(
             margin: const EdgeInsets.symmetric(horizontal: 20),
             child: TextField(
               decoration: InputDecoration(
                 hintText: "¿Qué deseas buscar hoy?",
                 prefixIcon: const Icon(Icons.search),
           
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                 ),
               ),
             ),
           ),

            const SizedBox(height: 20),

            // Banner

          Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 220,
        
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
        
            child: CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                viewportFraction: 1.0,
             

             onPageChanged: (index, reason) {
             setState(() {
                  currentIndex = index;
                });
              },
              ),
        
              items: [
        
                Image.asset(
                  'assets/banner/ban4.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        
                Image.asset(
                  'assets/banner/ban2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        
                Image.asset(
                  'assets/banner/ban3.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        
                Image.asset(
                  'assets/banner/ban1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                                Image.asset(
                  'assets/galeriamamerca.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        
                Image.asset(
                  'assets/tendenbens.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        
                Image.asset(
                  'assets/good.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            7,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
        
              width: currentIndex == index ? 20 : 10,
              height: 10,
        
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? const Color.fromARGB(255, 54, 136, 244)
                    : Colors.grey,
        
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categorías",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),

          const SizedBox(height: 15),


           //categorias de base de datos 
           cargandoCategorias
               ? const Center(
                   child: CircularProgressIndicator(),
                 )
               : GridView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: categorias.length,
                   gridDelegate:
                       const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 4,
                     childAspectRatio: 0.75,
                   ),
                   itemBuilder: (context, index) {
           
                     final cat = categorias[index];
           
                     final nombre = cat["nombre"];
           
                     final imagen =
                         imagenesCategorias[nombre] ??
                         "assets/iconmerca.png";
           
                     return categoria(
                       nombre,
                       imagen,
                     );
                   },
                 ),

          //productos
           const SizedBox(height: 30),
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(
                 "Productos destacados",
                 style: TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ),
           const SizedBox(height: 15),
           
SizedBox(
  height: 320,
     child: cargandoProductos
         ? const Center(
             child: CircularProgressIndicator(),
           )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productos.length,
                itemBuilder: (context, index) {
            
                  final producto = productos[index];
            
                  final categoria = producto["categoria"];
            
                  final imagenProducto =
                      imagenesProductos[categoria] ??
                      "assets/productos/comida.jpg";
            
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: ProductoCard(
                      id: producto["id"],
            
                      nombre: producto["nombre"],
            
                      marca: producto["marca"],
            
                      precio: double.parse(
                        producto["precio"].toString(),
                      ),
            
                      imagen: imagenProducto,
                    ),
                  );
                },
              ),
         ),




//boton de opciones de ver mas ofertas
const SizedBox(height: 50),
Center(
  child: ElevatedButton(
    onPressed: () {
    widget.cambiarPagina?.call(1);

    },

    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(
        255,
        54,
        136,
        244,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 12,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),

    child: const Text(
      "Ver más",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),



//panel final de eslogan
const SizedBox(height: 30),



Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 15,
  ),

  padding: const EdgeInsets.all(15),

  decoration: BoxDecoration(
    color: Colors.blue,

    borderRadius: BorderRadius.circular(15),
  ),

  child: Row(
    children: [

      Image.asset(
        "assets/iconmerca.png",
        width: 70,
        height: 70,
      ),

      const SizedBox(width: 15),

      const Expanded(
        child: Text(
          "Supermercados Merca - Ahora Realiza tus Compras donde estes.....",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
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


// widget estilo de categorias
Widget categoria(String titulo, String imagen) {
  return Column(
    children: [
      CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(imagen),
      ),

      const SizedBox(height: 8),

      Text(
        titulo,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    ],
  );
}


