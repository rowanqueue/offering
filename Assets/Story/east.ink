== entrance ==
#v_clearScreen
#s_audio/ThunderRain
#s_audio/SpoopyPiano_m
#v_act2/entrance
:player:"Kari!": 
You call for Kari and hear no response. You are lost and confused, surrounded by seemingly endless trees with strange runes carved into them.
-> main
= main
//may just be displayed by visuals
    //+[Examine Sign]
    //The sign says "Beware the Dragon's Forest! Wander at your own risk!" and has a compass with norse runes replacing the traditional N, E, S, W.
    //->main
    +^G:H,5:7 ^[GO NORTH] -> wood2
== wood2 ==
#v_act2/forest2
#s_audio/FootStep(Outside)_s
The rain is pouring hard, everything is so cold and wet.
Another carved tree catches your eye. -> main
= main
#CORRECT ANSWER: EAST
//CLUE: EAST
    +^G:H,6:7 ^[GO NORTH]You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
        ->entrance
    +^I:J,7:8 ^[GO EAST] -> wood3
    +^G:H,9:10 ^[GO SOUTH] You walk on for what feels like forever... all these trees look the same.  
        ~Stamina -= 5
        ->entrance
== wood3 ==
#v_act2/forest3
#s_audio/FootStep(Outside)_s
The storm seems to be getting fiercer, the lightning startles you every so often. 
You come across an oddly shaped rock with different runes carved deep into its surface. -> main
= main
#CORRECT ANSWER: SOUTH
//CLUE: BACK
    +^G:H,5:7^[GO NORTH]
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    +^I:J,7:8^[GO EAST] 
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    +^G:H,9:10^[GO SOUTH]  -> wood4
    +^A:B,6:7 ^[GO WEST]
    You walk on for what feels like forever... all these trees look the same.  
        ~Stamina -= 5
    ->entrance
    
    
    
== wood4 ==
#v_act2/forest4
#s_audio/FootStep(Outside)_s
The winds are cruel and endless. It makes you feel as through a huge beast was looming over you.
An extinguished campfire has more runes carved into its fire wood. -> main
= main
#CORRECT ANSWER: EAST
//CLUE: RIGHT
    +^G:H,6:7^[GO NORTH]
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    +^I:J,6:8^[GO EAST] -> wood5
    +^G:H,9:10^[GO SOUTH] 
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    +^A:B,6:7^[GO WEST]
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    
    
    
    
== wood5 ==
#v_act2/forest5
#s_audio/FootStep(Outside)_s
You hear flashes and roars all around you. You tremble in fear.
Runes are etched all around you, in seemingly random places. -> main
= main
#CORRECT ANSWER: NORTH
//CLUE: FOREWARD
    +^G:H,5:7^[GO NORTH]->act2Home_outside
    +^I:J,6:8^[GO EAST] 
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    +^G:H,9:10^[GO SOUTH] 
    You walk on for what feels like forever... all these trees look the same. 
        ~Stamina -= 5
    ->entrance
    +^A:B,6:7^[GO WEST]
    You walk on for what feels like forever... all these trees look the same.  
        ~Stamina -= 5
    ->entrance