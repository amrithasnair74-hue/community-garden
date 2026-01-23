import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/payementpage/payementrose.dart';
import 'package:flutter/material.dart';

class Aboutpinkrose extends StatefulWidget {
  const Aboutpinkrose({super.key});

  @override
  State<Aboutpinkrose> createState() => _AboutpinkroseState();
}

class _AboutpinkroseState extends State<Aboutpinkrose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 360,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  child: Image.asset(AppImages.redrose, fit: BoxFit.cover,height: 400,width: 350,),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rose",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "One rose says more than the dozen",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 16),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                       "The  rose is perhaps the most enduring and universal symbol of love and passion,"
                       " cherished across cultures and centuries. Its rich"
                       " vibrant hue and delicate petals evoke deep emotions, making it a timeless emblem of romance, devotion and desire.",
                        style: TextStyle(color: Colors.grey,fontSize: 16),
                      ),

                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$ 65.00",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () {
                               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Payementrose()),
                    );},

                            child: const Text(
                              "Paynow",
                              style: TextStyle(fontSize: 18,color:Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
