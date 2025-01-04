import 'package:flutter/material.dart';
import 'package:flutter_vk_app/widgets/friend_details/friend_details_info_widget.dart';
import 'package:flutter_vk_app/widgets/friend_details/friend_details_photo_widget.dart';

class FriendDetailsWidget extends StatefulWidget {
  final int friendId;
  

  const FriendDetailsWidget({
    super.key,
    required this.friendId,
    });

  @override
  State<FriendDetailsWidget> createState() => _FriendDetailsWidgetState();
}

class _FriendDetailsWidgetState extends State<FriendDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ColoredBox(
        color: Colors.black,
        child: Stack(
          children: [
            
            ListView(
              children: [
                FriendDetailsInfoWidget(),
                FriendDetailsPhotoWidget(),
              ],
            ),
            _appBarButton(),
          ],
        ),
      ),
    );
  }
}

class _appBarButton extends StatelessWidget {
  const _appBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
            top: 10,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
  }
}
