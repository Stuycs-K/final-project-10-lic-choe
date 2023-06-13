# Work Log

## WORKING FEATURES
Backgrounds (BTS wallpapers)
Menu Screen
 - Buttons leading to each screen
Rules Screen:
 - Lists all of the rules
 - Menu button
Avatar Screen:
 - BTS character tokens
 - Avatar selection that tints the selected players
 - Circular characters using masks
 - Menu button
Game Screen
 - Monopoly board made of Tiles class with two Players
 - Display with Player names, Player balances, and Player properties
 - Tile descriptions when hovered over, shows Tile card and Tile image as the background
Working Monopoly basics
 - Rolling ('Enter')
 - Buying ('b')
 - Mortgaging ('m')
 Working Monopoly specials
 - Airplane/Airport teleportation tiles
 - Kidnapper random teleportation tile
 - Various tiles that affect money
 - Logs detailing events that happen and showing images (Rolls, special events, buying, etc.)

## BROKEN FEATURES
Game is somewhat laggy on the restart because all of the variables and shapes are being reset.
Sound library is there but not implemented at all.
## CONTENT RESOURCES
Processing References, Google Images

## CLEMENS LI

### 5/24/23

Created Player class, Removed human player class since it's useless, Need to test with Tiles

### 5/25/23

Started GameMechanics but forgot to push, Player should be .pde

### 5/26/23

Changed Map so that it's a class implemented by GameMechanics setup(), created Actions class, combined Tiles folder and GameMechanics folder, Player was also put into GameMechanics

### 5/27/23 && 5/28/23

Worked on GameMechanics.pde, start() function and turns, actions class deleted

### 5/30/23

Completely changed GameMechanics, new takeTurn() and end() functions, different draw(), keyPressed(), position keeps changing need to fix

### 6/1/23

Rent mechanic works, Map() constructor made, build() method fixed, no more duplicate buying, player names should now be color coded, pay() and add() methods added to Player, buy() method fixed, added gameOver screen and modified broke() boolean method

### 6/5/23 & 6/6/23

Forgot to push, but worked on GameMechanics and created SpecialTiles class, restart button but shifts text, keyPressed for different keys, Go mechanic works

### 6/7/23

Fixed major bugs, changed characters to Dora, SpecialTiles class will be implemented in the new BTSMap class

### 6/8/23

Hovering mechanic works (hover over a tile to see details), restart button still shifts text for some reason, Tiles now have coordinate variables, new methods displayPlayerStats() and mouseOverTile(), mortgage mechanic works now for 75% of the original cost, images can be assigned to tiles, special tiles for airplane and airport created, started to change design aspects, backgrounds also changed

### 6/9/23

Edited visuals, added all city icons for properties

### 6/10/23

The hovering mechanic should now display the tile icon as the background, special tiles have descriptions in their hover icon, tile centered, fortnite collab changed to disney collab

### 6/11/23

Avatars are now a uniform size, avatar screen is centered and all the titles are aligned, icons have blue and red tints for visibility, circular tokens using mask with a circle, characters switched to bts members, selection for avatars is shown with a tint

## ELIEZER CHO

### 5/23/23

created the Tiles class, I will make the 2 extensions of the class after. (buyable and unbuyable)

made the buyable and unbuyable classes, I have to test it with the player class later

### 5/24/23
started to transfer things over to processing, need to add map and make it show up on processing


### 5/25/23
started making map, it shows up on processing. will work on making more stuff to the map.

### 5/26/23
started adding prices to map, but there were way too many errors. have to fix these later today/tomorrow.

### 5/27/23
made change to gmaemechanics.pde, map.pde, player.pde because it caused errors and i had to fix them. I also didn't know how to change the map in an efficient way, so i just brute forced it.

### 5/30/23
I made methods to display the stats of the players, like showing their current balance, their last roll, name, and list of properties

### 5/31/23
I made it so that the rolling dice things actually works, and displays on the side. Each person has different last rolls, and i forgot about that yesterday so i had to fix.

###6/1/23
I made it so that my game finally displays teh characters, i jsut brute forced it and will need to make it better.

###6/5/23
I made multiple screens like the avatar choose screen, game screen, and the menu screen.

###6/6/23
tried to fix an erorr where it won't play the game unless i click avatars, but couldn't fix it.

###6/7/23
worked mostly on fixing errors and will go on to add more tiles later.

###6/8/23
edited the entire map, i have to add new features to it now.

###6/9/23
1 am: i added some new tiles and began to implement their effects.

###6/10/23
i added a bunch of new features for tiles, have to debug because it caused an error in showing whose turn it is and stuff.

###6/11/23
finding bugs and fixing them for today
info
