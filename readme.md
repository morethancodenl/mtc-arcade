WIP:
- Locales
- Token Item
- Token Price
- Zones waar je een item kan kopen (OX menu met informatie over de prijs en waar je aantal tokens kan instellen en dan koop knop.)
- Controle of je een token hebt om een spel te spelen.
- In kunnen stellen bij normale spellen hoeveel tokens het kost.
- In kunnen stellen bij hacks hoeveel tokens het kost.
- Wanner iemand niet beschikt over een token bij de game melding in de zin van "Je hebt X token(s) nodig om dit spel te kunnen spelen" (in locales).


# Arcade
This resource enhances the Arcade experience within the QBCore and Qbox Framework environments.

## 🔌 Installation
To get started with the MTC Polaroid resource, follow these steps:

1. Clone this repository and place the files into your designated resources folder.
2. Rename the script file to ```mtc-arcade``.
3. Configure you're location settings in ```shared/sh_main.lua```.
3. Set up the necessary inventory items.

## 🏠 MLO's
The Arcade is compatible with a wide range of MLO's for your FiveM experience. One such MLO option is the Arcade MLO developed by Gabz. However, we recommend using the Arcade Bar MLO created by [Kiiya](https://www.gta5-mods.com/maps/arcade-bar-interior-mlo-fivem-sp). The location for that map in the game is: `vector3(-1286.24, -302.04, 36.03)`

## 📦 Items
You can find the images for the items mentioned below in the ```images``` directory.
```LUA
['gametoken'] = {
    ['name'] = 'gametoken',
    ['label'] = 'Game Token',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'gametoken.png',
    ['unique'] = false,
    ['useable'] = false,
    ['shouldClose'] = false,
    ['combinable'] = nil,
    ['description'] = 'Om een spelletje mee te spelen in de Arcade.'
},
```