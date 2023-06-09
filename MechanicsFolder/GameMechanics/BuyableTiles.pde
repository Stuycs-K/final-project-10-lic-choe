public class BuyableTiles extends Tiles{
  private int price;
  //private Player owner;

  
  
  public BuyableTiles(String TName,String TType,int TPrice,int r1, int g1, int b1){
    super(TName,TType,r1,g1,b1);
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
 
  
}
