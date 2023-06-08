public class Tiles{
  private String tileType;
  private String name;
  private int price;
  private boolean owned;
  float startx, starty, endx, endy;

  public Tiles(String TName,String TType){
    tileType = TType;
    name = TName;
  }

  public String getName() {
    return name;
  }

  public String getType() {
    return tileType;
  }
  
  public void setCoords(int startx, int starty, int endx, int endy) {
    this.startx = startx;
    this.starty = starty;
    this.endx = endx;
    this.endy = endy;
  }
  
  public float getStartX() {
    return startx;
  }
  public float getStartY() {
    return starty;
  }
  public float getEndX() {
    return endx;
  }
  public float getEndY() {
    return endy;
  }
  
  public int getPrice() {
    return price;
  }
  public boolean isOwned() {
    return owned;
  }
  public void bought() {
    owned = true;
  }    
}
