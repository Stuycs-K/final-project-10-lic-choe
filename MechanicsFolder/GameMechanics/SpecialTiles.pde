public class SpecialTiles extends UnbuyableTiles {
  int deck;
  public SpecialTiles(String TName,String TType){
    super(TName,TType);
    if (TName.equals("Chance")) {
      deck = 0;
    }
    else {
      deck = 1;
    }
  }
}
