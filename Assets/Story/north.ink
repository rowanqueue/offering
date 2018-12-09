NORTH
VAR eagle_here = true
VAR wearing_boots = false
VAR has_stick = false
VAR has_rock = false
VAR has_horn = false
VAR boat_docked = false
VAR has_feather = false
You know your cousin's hide out is nearby. Hes been gone for so long its starting to scare you. You really hope hes in there. 
-> trails



== trails ==
= intro
The further north you go, the hillier it gets, the more your ankles hate you. Underbrush and vegetation become more common the further you go. In the distance, you can see the briny shore.-> main
= main
    + [GO NORTH] -> snowyHilltop1
    + [GO EAST] -> shore
    * [GO SOUTH] There is no going back. -> main
    + [GO WEST] -> cave
    
    
    
== cave ==
= intro
You wander down the shoreline until you find a cove just as your cousin described it. You would try and enter but a massive eagle has nested right near the entrance, its nest made from ripped apart branches and rotten wooden planks. It stares at you menacing, waiting for you to make a move. -> main 
= main
 + [GO EAST] ->trails
 + [ENTER CAVE]
    {eagle_here: You approach the entrance slowly, carefully eyeing the eagle. As soon as you get close it flaps its wings and brandishes its sharp talons. You wont be getting in with it there. ->main}
    You are in. ->END
 * {has_rock} [THROW ROCK AT EAGLE] You chuck your rock near the eagle, hoping that will scare it. Yor are shocked when it actually hits and even more shocked when does not react. It just sits there staring at you, as if it wants something. ->main
 * {has_stick} [SWING STICK] The more you look at the creature, the more it scares you. Its eyes pierce right through you, you dont know what it wants. You just want it to go away you swing the stick towards the eagle hoping it would at least flinch. It does not. You are running out of options. ->main
 
* {has_horn} [Blow horn] You take a long and deep breath and blow the horn desperately. Its loud, low tone seems to ring throughout the seaside. There is a long pause. Then, the eagle screaches in return, flaps its winds, and launches out towards you. You duck just in time but one of its talons digs into your shoulder. You remain folded over in fear for a whilem until you realize the eagle is gone leaving only a feather behind. You take it, as a reminder and enter the cave.
    ~has_horn = false
    ~has_feather = true
    ->END
    
    
    
== snowyHilltop1 == 
= intro
More and more frozen vegetation crunches under your foot. A dense patch of thorns blocks the path ahead. Next to you is an old decaying tree. Its branches, large and grey, swing precariously in the wind as if the whole thing was ready to fall apart. ->main
= main
    + [GO NORTH] 
        {not wearing_boots: You take a step onto the bushes and a thorn drives right through your shoe and into the sole of your foot. You stumble back and pull it out. -> main}
        You start to wade through the bushes. The boots protect the soles of your feet but every step you take drives more thorns into your legs and waist. Eventually you make it to the tree line.   
        -> cliff
    + [GO SOUTH] -> trails
    * [Examine tree] The tree seems to be withering right in front of you. You can hear it creak and crack in the wind. Its branches are long and thin ready to snap off at any moment.
        -> main
    * [Take branch] You can reach any of the branches and climbing the tree seems just as dangerous for it as it would be for you. Its best not to stand under it like this something might just fall on you.
        -> main
    * {has_rock} [Knock down branch] You chuck a rock at one of the branches. You hear the rock hit with a crunch and a branch almost as tall as you falls to your feet.
      ~has_stick = true 
      ~has_rock = false
      ->main
    
    
    
== cliff ==
= intro
You exit the brambles unto a sheer cliff over looking the chaoic sea. At the ledge lies a pure white horn decarated with metal orniments. The cold bites at your face as the ocean roars below you. -> main
= main
    + [GO SOUTH] -> snowyHilltop1
    * [Examine horn] It is some kind of animal part fassioned into a horn. It seems to be in pristine condition despite looking as if it was left here by vikings.-> main
    * [Get horn] You walk toward the edge of the cliff to grab the horn. The winds tug at you harder the closer you get to the raging sea. Just a little bit closer. You bend over to pick it up and a blast of air throws you off balance. You stumble forward and a heart stops. You regain you balance at the last minute, but at least you got the horn.  
    ~has_horn = true
    -> main
    
== shore == 
= intro
#k_shore
Walking upon the sandy shore, you see a rotting old shack and remember spending time at the beach with your foster parents. You see a cliff jutting out over the waterline and swear you can hear something over the sound of waves. Pebbles line the shore made smooth my the waves washing over them. -> main
= main
    + [Take a pebble] You take one of the many pebbles. Its cold to the touch so you drop it in your pocket quickly. 
    ~has_rock = true
    ->main
    + [GO WEST] ->trails
    + [GO INTO SHACK] -> shack
    * [Examine shack] This wooden shack is probably missing more planks than it still has left, you’re not sure how its still standing. The mildewy door swaying in the lake breeze. -> main
    * [Examine water] The water seems to be rushing to shore harder than usual. In the distance, you can see waves continously crashing into each other. -> main
        -> main
        
     
== shack == 
= intro
//we could change the shack in to a boat so we dont have to draw another screen
As you enter the dusty, grimy shack you instantly understand why your new parents want you to clean your room so often. Apart from the rusting bedframe and what might once have been food on a desk, you see a pile of rope in fairly good condition on top of a shelf. -> main
= main
    + [GO OUT] -> shore
    * [Examine bed] The bed sits under a thick layer of dust, still made. You can’t tell the last time someone used it, but you’re betting it wasn’t last night. -> main
    * [Examine desk] On top of the desk you see the mottled old remains of a sketch of an man with a thick beard. Maybe a self portrait? -> main
    * [Examine shelf] The shelf seems to be almost twice your height, you wonder why the shack’s owner put it so high. You see a pair of boots. -> main
    * {not has_stick} [Examine boots] Lined with fur and blackened with age, they seem to high to reach. They are problably too big for you, but that doesn't mean they won't be useful. -> main
    + {not has_stick} [Take boots] The shelf is too high for you to reach. -> main
    * {has_stick} [Use stick on shelf] You knock over the boots, picking up the pair and putting them on. You feet slide around inside, but these will keep them nice and safe.
    ~has_stick = false
    ~wearing_boots = true
    -> main
