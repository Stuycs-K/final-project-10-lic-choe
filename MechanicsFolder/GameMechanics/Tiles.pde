  public class Tiles{
    private String tileType;
    private String name;
    private int price;
    private boolean owned;
    private PImage img;
    float startx, starty, endx, endy;
    int r,g,b;
    
  
    public Tiles(String TName,String TType,int r1, int g1, int b1){
      tileType = TType;
      name = TName;
      r = r1;
      g = g1;
      b = b1;
    }
    public int tileColor(){
      return color(r,g,b);
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
    
    public PImage tilePfp() {
      return img;
    }
  }
<<<<<<< HEAD
=======
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
  public void sold() {
    owned = false;
  }
  
  public PImage tilePfp() {
    return img;
  }
}
>>>>>>> 26b87047b44dcee23b187c07d4c33c91fbbc0214
