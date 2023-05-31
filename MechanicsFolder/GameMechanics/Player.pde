import java.util.*;


public class Player {
  private String name;
  private int bank;
  private int position;
  private ArrayList<Tiles> properties;
  private boolean bankruptcy;
  private PImage token;
  
  public Player() {
    this.name = "Player";
    this.bank = 1500;
    this.position = 0;
    this.properties = new ArrayList<>();
    this.bankruptcy = false;
  }

  public Player(String s) {
    this();
    this.name = s;
  }

  public String name() {
    return this.name;
  }
  
  void setAvatar(PImage ava){
    token = ava;
  }

  public int bank() {
    return this.bank;
  }

  public int pos() {
    return this.position;
  }
  
  public boolean broke() {
    return this.bankruptcy;
  }
  
  public ArrayList<Tiles> owned() {
    return this.properties;
  }

  public int move(int distance) {
    this.position += distance;
    this.position %= 16;
    return distance;
  }

  public void buy(Tiles t) {
    this.bank -= t.getPrice();
    if (this.bank < 0) {
      this.bankruptcy = true;
    }
    this.properties.add(t);
  }

  public void mortgage(BuyableTiles t) {
    this.properties.remove(t);
    bank += t.getPrice();
  }
  
  public int takeTurn() {
    return this.move(int(random(2, 13)));
  }
}
