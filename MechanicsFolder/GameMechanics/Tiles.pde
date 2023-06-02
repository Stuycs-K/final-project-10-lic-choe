public class Tiles{
  private String tileType;
  private String name;
  private int price;
   private boolean owned;

  public Tiles(String TName,String TType){
    tileType = TType;
    name = TName;
  }

  public String getName(){
    return name;
  }

  public String getType(){
    return tileType;
  }
  
  public int getPrice(){
  return price;
  }
   public boolean isOwned() {
        return owned;
    }

    
}
