import 'package:flutter/material.dart';
import 'package:flutter_vk_app/images.dart';

class FriendDetailsInfoWidget extends StatelessWidget {
  const FriendDetailsInfoWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopHatWidget(),
        SizedBox(height: 10,),
        _FriendsInfo(),
        SizedBox(height: 10,),
        _menuItems(),
      ],
    );
  }
}

class _TopHatWidget extends StatelessWidget {
  final String? backgroundUrl;
  final String? profilePhotoUrl;
  final String name;
  final String? status;

  const _TopHatWidget({super.key, this.backgroundUrl, this.profilePhotoUrl, this.name = 'Альтушка Нефорская', this.status ='хауди хо ебланчики',});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Column(
           children: [
             Container(
                width: double.infinity,
                height: 156,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: backgroundUrl != null
                        ? NetworkImage(backgroundUrl!)
                        : AssetImage(AppImages.default_background) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF19191A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                ),
                padding: EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 16),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                // Имя
                Text(
                  name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, ),
                ),
                // Статус (если он есть)
                if (status != null && status!.isNotEmpty)
                  Text(
                    status!,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: (){}, 
                          label: Text("Спороть херню", style: TextStyle(color: Colors.black),),
                          icon:  Icon(Icons.messenger_outline_rounded),
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 44,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.black,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                           ),
                           padding: EdgeInsets.zero,
                          ),
                          child: Icon(Icons.person_add_alt_1_outlined),
                        ),
                      ),
                       SizedBox(width: 10,),
                      Container(
                        width: 44,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                           padding: EdgeInsets.zero,
                          ),
                          child: Icon(Icons.more_horiz),
                        ),
                      ),
                    ],
                  )
                    ],
                  ),
                ),
              )
           ],
         ),
          // Основной контент
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Column(
              children: [
                // Аватар профиля
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: profilePhotoUrl != null
                      ? NetworkImage(profilePhotoUrl!)
                      : AssetImage(AppImages.default_avatar) as ImageProvider,
                ),
                
              ],
            ),
          ),
      ],
    );
  }
}

class _FriendsInfo extends StatelessWidget {
  const _FriendsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF19191A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "0 друзей",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "друзей нет хули, сосал?",
                style: TextStyle(color: Color(0xFF76787A)),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _menuItems extends StatefulWidget {
  const _menuItems({super.key});

  @override
  State<_menuItems> createState() => _menuItemsState();
}

bool _isSelected1 = false;
bool _isSelected2 = false;

class _menuItemsState extends State<_menuItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFF19191A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: _isSelected1 ? Colors.grey.shade800 : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
                ),
              onPressed: () {
                setState(() {
                  if (_isSelected1 == true){
                    print('открыть фото');
                  } else {
                    _isSelected1 = !_isSelected1;
                    _isSelected2 = false;
                  }
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      color: _isSelected1 ? Colors.white : Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text("Фото",
                    style: TextStyle(color: _isSelected1 ? Colors.white : Colors.grey,),),
                    ],
                  ),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: _isSelected2 ? Colors.grey.shade800 : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
                ),
              onPressed: () {
                setState(() {
                  if (_isSelected2 == true){
                    print('открыть альбом');
                  } else {
                    _isSelected2 = !_isSelected2;
                    _isSelected1 = false;
                  }
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo_camera_back_outlined,
                      color: _isSelected2 ? Colors.white : Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text("Альбом",
                    style: TextStyle(color: _isSelected2 ? Colors.white : Colors.grey,),),
                    ],
                  ),
              ),
          ],
        ),
    );
  }
}