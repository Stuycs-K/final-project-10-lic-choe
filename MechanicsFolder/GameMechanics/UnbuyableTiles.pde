public class UnbuyableTiles extends Tiles{
  boolean owned = false;
  public UnbuyableTiles(String TName,String TType,int r1, int g1, int b1){
    super(TName,TType,r1,g1,b1);
  }
    public UnbuyableTiles(String TName,String TType,int r1, int g1, int b1, PImage image){
    super(TName,TType,r1,g1,b1,image);
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
   private Player owner;
   
    void setOwner(Player player){
    owner = player;
    }
    public String getOwner(){
    return owner.name();
    }
 
  
}
