import java.util.*;


public class Player {
  private String name;
  private int bank;
  private int position;
  private ArrayList<Tiles> properties;
  private boolean bankruptcy;
  
  public Player() {
    this.name = "Player";
    this.bank = 1500;
    this.position = 0;
    this.properties = new ArrayList<Tiles>();
    this.bankruptcy = false;
  }

  public Player(String s) {
    Player newPlayer = new Player();
    newPlayer.name = s;
  }

  public String name() {
    return this.name;
  }

  public int bank() {
    return this.bank;
  }

  public int pos() {
    return this.position;
  }

  public ArrayList<Tiles> owned() {
    return this.properties;
  }

  public void move(int distance, int tileCount) {
    this.position += distance;
    this.position %= tileCount;
  }

  public void payMoney(int amt) {
    this.bank -= amt;
    if (this.bank < 0) {
      this.bankruptcy = true;
    }
  }

  public void mortgage(BuyableTiles t) {
    this.properties.remove(t);
    bank += t.getPrice();
  }
}
