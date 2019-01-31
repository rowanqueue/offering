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
#s_act3/Audio/WindStooorm
#s_act3/Audio/Somber_m
#v_act3/north1
Alex tried to follow Kari's map as best she could, just looking at it gave her hope that Kari was okay. She could still feel her heart pounding from the escape. Staying inside just did not sit right with her. The air was chilly but refreshing, a perfect time to explore the beautiful landscape around her, but she was on a mission. ->main

=main
*[Alex looked at map again] Kari's drawings were crude but surprisingly helpful when it came to finding the hideout. From what Alex could tell it was some kind of boat. Alex felt a little envious after that, she wished she could have a secret boat hideout. ->main

*[Alex took in the scenery] Alex's mom would always talk about how beautiful Iceland was and looking around, she could finally see why. The landscape was so vast and colorful, it gave her a sense of clarity she had never felt before. ->main

+[Alex ventured on] Kari had to be at this hideout, where else would he have run off to? Alex was just glad that she found his drawings when she did. She thought that maybe when she found him, he could show her more sights around iceland.  ->trails2

==trails2 ==
 Alex climbed up and down hills hoping to spot her cousin's secret hideout. This hill in particular is precariously steep, but she could hear the ocean just ahead. Her feet began to slip under the loose gravel of the trail; she didn't feel safe. -> main
= main
    * [Alex pushed forward] Alex took a deep breath and attacked the trail. Hiking as fast as she could, ignoring the burning in her calves. She was almost at the top when she tripped and tumbled down. 
    She got back up at the foot of the trail with some scratches and a bruise. She felt a bit worse.
    ~Gone_forth = true
    ~Stamina = Stamina - 10
    ->main
    * {Gone_forth} [She pushed forward again] She threw caution to the wind and tried again. This time running up the slope at full speed. She squeezed her eyes shut, preparing mentally for a fall, but when she opened them she realized that she had actually made it to the top.
    ->cliff
    *[Alex paced herself] She decided to hike this steep trail slowly and safely. She zig-zagged across the slope so she didn't fall. She eventually got to the top but it ate up far more time than she wanted it to.
    ~ Stamina -= 5
    ->cliff
    *[Alex used her hands] She used her hands to secure herself, out of fear of stubling down the hill. She kept her body low to the ground and scampered up the hill. She just knew that she looked absolutely ridiculous.
    When she got to the top and unclenched her hands, finally noticing that they were raw and bloody, but she made it and that was the most important part. 
    ~Stamina = Stamina - 5
    ~fucked_hands = true
    ->cliff
    
    
== cave ==
= intro
#v_clearScreen
#v_act3/boatExterior
She approached the boat from Kari's drawings and called out his name. There was no answer. That can't be right, he had to be here. He must be sleeping. This place was in all of his drawings. Where else could he have gone?
She tried to get a closer look and finally noticed the massive eagle that had nested on the hull of the boat, right near the entrance. It sat at the helm staring at Alex, menacingly waiting for her to make a move. Maybe Kari wouldn't come out because he was afraid. Alex needed to get rid of it.  -> main 
= main
 * [Alex approached the eagle]
    ~eagle_attempts+=1
    Alex approached the boat slowly, carefully eyeing the eagle. As soon as she got close, it flapped its wings and brandished its sharp talons. She wouldn't be getting in with the eagle still there.->main
 * [Alex threw a pebble at the eagle]
    ~eagle_attempts+=1
    She chucked a pebble near the eagle, hoping that that would scare it. She was shocked when it actually hit. And even more shocked when the eagle does not react. It just continued to look at her with its piercing gaze.
    ->main
    
 * {eagle_attempts > 0} [Alex looked for another way in]
    ~eagle_attempts+=1
    She walked around to the front of the boat, making sure she kept her distance from the bird. {hurt_leg:She suddenly felt a sharp pain in the leg she hurt while jumping. It brings her to her knees and Alex laid in the sand until it went away. She limped the rest of the way there.} The hull of the boat, with its warped and rusted metal, towered over her.
     Alex found no way in. 
    ->main
    
 * [Alex kicked up sand]
    ~eagle_attempts+=1
    Alex started stomping and kicking, hoping that if she caused enough commotion the eagle would just leave. But it didn't, it just stared at her, unamused by her tantrum.
    ->main
    
 * {eagle_attempts > 2} [Alex shouted]
 #t_speedUp
    She was tired and in pain and she just wanted to find Kari and go home. You was so frustrated that she started to cry. Alex yelled out for Kari. He has to be there, she had worked so hard to get here. 
    It screeched back, flapped its wings, and swooped toward Alex. She closed her eyes and ducked. 
    She felt wind rush over her head and a talon slash into her shoulder.
 #t_reset
    Alex stayed folded over in fear for a while until she no longer heard the flapping of the eagle's wings, leaving only a feather behind. She took it, as a reminder.
    ~eagle_gone = true
    ->main
  * {eagle_gone}[Alex entered the boat]->act3Boat
   
    
    
    
