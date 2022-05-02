class Orc{
  Orc({required this.id, required this.name, required this.health, required this.defense, required this.attack, required this.token});

  final int id;
  final String name;
  final int health;
  final int defense;
  final int attack;
  final String token;

  getName(){
    return name;
  }

  factory Orc.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw const FormatException("Null JSON provided");
    }
    return Orc(
        id: json["playerId"],
        name: json["playerName"],
        health: json["playerHealth"],
        defense: json["playerDefense"],
        attack: json["playerAttack"],
        token: json["playerToken"]
    );
  }
}