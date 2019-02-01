==eaststart==
#v_clearScreen
#s_act2/Audio/ThunderRain
#s_act2/Audio/SpoopyPiano_m
#v_act2/east1
{followedKari:
:player:"Kari!": Alex desperately called for Kari, but heard no response. <>
#v_enter_act2/east1KariFade
} 
She was completely lost. Thunder crashed above her while the rain seeped through her shoes. Alex wandered around confused and hopeless, Occationally she would cry out for her cousin, fruitlessly. -> entrance
== entrance ==
-> main
//THROW IN A HELP THING HERE CALL PARKER SEE IF HE CAN HELP THE PLAYER HERE
//uSE ALTERNATIVES FOR WHEN YOU MAKE A MISTAKE
= main
{followedKari:
:player:"Kaaarrriiii!":
}
//may just be displayed by visuals
    //+[Examine Sign]
    //The sign says "Beware the Dragon's Forest! Wander at your own risk!" and has a compass with norse runes replacing the traditional N, E, S, W.
    //->main
    +^G:H,5:7 ^[Alex wandered north] -> wood2
== lost ==
~Stamina -= 5
{Alex walked on for what felt like forever...|Every hill looked the same to Alex. before she knew it, she was back where she started.|Alex ignored the signs, the storm was getting to her.|Alex ignored the signs, the storm was getting to her.|Alex ignored the signs, the storm was getting to her.| Alex trips over the stones meant to guide her, when she gets up she finds her self back where she started. }
-> entrance
== wood2 ==
#v_act2/east2
#s_audio/FootStep(Outside)_s
Alex's tears stung from the cold. She noticed some strange runes but was too exhausted and scared to care. -> main
= main
#CORRECT ANSWER: EAST
//CLUE: EAST
    +^G:H,6:7 ^[GO NORTH]->lost
    +^I:J,7:8 ^[GO EAST] -> wood3
    +^G:H,9:10 ^[GO SOUTH]->lost
== wood3 ==
#v_act2/east3
#s_audio/FootStep(Outside)_s
The storm brooded directly over Alex, as if it was conspiring against her. It roared and growled, pushed and pulled at her, but she pushed on. -> main
= main
#CORRECT ANSWER: SOUTH
//CLUE: BACK
    +^G:H,5:7^[GO NORTH]->lost
    +^I:J,7:8^[GO EAST]->lost
    +^G:H,9:10^[GO SOUTH]-> wood4
    +^A:B,6:7 ^[GO WEST]->lost
== wood4 ==
#v_act2/east4
#s_audio/FootStep(Outside)_s
The winds were cruel and endless. {followedKari:Every rock or bush looked like Kari from a distance, Alex would run after them only to be met with dispair. }Everytime Alex would stop and try to piece together her surroundings. The thought of never making it home dug at her from the back of her mind. -> main
= main
#CORRECT ANSWER: EAST
//CLUE: RIGHT
    +^G:H,6:7^[GO NORTH]->lost
    +^I:J,6:8^[GO EAST] -> wood5
    +^G:H,9:10^[GO SOUTH]->lost
    +^A:B,6:7^[GO WEST]->lost
== wood5 ==
#v_act2/east5
#s_audio/FootStep(Outside)_s
Alex stumbled, her feet in pain from the cold, the walking, the guilt. Perhaps two kids would be found missing this night. She tried to push on but then everything would weigh on her. She trudged on, delirious.-> main
= main
#CORRECT ANSWER: NORTH
//CLUE: FOREWARD
    +^G:H,5:7^[GO NORTH]->act2Home_outside
    +^I:J,6:8^[GO EAST]->lost
    +^G:H,9:10^[GO SOUTH]->lost
    +^A:B,6:7^[GO WEST]->lost