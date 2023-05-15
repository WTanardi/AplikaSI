import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final List<String> carouselItem;

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
              SizedBox(height: 12.0),
              Text(
                carouselItem[1],
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                carouselItem[2],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  carouselItem[0],
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin commodo erat eleifend, mollis magna ut, fringilla arcu. Fusce egestas elit id erat tempor.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin commodo erat eleifend, mollis magna ut, fringilla arcu. Fusce egestas elit id erat tempor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin commodo erat eleifend, mollis magna ut, fringilla arcu. Fusce egestas elit id erat tempor.",
                style: TextStyle(
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
