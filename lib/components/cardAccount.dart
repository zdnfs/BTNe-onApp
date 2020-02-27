import 'package:flutter/material.dart';

class CardAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListTile(
        title: Text(
          'User Name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://cdn130.picsart.com/271718769021211.png?r1024x1024"
              )
            )
          ),
        ),

//        subtitle: Row(
//          children: <Widget>[
//            RaisedButton.icon(
//              icon: Icon(Icons.album, color: Colors.blue,),
//              label: Text('666 Poin'),
//              onPressed: (){},
//              color: Colors.grey[200],
//              elevation: 0.0,
//              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//            ),
//            Padding(padding: EdgeInsets.all(8.0),),
//            RaisedButton(
//              child: Text('Traveloka Pay'),
//              onPressed: (){},
//              color: Colors.grey[200],
//              elevation: 0.0,
//              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//            )
//          ],
//        ),
      ),
    );
  }
}