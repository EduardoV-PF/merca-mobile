import 'package:flutter/material.dart';

class ProductoCard extends StatelessWidget {
  final int id;
  final String nombre;
  final String marca;
  final double precio;
  final String imagen;

  const ProductoCard({
    super.key,
    required this.id,
    required this.nombre,
    required this.marca,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 320,

      child: Card(
        elevation: 3,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                height: 120,
                width: double.infinity,
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade100,
                ),
              
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
              
                  child: Image.asset(
                    imagen,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                marca,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                nombre,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                '\$${precio.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 54, 203, 244),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: const Text(
                    "Agregar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}