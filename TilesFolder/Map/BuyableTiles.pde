public class BuyableTiles extends Tiles{
  private int price;
  //private Player owner;
  private boolean buyable = true;
  
  public BuyableTiles(String TName,String TType,int TPrice){
    super(TName,TType);
    //owner = TOwner;
    price = TPrice;
  }

  public int getPrice(){
    return price;
  }

  public String getName(){
    return super.getName();
  }

  public String getType(){
    return super.getType();
  }
  /*
  public static void setOwner(Player newOwn){
    owner = newOwn;
  }
  */
}
