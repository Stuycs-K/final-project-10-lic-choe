public class BuyableTiles extends Tiles{
  private int price;
  private Player owner;
  private boolean buyable = true;

  public static void Tiles(String TName,String TType, Player TOwner, int TPrice){
    super.Tiles(TName,TType);
    owner = TOwner;
    price = TPrice;
  }

  public int getPrice(){
    return price;
  }

  public String getName(){
    return name;
  }

  public String getType(){
    return type;
  }

  public static void setOwner(Player newOwn){
    owner = newOwn;
  }
}
