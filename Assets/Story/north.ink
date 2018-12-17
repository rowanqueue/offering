VAR hurt_leg = false
VAR long_walk = false
VAR fucked_hands = false
VAR Gone_forth = false
VAR eagle_attempts = 0
== trails ==
= intro
#v_clearScreen
#s_audio/WindStooorm
#s_audio/Somber_m
#v_act3/northClimbingUpHills
You decide to start your search by following the map Kari left. You soon regret it. The further north you go, the steeper it gets, the more your ankles hate you. Underbrush and vegetation become more common and more treacherous. You climb up hills hoping to spot you cousin's secret hideout, and down them when you find you can't see a thing. This hill in particular is precariously steep, but you can hear the ocean just ahead. Your feet begin to slip under the loose gravel of the trail; you don't feel safe. -> main
= main
    * [Push forward] You take a deep breath and attack the trail. Hiking as fast as you can, ignoring the burning in you calves. You are almost at the top when you trip and tumble down. 
    You get back up at the foot of the trail with some scratches and a bruise. You feel a bit worse.
    ~Gone_forth = true
    ~Stamina = Stamina - 10 
    ->main
    * {Gone_forth} [Push forward again] You throw caution to the wind and try again. This time running up the slope at full speed. You squeeze your eyes shut, preparing mentally for a fall, but when you open them you realize that you've actually made it to the top.
    ->cliff
    *[Pace yourself] You decide to hike this steep trail slowly and safely. You zig zag across the slope so you don't fall. You eventually get to the top but it ate up far more time than you wanted it to.
    ~ Stamina -= 5
    ->cliff
    *[Use your hands] You use your hands to secure yourself, out of fear of stubling down this hill. You keep your body low to the ground and scramper up the hill. You just know that you look absolutely ridiculous.
    When you get to the top and unclench your hands, you notice that they are raw and bloody, but you made it and thats the most important part. 
    ~Stamina = Stamina - 5
    ~fucked_hands = true
    ->cliff
    
    
== cave ==
= intro
#v_clearScreen
#v_act3/northBoat
The boat looks just as Kari described it. You would try and get a closer look but a massive eagle has nested right near the entrance. She sits at the helm staring at you, menacingly waiting for you to make a move. -> main 
= main
 * [Approach the eagle]
    ~eagle_attempts+=1
    You approach the boat slowly, carefully eyeing the eagle. As soon as you get close it flaps its wings and brandishes its sharp talons. You won't be getting in with the eagle there.->main
 * [Throw a pebble at the eagle]
    ~eagle_attempts+=1
    You chuck your rock near the eagle, hoping that will scare it. You are shocked when it actually hits. And even more shocked when does not react. It just continues to look at you with its piercing gaze.->main 
 * {eagle_attempts > 1} [Shout at it]
 #t_speedUp
 #t_speedUp
    You're tired and in pain and you just want to find Kari and go home. You scream and let out all your anger the best you can. It screeches back, flaps its wings, and swoops toward you. You close your eyes and duck. You feel wind rush over your head and a talon slash into your shoulder. 
    #t_reset
    You stay folded over in fear for a while until you no longer hear the flapping of the eagle's wings, leaving only a feather behind. You take it, as a reminder.
    ** [Enter Boat]->act3Boat
    
    
    
== cliff ==
= intro
#v_act3/northHilltop
The summit of this very steep hill overlooks the shore. It ends in a rocky ledge high over the beach. In the distance, you can see, the boat Kari must have been talking about sitting on the shore. You have to find a way down this cliff. -> main
= main
   * [Climb down the rocky cliff] {not fucked_hands: You find some stable footing on the side of the cliff and think you might be able to climb down safely. You move carefully, only changing your grip when you know it's safe. That doesn't stop your hands from shaking though. You are almost to the bottom when your hand slips and you fall backwards. You land in the sand with no injuries but the wind knocked out of you.}
    ~Stamina = Stamina - 5
      {fucked_hands :You find some stable footing on the side of the cliff and think you might be able to climb down safely. You move carefully only changing your grip when you know its safe. The cuts in your hands start burning, in a lapse of focus you let go and fall back on the sand. You feel the impact rattle every bone in your body. {~Stamina = Stamina - 10}} -> shore
    
    *[Find a safer route] You walk along the edge of the cliff looking for a safer point to get onto the  beach. You walk along the coast for what seems like forever until the ledge drops to a safe distance down. You eventually find yourself farther from the boat than ever before. It takes you a very long time to get closer.
    You are very tired but safe.
    ~Stamina = Stamina - 10
    ~long_walk = true
    ->shore
    
    * [Jump down] There is no time, you just know your cousin is down there! You hastily jump of the ledge, hoping the soft sand will cushion your fall. You nearly land on your feet, but collapse to the floor when you land. You feel a serious pain in your leg, its best to keep off of it the rest of the journey.
    ~Stamina = Stamina - 10
    ~hurt_leg = true
    ->shore
    
== shore == 
= intro
#s_audio/waves
#v_act3/northCoveBoatFAR
Walking upon the sandy shore, you see the rotting old boat up ahead and it reminds you of going to the Rockaways with your parents. You see a cliff jutting out over the waterline and swear you can hear something over the sound of waves. Pebbles line the shore, smooth as sin as the waves wash over them.-> main
= main
    *^D:F,9:10 ^[Skip a stone] You take a moment to just skip some rocks like you used to do with your Dad. This whole ordeal has been so scary and you just now realize how much you wish they were here with you. {fucked_hands: The salt water from the pebble stings your hands.}
    You start to feel a little better after a while and take a breath.
    ~Stamina = Stamina + 10
    ->main
    
    * [Take a break] You sit at the shore and watch the waves crash on to the sand. You regain some strength from your long journey.
    {long_walk: 
    ~Stamina = Stamina + 5
    }
    ~Stamina = Stamina + 5
    -> main
    
    +^I:J,4:5 ^[Walk to the boat] -> cave
    //* [Examine boat] This rickety boat is probably missing more planks than it still has left, you’re not sure how its still standing. The mildewy flag swaying in the lake breeze. -> main
    *^A:E,5:7 ^[Examine water] The water seems to be rushing to shore harder than usual. In the distance, you can see waves continously crashing into each other. -> main
    -> main

 
//== shack == 
//= intro
//we could change the shack in to a boat so we dont have to draw another screen
//As you enter the dusty, grimy shack you instantly understand why your new parents want you to clean your room so often. Apart from the rusting bedframe and what might once have been food on a desk, you see a pile of rope in fairly good condition on top of a shelf. -> main
//= main
  //  * [Examine bed] The bed sits under a thick layer of dust, still made. You can’t tell the last time someone used it, but you’re betting it wasn’t last night. -> main
/* [Examine desk] On top of the desk you see the mottled old remains of a sketch of an man with a thick beard. Maybe a self portrait? -> main
    //* [Examine shelf] The shelf seems to be almost twice your height, you wonder why the shack’s owner put it so high. You see a pair of boots. -> main
