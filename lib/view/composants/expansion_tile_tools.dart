import 'package:flutter/material.dart';
import 'package:openclass/model/enum_type.dart';
import 'package:openclass/view/composants/list_tile_salle.dart';
import '../../model/salle.dart';

class ExpansionTileTool extends StatefulWidget {
  ExpansionTileTool({Key? key, required this.addNavigator, required this.nameCategory, required this.sallesInit, required this.index}):super(key: key);
  final Function addNavigator;
  final String nameCategory;
  final List<Salle> sallesInit;
  final int index;
  @override
  State<ExpansionTileTool> createState() => _ExpansionTileToolState();

}
class _ExpansionTileToolState extends State<ExpansionTileTool>{
  List<Widget> list_salles = [];
  @override
  initState(){
    super.initState();
    listTileMethode();
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        collapsedIconColor: Colors.white,
        collapsedTextColor: Colors.white,
        iconColor: Colors.white,
        textColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        childrenPadding: EdgeInsets.only(left: 50),
        trailing: GestureDetector(
          child: Icon(Icons.add),
          onTap: widget.addNavigator as void Function(),
        ),
        title: Text(widget.nameCategory.toString().split('.').last.toUpperCase(),style: TextStyle(fontSize: 16),),
        children: list_salles,
      );
  }
  // creation de la liste de salle
  void listTileMethode()
  {
    final iconInfo = Icon(Icons.info_outlined,);
    final iconBiblio = Icon(Icons.import_contacts);
    final iconDiscussion = Icon(Icons.screenshot_monitor);
    for(int i=0; i<widget.sallesInit.length; i++){
      final temp = ListTileSalle(
          salleInit: widget.sallesInit[i],
          leading: (widget.sallesInit[i].categorySalle.type == EnumCategorySalle.information)?iconInfo:(widget.sallesInit[i].categorySalle.type == EnumCategorySalle.bibliotheque)?iconBiblio:iconDiscussion,
      );
      list_salles.add(temp);
    }
  }

}

