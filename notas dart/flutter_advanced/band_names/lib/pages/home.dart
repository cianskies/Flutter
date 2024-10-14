import 'package:band_names/models/band.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'bmth', votes: 5),
    Band(id: '2', name: 'A day to Remember', votes: 5),
    Band(id: '3', name: 'Lorna Shore', votes: 5),
    Band(id: '4', name: 'My Chemical Romance', votes: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Band Names', style: TextStyle( color: Colors.white ), ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: ( _ , int index) => _bandTile( bands[index] )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        backgroundColor: Colors.lightBlue,
        child: const Icon( Icons.add ),
      ),
     );
  }

  Widget _bandTile( Band band ) {
    return Dismissible(
      key: Key( band.id ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        //TODO: Borrar banda
      },
      background: Container( 
        color: Colors.red, 
        alignment: Alignment.centerLeft, 
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon( Icons.delete, color: Colors.white,  ),
        ), 
      ),
      child: ListTile(
            leading: CircleAvatar(
              child: Text( band.name.substring( 0,2 ) ),
            ),
            title: Text( band.name ),
            trailing: Text( '${band.votes}', style: const TextStyle( fontSize: 20 ), ),
            onTap: (){
              //TODO: implementar ++voto
            },
          ),
    );
  }

  addNewBand(){

    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: ( context ){
        return AlertDialog(
          title: const Text( 'New band name' ),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              onPressed: (){ 
                addBandToList( textController.text );
                setState(() {});
                Navigator.pop(context); 
                
              },
              child: const Text( 'Add' ),
            )
          ],
        );
      }
    );
  }

  void addBandToList( String name ){

    if( name.isEmpty ) Navigator.pop(context);

    bands.add( Band( id: '${DateTime.now()}', name: name, votes: 0 ) );


  }
}