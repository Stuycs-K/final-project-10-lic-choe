public class SpecialTiles extends UnbuyableTiles {
  int deck;
  public SpecialTiles(String TName,String TType,int r1,int r2,int r3,PImage image){
    super(TName,TType,r1,r2,r3,image);
    if (TType.equals("Chance")) {
      this.deck = 0;
    }
    else if (TType.equals("Community Chest")){
      this.deck = 1;
    }
    else if (TType.equals("Airplane") && TType.equals("Airport")) {
      this.deck = -1;
    }
  }
}