== cliff == 
= intro
#v_act3/northHilltop
The summit of this very steep hill overlooked the shore. It ended in a rocky ledge high over the beach. In the distance, she could see the boat Kari that must have been talking about sitting on the shore. She had to find a way down this cliff. -> main
= main
   * [Alex climbed down the rocky cliff] {not fucked_hands: She found some stable footing on the side of the cliff and thought she might be able to climb down safely. That didn't keep her hands from shaking though. She was almost to the bottom when her hand slipped and she fell backwards. She landed in the sand with no injuries but the wind knocked out of her.}
    ~Stamina = Stamina - 5
      {fucked_hands :She found some stable footing on the side of the cliff and thought she might be able to climb down safely. She moved carefully only changing her grip when she knew it was safe. The cuts in her hands started burning, in a lapse of focus she let go and fell back on the sand. She felt the impact rattle every bone in her body. {~Stamina = Stamina - 10}} -> shore
    
    *[Alex looked for a smaller ledge] She walked along the edge of the cliff looking for a safer point to get onto the beach. She walked along the coast for what seemed like forever until the ledge dropped to a safe distance down. She eventually lost sight of the boat. ->longWalk
    
    * [Alex jumped down] There was no time, Alex just knew Kari was down there! She hastily jumped off the ledge, hoping the soft sand would cushion her fall. She nearly landed on her feet, but collapsed to the ground when she landed. She felt a serious pain in her leg, and thought it would be best to keep off of it the rest of the journey.
    ~Stamina = Stamina - 10
    ~hurt_leg = true
    ->shore
= longWalk
Alex was lost.
She walked along the shore hoping to pick up on any landmark that would lead her back to the boat. She wandered for so long she began to doubt she was going in the right direction.
~Stamina = Stamina -5
+[Alex turned around]
~forward = true
->longWalk
    
+[Alex carried on] 
    {forward: 
    ~forward = false
    ->longWalk
    }
    
    Alex finally found the boat. She was out of breath, tired, and trembling but she made it.
    ->shore
    



== shore == 
= intro
#s_act3/Audio/WavesWav
#v_act3/boatFar
Walking upon the sandy shore, Alex saw the rotting old boat up ahead and it reminded her of going to the Rockaways with her parents. Pebbles lined the shore, smooth as sin as the waves washed over them. She thoguht it might finally be a good time to look around.-> main
= main
    *^D:F,9:10 ^[Alex skipped a stone] She took a moment to just skip some rocks like she used to do with Dad. Everything so far had been so scary and Alex just now realized how much she wished her parents were here with her now. {fucked_hands: The salt water from the pebble stung her hands.}
    She started to feel a little better after a while and took a breath.
    ~Stamina = Stamina + 3
    ->main
    
    *[Alex took a break] Alex sat by the shore and watched the waves as they crashed onto the sand. She regained some strength from her long journey.
    {long_walk: 
    ~Stamina = Stamina + 3
    }
    -> main
    
    *[Alex listened to the waves] She remembered what her mother told her and take in the sounds of the ocean. She thought back to the ordeal at the cliff and shuddered. She wished her mom was actually there with her.
    ~Stamina = Stamina + 3
    ~shore_attempts = shore_attempts + 1
    ->main 
    
    +{shore_attempts > 0}[Alex walked to the boat] -> cave
     //Coordinates needed!!!!!!!
    *^I:J,4:5^[Alex examined the boat] The rickety boat wass probably missing more planks than it still had left, Alex wasn't exactly sure how it was still standing. The mildewy flag was swaying in the ocean breeze. 
    ~shore_attempts = shore_attempts + 1
    -> main
    *^I:J,2:3^[Alex examined the cliff] Alex took a minute to look back at what she just did and shudder. That was so dangerous! How does Kari do this? But all the cuts and bruises would be worth it once she brought Kari home.
    ~shore_attempts = shore_attempts + 1
    ->main
    //*^A:E,5:7 ^[Examine water] The water seems to be rushing to shore harder than usual. In the distance, you can see waves continously crashing into each other.
    //~shore_attempts = shore_attempts + 1
    //-> main

 
//== shack == 
//= intro
//we could change the shack in to a boat so we dont have to draw another screen
//As you enter the dusty, grimy shack you instantly understand why your new parents want you to clean your room so often. Apart from the rusting bedframe and what might once have been food on a desk, you see a pile of rope in fairly good condition on top of a shelf. -> main
//= main
  //  * [Examine bed] The bed sits under a thick layer of dust, still made. You can’t tell the last time someone used it, but you’re betting it wasn’t last night. -> main
/* [Examine desk] On top of the desk you see the mottled old remains of a sketch of an man with a thick beard. Maybe a self portrait? -> main
    //* [Examine shelf] The shelf seems to be almost twice your height, you wonder why the shack’s owner put it so high. You see a pair of boots. -> main
