class Band {

  String id;
  String name;
  int votes;


  Band({
    required this.id,
    required this.name,
    required this.votes
  }) ;

  factory Band.fromMap( Map<String, dynamic> item ) 
  => Band(
    id: item['id'],
    name: item['name'],
    votes: item['votes']
  );


}