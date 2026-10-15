import 'package:flutter/material.dart';
import '../widgets/productoswidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Local
const String API_URL = "https://merca-api-qqzd.onrender.com";

const Map<String, String> imagenesProductos = {
  "Carnes": "assets/categorias/carness.png",
  "Lácteos": "assets/categorias/lacteos.png",
  "Panadería": "assets/categorias/panaderia.png",
  "Bebidas": "assets/categorias/bebidas.png",
  "Frutas": "assets/categorias/frutas.png",
  "Limpieza": "assets/categorias/limpieza.png",
  "Mascotas": "assets/categorias/mascotas.png",
};

class OfertasPage extends StatefulWidget {
  const OfertasPage({super.key});

  @override
  State<OfertasPage> createState() => _OfertasPageState();
}

class _OfertasPageState extends State<OfertasPage> {

  List productos = [];

  bool cargando = true;

  @override
  void initState() {
    super.initState();
    cargarProductos();
  }

  Future<void> cargarProductos() async {
    try {

      final response = await http.get(
        Uri.parse('$API_URL/productos'),
      );

      if (response.statusCode == 200) {

        setState(() {
          productos = jsonDecode(response.body);
          cargando = false;
        });

      }

    } catch (e) {

      print("Error productos: $e");

      setState(() {
        cargando = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            // Banner superior
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
                padding: const EdgeInsets.all(25),

                child: Row(
                  children: [

                    const Expanded(
                      flex: 4,

                      child: Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          "Los más Cotizado",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,

                      child: Image.asset(
                        "assets/OFERTASSS.png",
                        height: 190,
                        fit: BoxFit.contain,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            // Buscador
            Container(
              margin: const EdgeInsets.all(15),

              child: TextField(
                decoration: InputDecoration(
                  hintText: "¿Qué deseas buscar hoy?",

                  prefixIcon: const Icon(
                    Icons.search,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            // Filtros
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              child: Row(
                children: [

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},

                      icon: const Icon(Icons.tune),

                      label: const Text(
                        "Filtrar y ordenar",
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),

                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.arrow_upward,
                      ),
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16),

              child: cargando
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(

                      shrinkWrap: true,

                      physics:
                          const NeverScrollableScrollPhysics(),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),

                      itemCount: productos.length,

                      itemBuilder: (context, index) {

                        final producto =
                            productos[index];

                        final categoria =
                            producto["categoria"];

                        final imagenProducto =
                            imagenesProductos[categoria] ??
                            "assets/productos/comida.jpg";

                        return ProductoCard(
                          id: producto["id"],

                          nombre:
                              producto["nombre"],

                          marca:
                              producto["marca"],

                          precio: double.parse(
                            producto["precio"]
                                .toString(),
                          ),

                          imagen:
                              imagenProducto,
                        );
                      },
                    ),
            ),

          ],
        ),
      ),
    );
  }
}