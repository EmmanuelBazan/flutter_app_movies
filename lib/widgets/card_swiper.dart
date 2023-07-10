import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.white,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detailScreen');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/image_placeholder.png'),
                  image: NetworkImage('http://via.placeholder.com/300x400')),
            ),
          );
        },
      ),
    );
  }
}
