VAR hurt_leg = false
VAR long_walk = false
VAR fucked_hands = false
VAR Gone_forth = false
VAR eagle_attempts = 0
VAR shore_attempts = 0
VAR forward = true
VAR eagle_gone =false 


== trails ==
= intro
#v_clearScreen
#s_audio/WindStooorm
#s_audio/Somber_m
#v_act3/northClimbingUpHills
Alex tried to follow Kari's map the best she could. She can still feel her heart pounding from the escape. Staying inside just did not sit right with you, and you're sure everything will be fine once you bring Kari home. ->main
=main
*[Look at map again] Kari's drawings are crude but surprisingly helpful when it comes to finding this hideout. From what you can tell it might be some kind of abandond boat. Thats pretty cool, you wish you had this kind of freedom when you were a kid. ->main
*[Take in the scenery] Your mom would always talk about how beautiful Iceland was and now you can see why. The landscape is so vast and colorful, it gives you a sense of clarity you have never felt before. ->main
+[Venture on] Kari has to be at this hideout, where else would he have run off to? You are just glad you found his drawings when you did. Maybe when you find him you, he can show you more sights around iceland.  ->trails2

==trails2 ==

 You climb up and down hills hoping to spot you cousin's secret hideout. This hill in particular is precariously steep, but you can hear the ocean just ahead.  Your feet begin to slip under the loose gravel of the trail; you don't feel safe. -> main
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
You approach the boat in Kari's drawings and call out his name. There is no answer. That cant be right, he has to be here. He must be sleeping. This place is in all of his drawings. Where else could he have gone?
You try and get a closer look and finally notice the massive eagle that has nested on the hull of the boat, right near the entrance. She sits at the helm staring at you, menacingly waiting for you to make a move. Maybe Kari won't come out because he's afraid of it. You need to get rid of it.  -> main 
= main
 * [Approach the eagle]
    ~eagle_attempts+=1
    You approach the boat slowly, carefully eyeing the eagle. As soon as you get close it flaps its wings and brandishes its sharp talons. You won't be getting in with the eagle there.->main
 * [Throw a pebble at the eagle]
    ~eagle_attempts+=1
    You chuck a pebble near the eagle, hoping that will scare it. You are shocked when it actually hits. And even more shocked when does not react. It just continues to look at you with its piercing gaze.
    ->main
    
 * [Look for another way in]
    ~eagle_attempts+=1
    You walk around to the front of the boat, making sure you keep your distance of the bird. {hurt_leg:You suddenly feel a sharp pain in the leg you hurt while jumping. It brings you to your knees and you lay in the sand for a bit until it goes away. You limp the rest of the way there.} The hull of the boat towers over you and it metal warped and rusted over.
     You find no way in. 
    ->main
    
 * [Kick up sand]
    ~eagle_attempts+=1
    You start stomping and kicking hoping that if you cause enough commotion the eagle with just leave. But it doesn't, it just stares at you, unamused by your tanturm.
    ->main
    
 * {eagle_attempts > 2} [Shout]
 #t_speedUp
    You're tired and in pain and you just want to find Kari and go home. You are so frustrated you start to cry. You yell out for Kari. He has to be there, you worked so hard to get here. 
    It screeches back, flaps its wings, and swoops toward you. You close your eyes and duck. 
    You feel wind rush over your head and a talon slash into your shoulder. 
 #t_reset
    You stay folded over in fear for a while until you no longer hear the flapping of the eagle's wings, leaving only a feather behind. You take it, as a reminder.
    ~eagle_gone = true
    ->main
  * {eagle_gone}[Enter Boat]//->act3Boat
  ->shore
   
    
    
    
