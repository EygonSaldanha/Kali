import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});





  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container( width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/originals/ee/8f/b5/ee8fb5eb5fb3ab589f95db932edf1ec8.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 500),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (BuildContext context, double value, Widget? child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      if (true)
                        IconButton(
                          onPressed: () {
                            Navigator.popUntil(context, ModalRoute.withName('/search'));
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      Expanded(
                        child: TextField(
                          onChanged: (text) {
                            
                            }
                          
                          ,decoration: InputDecoration(
                            prefixIcon: true ? null : Icon(Icons.search),
                            hintText: 'Pesquisar...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}