public Tiles[] gameMap;

void setup(){
  size (1500,1000);
  gameMap = new Tiles[12];
}

void mapSet(){
  gameMap[0] = new Tiles("Oriental Avenue", "buyable");
  gameMap[1] = new Tiles("Vermont Avenue", "buyable");
  gameMap[2] = new Tiles("Connecticut Avenue", "buyable");

}
