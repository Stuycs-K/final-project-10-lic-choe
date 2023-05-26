public class Tiles{
  private String tileType;
  private String name;
  private int price;


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

}
