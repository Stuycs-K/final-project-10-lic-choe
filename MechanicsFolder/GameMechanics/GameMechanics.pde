int turn;
Player[] players;

void setup() {
  size(1500, 1000);
  start();
}

void start() {
  turn = 0;
  players[0] = new Player("Player One");
  players[1] = new Player("Player Two");
  while (!players[0].broke() && ! players[1].broke()) {
    players[0].takeTurn();
    players[1].takeTurn();
  }
}
void draw() {
  Map screen = new Map();
  screen.build();
  setup();
}
