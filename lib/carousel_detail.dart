import 'package:aplika_si/Model/Event.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Event carouselItem;

  const DetailPage(this.carouselItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACCFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF241F7B),
        title: Center(
          child: Image.asset(
            "assets/images/logo.png",
            width: 42,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              Text(
                carouselItem.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Open Recruitment',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/HomeBackground.png",
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                carouselItem.desc.substring(1, 200),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                carouselItem.desc,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
