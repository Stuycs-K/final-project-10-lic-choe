public class UnbuyableTiles extends Tiles{
  boolean owned = false;
  public UnbuyableTiles(String TName,String TType){
    super(TName,TType);
  }

  public String getName(){
    return super.getName();
  }

  public String getType(){
    return super.getType()
    ;
  }
  
  public int getPrice(){
    return 1000000;  
  }
 
  
}
