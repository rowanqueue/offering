NORTH
VAR Stamina = 100
VAR hurt_leg = false
VAR long_walk = false
VAR fucked_hands = false
VAR Gone_forth = false
You know your cousin's hide out is nearby. Hes been gone for so long its starting to scare you. You really hope hes in there. 
-> trails


 
== trails ==
= intro
The further north you go, the steeper it gets, the more your ankles hate you. Underbrush and vegetation become more common the further you go. You climb up and down hills hoping to spot you cousin's hide out from so far up. This hill inparticular is precariously steep, but you can hear the ocean just ahead. Your feet begin to slip the higher you climb under the lose gravel of the trail, you don't feel safe. 
= main
    * [Push forward] You take a deep breath and attack the trail. Hiking as fast as you can, ignoring the burning in you calves. You are almost at the top when you trip and tumble down. 
    You get back up at the foot of the trail with some scratches and a bruise. You feel a bit worse.
    ~Gone_forth = true
    ~Stamina = Stamina - 10 
    ->main
    * {Gone_forth} [Push forward again] You throw caution to the wind and try again. This time running up the slope at full speed. You brace yourself mentally for a fall, but you soon realize that you've actually made it. 
    ->cliff
    *[Pace yourself] You decide to hike this steep trail slowly and safely. You zig zag across the slope so you don't fall. You eventually get to the top but it ate up far more time than you wanted it to.
    ~ Stamina =- 5
    ->cliff
    *[Use your hands] You use your hands to secure yourself, out of fear of stubling down this hill. You keep your body low to the ground and scramper up the hill. You look ridiculous.
    When you get to the top, You see your hands are a scraped up, but you made it and thats the most important part. 
    ~Stamina = Stamina - 5
    ~fucked_hands = true
    ->cliff
    
    
== cave ==
= intro
The boat looks just as your cousin described it. You would try and get a closer look but a massive eagle has nested right near the entrance. She sits at the helm staring at you menacingly waiting for you to make a move. -> main 
= main
 + [Approach the eagle] You approach the boat slowly, carefully eyeing the eagle. As soon as you get close it flaps its wings and brandishes its sharp talons. You wont be getting in with the eagle there. ->main
 
 * [Throw a pebble at the eagle] You chuck your rock near the eagle, hoping that will scare it. You are shocked when it actually hits and even more shocked when does not react. It just continues to look at you with a piercing gaze. ->main 
 
 + [Shout at it] Your tired and in pain and you just want to find your cousin and go home. You scream and let out all your anger the best you can. It screaches back flaps its wings and swoops toward you. You close your eyes and duck. You feel wind rush over your head and a talon slash into your shoulder. You stay folded over in fear for a while until you realize the eagle is gone, leaving only a feather behind. You take it, as a reminder and climb into the boat. ->shack
    
    
    
== cliff ==
= intro
The summit of this very steep hill overlooks the shore. You find that it ends in a rocky ledge high over the beach. In the distance, you can see, not only the shore but the boat your cousin must have been talking about. You have to find a way down this cliff. -> main
= main
   * [Climb down the rocky cliff] {not fucked_hands: You find some stable footting on the side of the cliff and decide to may be able to climb down safely. You move carfully only changing your grip when you know its safe. That doesn't stop your hands from shaking though. You are almost to the bottom when your hand slips and you fall backwards. You land in the sand with no injuries but the wind knocked out of you.}
       ~{not fucked_hands} Stamina = Stamina - 5 
       {fucked_hands :You find some stable footting on the side of the cliff and decide to may be able to climb down safely. You move carfully only changing your grip when you know its safe. The cuts in your hands start burning, in a laps of focus you let go and fall back on the sand. You feel the impact rattle every bone in your body. You get up in serious pain.} 
       ~ {fucked_hands} Stamina = Stamina - 15
    -> shore
    
    *[Find a safer route] You walk along the edge of the cliff looking for a safer point to get onto the  beach. You walk along the coast for what seems like forever until the ledge drops to a safe distance down. You eventually find yourself farther from the boat than ever before. It takes you a very long time to get close.
    You are very tired but safe.
    ~Stamina = Stamina - 10
    ~long_walk = true
    ->shore
    
    * [Jump down] There is no time, you know your cousin is down there! You hastily jump of the ledge, hoping the soft sand will cushion your fall. You nearly land on your feet, but collapse to the floor when you land. You feel a serious pain in your leg, its best to keep off of it the rest of the journey.
    ~Stamina = Stamina - 10
    ~hurt_leg = true
    ->shore
    
== shore == 
= intro

Walking upon the sandy shore, you see the rotting old boat up ahead and remember spending time at the beach with your foster parents. You see a cliff jutting out over the waterline and swear you can hear something over the sound of waves. Pebbles line the shore made smooth my the waves washing over them. -> main
= main
    + [Skip a stone] You take a moment to just skip some rocks like you used to do with your dad. This whole ordeal has been so scary and you just now realize how much you wish they were there with you. {fucked_hands: The salt water from the pebble stings your hands.}
    You start to feel a little better after a while and head over to the boat.
    ~Stamina = Stamina + 10
    ->cave
    
    + [Take a break] You sit at the shore and watch the waves crash on to the sand. You regain some strength from your long journey.
    ~{long_walk} Stamina = Stamina + 5
    ~Stamina = Stamina + 5
    -> cave
    
    + [Walk to the boat] -> cave
    * [Examine boat] This rickety boat is probably missing more planks than it still has left, you’re not sure how its still standing. The mildewy flag swaying in the lake breeze. -> main
    * [Examine water] The water seems to be rushing to shore harder than usual. In the distance, you can see waves continously crashing into each other. -> main
    -> main

 
== shack == 
= intro
//we could change the shack in to a boat so we dont have to draw another screen
As you enter the dusty, grimy shack you instantly understand why your new parents want you to clean your room so often. Apart from the rusting bedframe and what might once have been food on a desk, you see a pile of rope in fairly good condition on top of a shelf. -> main
= main
    * [Examine bed] The bed sits under a thick layer of dust, still made. You can’t tell the last time someone used it, but you’re betting it wasn’t last night. -> main
    * [Examine desk] On top of the desk you see the mottled old remains of a sketch of an man with a thick beard. Maybe a self portrait? -> main
    * [Examine shelf] The shelf seems to be almost twice your height, you wonder why the shack’s owner put it so high. You see a pair of boots. -> main
