import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vk_app/Theme/app_colors.dart';
import 'package:flutter_vk_app/images.dart';

class Friend {
  final int id;
  final String imageName;
  final String name;
  final String surname;

  Friend({
    required this.id,
    required this.imageName,
    required this.name, 
    required this.surname
    });
}


class FriendListWidget extends StatefulWidget {

  FriendListWidget({super.key});

  @override
  State<FriendListWidget> createState() => _FriendListWidgetState();
}

class _FriendListWidgetState extends State<FriendListWidget> {
  final _friends = [
    Friend(
      id: 1,
      imageName:AppImages.krasavchik, 
      name: 'Васян',
      surname: 'Эгегейчиков',
    ),
    Friend(
      id: 2,
      imageName:AppImages.krasavchik, 
      name: 'Пупся',
      surname: 'Пупсиков',
    ),
    Friend(
      id: 3,
      imageName:AppImages.krasavchik, 
      name: 'Чмоня',
      surname: 'Петухов',
    ),
    Friend(
      id: 4,
      imageName:AppImages.krasavchik, 
      name: 'Нуб',
      surname: 'Нубятский',
    ),
    Friend(
      id: 5,
      imageName:AppImages.krasavchik, 
      name: 'Хуй',
      surname: 'Вонючий',
    ),
    Friend(
      id: 6,
      imageName:AppImages.krasavchik, 
      name: 'Артур',
      surname: 'Лампоёбов',
    ),
    
  ];

var _filteredFriends = <Friend>[];

  final _searchController = TextEditingController();

  void _searchFriends() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredFriends = _friends.where((Friend friend){
        final fullname = friend.name.toLowerCase() + friend.surname.toLowerCase();
       return fullname.contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredFriends = _friends;
    }
    setState(() {
      
    });
  }
  
  void _onFriendTap(int index){
    final id =_friends[index].id;
    Navigator.of(context).pushNamed('/main_screen/friend_details', arguments: id,);
  }

  @override
  void initState() {
    super.initState();
    _filteredFriends = _friends;
    _searchController.addListener(_searchFriends);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredFriends.length,
            itemExtent: 56,
            itemBuilder: (BuildContext context, int index) {
              final friend = _filteredFriends[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                child: GestureDetector(
                  onTap: () => _onFriendTap(index),
                  child: Row(
                    children: [
                      CircleAvatar(
                         backgroundImage: AssetImage(friend.imageName),
                      ),
                      const SizedBox(
                          width: 12,
                        ),
                      Expanded(
                        child: Text(
                          '${friend.name} ${friend.surname}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 16, 
                            color: Colors.white
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(onPressed: (){print('кнопочка');}, icon: const Icon(Icons.chat_bubble_outline_rounded)),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8, left: 16, right: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Введите имя и фамилию',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                filled: true,
                fillColor: const Color.fromARGB(255, 102, 101, 101).withAlpha(235),//какой тут цвет я всё продал
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}