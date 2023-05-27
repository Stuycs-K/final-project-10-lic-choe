public class UnbuyableTiles extends Tiles{
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
    return 10000;  
  }
  
}
