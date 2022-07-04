import 'package:flutter/material.dart';
import '../../model/classroom.dart';
import '../constante.dart';
import '../screens/interface_user_screens/classroom_interfaces/classroom_setting_sheet/classroom_setting_sheet_page.dart';
import 'invite_button.dart';

class DrawerHeaderTools extends StatelessWidget
{
  DrawerHeaderTools({Key? key, required this.nameClasse, required this.classroom}):super(key: key);
  final String nameClasse;
  final Classroom classroom;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(nameClasse,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
              GestureDetector(
                child: Icon(Icons.more_horiz,color: Colors.white,),
                onTap: (){
                  _showClassroomSettingSheet(context, classroom);
                },
              ),
            ],
          ),
          SizedBox(height: 50,),
          InviteButton(),
        ],
      ),
    );
  }

  void _showClassroomSettingSheet(BuildContext context, Classroom classroom)
  {
    Navigator.pop(context);
    showModalBottomSheet(
      backgroundColor: kColorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return ClassroomSettingSheetPage(classroom: classroom);
        }
    );
  }
}