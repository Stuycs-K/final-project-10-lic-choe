public class Tiles{
  private String tileType;
  private String name;

  public static void Tiles(String TName,String TType){
    tileType = TType;
    name = TName;
  }

  public String getName(){
    return name;
  }

  public String getType(){
    return tileType;
  }
  
}
