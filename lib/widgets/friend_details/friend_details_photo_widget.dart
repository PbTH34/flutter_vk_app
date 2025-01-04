import 'package:flutter/material.dart';
import 'package:flutter_vk_app/images.dart';

class FriendDetailsPhotoWidget extends StatelessWidget {
  const FriendDetailsPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF19191A),
      padding: EdgeInsets.only(top: 8, left: 17, right: 17, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 119,
            child: ListView.builder(
              itemCount: 20,
              itemExtent: 119,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: (){
                    print('открыть фото $index');
                  },
                  child: Image(image: AssetImage(AppImages.chert),)
                ),
              );
            },),
          ),
          SizedBox(height: 8,),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: (){}, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Показать всё',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 2,),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}