== cliff == 
= intro
#v_act3/northHilltop
The summit of this very steep hill overlooks the shore. It ends in a rocky ledge high over the beach. In the distance, you can see, the boat Kari must have been talking about sitting on the shore. You have to find a way down this cliff. -> main
= main
   * [Climb down the rocky cliff] {not fucked_hands: You find some stable footing on the side of the cliff and think you might be able to climb down safely. That doesn't stop your hands from shaking though. You are almost to the bottom when your hand slips and you fall backwards. You land in the sand with no injuries but the wind knocked out of you.}
    ~Stamina = Stamina - 5
      {fucked_hands :You find some stable footing on the side of the cliff and think you might be able to climb down safely. You move carefully only changing your grip when you know its safe. The cuts in your hands start burning, in a lapse of focus you let go and fall back on the sand. You feel the impact rattle every bone in your body. {~Stamina = Stamina - 10}} -> shore
    
    *[Find a smaller ledge] You walk along the edge of the cliff looking for a safer point to get onto the  beach. You walk along the coast for what seems like forever until the ledge drops to a safe distance down. You eventually lose sight of the boat.
    
    ->longWalk
    
    * [Jump down] There is no time, you just know your cousin is down there! You hastily jump of the ledge, hoping the soft sand will cushion your fall. You nearly land on your feet, but collapse to the floor when you land. You feel a serious pain in your leg, its best to keep off of it the rest of the journey.
    ~Stamina = Stamina - 10
    ~hurt_leg = true
    ->shore
= longWalk
You are lost.
You walk along the shore hoping to pick up on any landmark that lead you back to the boat. You wander for so long you begin to doubt you are going in the right direction.
~Stamina = Stamina -5
+[Turn around]
~forward = true
->longWalk
    
+[Carry on] 
    {forward: 
    ~forward = false
    ->longWalk
    }
    
    You finally find the boat. You are out of breath, tired, and trembling but you made it.
    ->shore
    



== shore == 
= intro
#s_audio/waves
#v_act3/northCoveBoatFAR
Walking upon the sandy shore, you see the rotting old boat up ahead and it reminds you of going to the Rockaways with your parents. You see a cliff jutting out over the waterline and swear you can hear something over the sound of waves. Pebbles line the shore, smooth as sin as the waves wash over them. It might be a good time to look around.-> main
= main
    *^D:F,9:10 ^[Skip a stone] You take a moment to just skip some rocks like you used to do with your Dad. This whole ordeal has been so scary and you just now realize how much you wish they were here with you. {fucked_hands: The salt water from the pebble stings your hands.}
    You start to feel a little better after a while and take a breath.
    ~Stamina = Stamina + 3
    ->main
    
    *[Take a break] You sit at the shore and watch the waves crash on to the sand. You regain some strength from your long journey.
    {long_walk: 
    ~Stamina = Stamina + 3
    }
    -> main
    
    *[listen to the waves] You remeber what your mother told you and take in the sounds of the ocean. You think back to the ordeal at the cliff and shudder. You wish your mom was actually here.
    ~Stamina = Stamina + 3
    ~shore_attempts = shore_attempts + 1
    ->main 
    
    +{shore_attempts > 2}[Walk to the boat] -> cave
     //Coordinates needed!!!!!!!
    *^I:J,4:5^[Examine boat] This rickety boat is probably missing more planks than it still has left, you’re not sure how its still standing. The mildewy flag swaying in the lake breeze. 
    ~shore_attempts = shore_attempts + 1
    -> main
    *^I:J,2:3^[Examine cliff] You take a minute to look back at what you just did and shudder. That was so dangerous! How does Kari do this? But all the cuts and bruises will be worth it once you bring Kari back home.
    ~shore_attempts = shore_attempts + 1
    ->main
    *^A:E,5:7 ^[Examine water] The water seems to be rushing to shore harder than usual. In the distance, you can see waves continously crashing into each other.
    ~shore_attempts = shore_attempts + 1
    -> main

 
//== shack == 
//= intro
//we could change the shack in to a boat so we dont have to draw another screen
//As you enter the dusty, grimy shack you instantly understand why your new parents want you to clean your room so often. Apart from the rusting bedframe and what might once have been food on a desk, you see a pile of rope in fairly good condition on top of a shelf. -> main
//= main
  //  * [Examine bed] The bed sits under a thick layer of dust, still made. You can’t tell the last time someone used it, but you’re betting it wasn’t last night. -> main
/* [Examine desk] On top of the desk you see the mottled old remains of a sketch of an man with a thick beard. Maybe a self portrait? -> main
    //* [Examine shelf] The shelf seems to be almost twice your height, you wonder why the shack’s owner put it so high. You see a pair of boots. -> main
