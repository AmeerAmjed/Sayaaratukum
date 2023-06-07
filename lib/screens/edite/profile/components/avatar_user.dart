import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({
    Key? key,
    this.onTap,
    required this.path,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 48.0,
                    backgroundColor: const Color(0xffd4d4d4),
                    backgroundImage: path != "" ? FileImage(File(path)) : null,
                    child: onTap != null
                        ? const Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 11,
                              child: Icon(
                                Icons.camera_alt,
                                size: 15.0,
                                color: Color(0xFF404040),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            if (true)
              const Align(
                alignment: Alignment.center,
                child: Icon(
                  CupertinoIcons.person_alt,
                  size: 70,
                  color: Color(0xff686868),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
