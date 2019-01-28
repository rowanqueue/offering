== entrance ==
#v_clearScreen
#s_audio/ThunderRain
#s_audio/SpoopyPiano_m
#v_act2/entrance
:player:"Kari!": 
Alex desperately called for Kari, but heard no response. She was completely lost. Thunder crashed up above while the rain seeped through her shoes. Alex wandered around confused and hopeless, Occationally she would cry out for her cousin, fruitlessly. 
-> main
= main
:player:"Kaaarrriiii!": 
//may just be displayed by visuals
    //+[Examine Sign]
    //The sign says "Beware the Dragon's Forest! Wander at your own risk!" and has a compass with norse runes replacing the traditional N, E, S, W.
    //->main
    +^G:H,5:7 ^[Alex wanders north] -> wood2
== wood2 ==
#v_act2/forest2
#s_audio/FootStep(Outside)_s
Alex's tears stung from the cold. She noticed some strange runes but was to exausted and scared to care. -> main
= main
#CORRECT ANSWER: EAST
//CLUE: EAST
    +^G:H,6:7 ^[GO NORTH]Alex walked on for what felt like forever... 
        ~Stamina -= 5
        ->entrance
    +^I:J,7:8 ^[GO EAST] -> wood3
    +^G:H,9:10 ^[GO SOUTH] Alex walked on for what felt like forever...
        ~Stamina -= 5
        ->entrance
== wood3 ==
#v_act2/forest3
#s_audio/FootStep(Outside)_s
The storm brooded directly over Alex, as if it was conspiring against her. It roared and growled, pushed and pulled at her, but she pushed on. -> main
= main
#CORRECT ANSWER: SOUTH
//CLUE: BACK
    +^G:H,5:7^[GO NORTH]
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    +^I:J,7:8^[GO EAST] 
   Alex walked on for what felt like forever... 
        ~Stamina -= 5
    ->entrance
    +^G:H,9:10^[GO SOUTH]  -> wood4
    +^A:B,6:7 ^[GO WEST]
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    
    
    
== wood4 ==
#v_act2/forest4
#s_audio/FootStep(Outside)_s
The winds were cruel and endless. Every rock or bushed looked like Kari from a distance, Alex would run after them only to be met with dispair. Everytime Alex would stop and try to piece together her surroundings. The thought of never making it home dug at her from the back of her mind. -> main
= main
#CORRECT ANSWER: EAST
//CLUE: RIGHT
    +^G:H,6:7^[GO NORTH]
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    +^I:J,6:8^[GO EAST] -> wood5
    +^G:H,9:10^[GO SOUTH] 
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    +^A:B,6:7^[GO WEST]
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    
    
    
    
== wood5 ==
#v_act2/forest5
#s_audio/FootStep(Outside)_s
Alex stumbled, her feet in pain from the cold, the walking, the guilt. Perhaps two kids would be found missing this night. She tried to push on but then everything would weigh on her. She trudged on, delerious.-> main
= main
#CORRECT ANSWER: NORTH
//CLUE: FOREWARD
    +^G:H,5:7^[GO NORTH]->act2Home_outside
    +^I:J,6:8^[GO EAST] 
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    +^G:H,9:10^[GO SOUTH] 
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance
    +^A:B,6:7^[GO WEST]
    Alex walked on for what felt like forever...
        ~Stamina -= 5
    ->entrance