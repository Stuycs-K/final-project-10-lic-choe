import java.util.*;


public class Player {
  private String name;
  private int bank;
  private int position;
  private ArrayList<Tiles> properties;
  private boolean bankruptcy;
  private color pColor;
  private String pfp;
  private PImage pfpimg;
  private boolean hasPfp = false;

  public Player() {
    this.name = "Player";
    this.bank = 1500;
    this.position = 0;
    this.properties = new ArrayList<>();
    this.bankruptcy = false;
  }
  
  public boolean ownsPfp(){
    return hasPfp;
  }
  public Player(String s) {
    this();
    this.name = s;
  }
  public Player(String s, String profile, PImage profileimg) {
    this();
    this.name = s;
    this.pfp = profile;
    this.pfpimg = profileimg;
  }
  
  void setPfp(String profile, PImage profileimg){
    this.pfp= profile;
    this.pfpimg = profileimg;
    this.hasPfp = true;
  }
  
  public String getPfp(){
    return this.pfp;
  }
  
  public PImage getPfpimg() {
    return this.pfpimg;
  }
  
  public String name() {
    return this.name;
  }
  void setOwned(){
  }
  void setColor(color col){
    pColor =col;
  }
  public color getColor(){
    return this.pColor;
  }
  public int bank() {
    return this.bank;
  }

  public int pos() {
    return this.position;
  }
  
  public boolean broke() {
    return this.bank < 0;
  }
  
  public ArrayList<Tiles> owned() {
    return this.properties;
  }

  public int move(int distance) { 
    this.position += distance;
    this.position %= 40;
    return distance;
  }
  
  public void pay(int amount) {
    this.bank-=amount;
  }
  public void add(int amount) {
    this.bank+=amount;
  }

  public void buy(Tiles t) {
    if (this.bank - t.getPrice() > 0) {
      this.bank -= t.getPrice();
      this.properties.add(t);
      t.bought();
    }
    else {
      println("TOO BROKE!");
    }
  }

  public void mortgage(BuyableTiles t) {
    this.properties.remove(t);
    bank += t.getPrice();
    t.sold();
  }
  
  public int takeTurn() {
    return this.move(int(random(2, 13)));
  }
}
