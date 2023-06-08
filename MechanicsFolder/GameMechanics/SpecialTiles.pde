public class SpecialTiles extends UnbuyableTiles {
  int deck;
  boolean tp;
  public SpecialTiles(String TName,String TType){
    super(TName,TType);
    if (TName.equals("Chance")) {
      this.deck = 0;
      this.tp = false;
    }
    else if (TName.equals("Community Chest")){
      this.deck = 1;
      this.tp = false;
    }
    else if (TName.equals("Portal")) {
      this.deck = -1;
      this.tp = true;
    }
  }
}
