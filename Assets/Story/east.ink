==entrance==
= intro
#s_audio/ThunderRain
#v_act2/entrance
//You are at the point at which the trail from you house ends. You are completely surrounded by a surprising about of trees, a make shift sign posted infront of you seems to have strange runes scrawled over it.
You are lost and confused in the middle of this forest. You are completely surrounded by a surprising amount of trees, and you see a strange rune carved on a tree.
-> main
= main
//may just be displayed by visuals
    //+[Examine Sign]
    //The sign says "Beware the Dragon's Forest! Wander at your own risk!" and has a compass with norse runes replacing the traditional N, E, S, W.
    ->main
    +[GO NORTH] -> wood2
== wood2 ==
#v_act2/forest2
The rain is pouring hard, everything is so cold and wet.
Another carved tree catches your eye. 
-> main
= main
#CORRECT ANSWER: EAST
//CLUE: EAST
    +[GO NORTH]
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO EAST] -> wood3
    +[GO SOUTH] 
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO WEST]
    You walk on for what feels like forever... all these trees look the same.  ->entrance
    
    
    
    
== wood3 ==
#v_act2/forest3
The storm seems to be getting feircer, the lightning startles you every so often. 

You come across an oddly shaped rock with different runes carved deep into its surface. 
-> main


= main
#CORRECT ANSWER: SOUTH
//CLUE: BACK
    +[GO NORTH]
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO EAST] 
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO SOUTH]  -> wood4
    +[GO WEST]
    You walk on for what feels like forever... all these trees look the same.  
    ->entrance
    
    
    
== wood4 ==
#v_act2/forest4
The winds are cruel and endless. It makes you feel as through a huge beast was looming over you.

An extinguished campfire has more runes carved into its fire wood.

-> main


= main
#CORRECT ANSWER: EAST
//CLUE: RIGHT
    +[GO NORTH]
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO EAST] -> wood5
    +[GO SOUTH] 
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO WEST]
    You walk on for what feels like forever... all these trees look the same.  ->entrance
    
    
    
    
== wood5 ==
#v_act2/forest5
You hear flashes and roars all around you. You tremble in fear.

Runes are etched all around you, in seemingly random places. 

-> main


= main
#CORRECT ANSWER: NORTH
//CLUE: FOREWARD
    +[GO NORTH]->act2Home_outside
    +[GO EAST] 
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO SOUTH] 
    You walk on for what feels like forever... all these trees look the same. 
    ->entrance
    +[GO WEST]
    You walk on for what feels like forever... all these trees look the same.  ->entrance