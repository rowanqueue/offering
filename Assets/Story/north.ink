NORTH
VAR wearing_boots = false
VAR has_stick = false
VAR has_rope = false
VAR rope_cliff = false
VAR coin_visible = false
VAR has_coin = false
VAR knows_O = false
You have been tasked with getting a silver coin.
-> trails
== trails
= intro
The further north you go, the hillier it gets, the more your ankles hate you. Underbrush and vegetation become more common the further you go, and you catch a whiff of dank water. -> main
= main
    + [GO NORTH] -> brambles #movement
    + [GO SOUTH] This is a bad idea. Mr. O is there. #movement
    ~knows_O = true
    -> main
    * [Smell water] The smell of the water reminds you of the orphanage, but you’re not sure why. It doesn’t smell like any water you’ve ever known, and frankly it’s bothering you. -> main
    * {knows_O} [Mr. O?] Yeah, the mullet guy. -> main
    
    
== brambles == 
= intro
More and more vegetation crunches under your foot. A dense, waist-high bramble stands between you and a thicket of trees to the west. The horrid smell of the water is stronger here, and you can hear it lapping to the north. -> main
= main
    + [GO NORTH] -> shore
    + [GO SOUTH] -> trails
    + [GO WEST] 
        {not wearing_boots: You take a step onto the bramble and a thorn drives right through your shoe and into the sole of your foot. You stumble back and pull it out. -> main} 
        You start to wade through the brambles. The boots protect the soles of your feet but every step you take drives more thorns into your legs and waist. Eventually you make it to the tree line. 
        -> thicket
    * [Examine thicket] The brambles here look thornier than any you’ve ever seen, like tiny knives. You don’t want to think about them getting caught up in your feet. -> main
    
    
== thicket ==
= intro
You exit the brambles into a sparse thicket of trees. There is a particularly tall one that seems to be dying. You look past the trees to see a stark cliff face, upon which you hear a strange sort of rustling. -> main
= main
    + [GO NORTH] -> hilltop
    + [GO EAST] -> brambles
    * [Examine tree] You look up at the tree that definitely has seen better days. You see a particular branch that looks to be about to fall off. -> main
    * [Get branch] You reach up and break off a long branch.
    ~has_stick = true
    -> main
    * [Examine cliff] At first it seems like an easy enough slope, but then you notice the dense bushes and slope steepening and decide that it would take way too much effort. -> main
    * {has_rope} [Use rope on cliff] You throw the rope to the top of the cliff and it latches onto a bush.
    ~rope_cliff = true
    -> main
    +  {rope_cliff} [Climb rope]
        {not wearing_boots: You can’t get a good footing and after a few minutes of effort slide all the way back to the bottom. -> main}
        Wearing your handy boots, you are able to slowly make your way up the cliff. It tires you out, but you manage to make it. 
        -> hilltop
        
        
== hilltop == 
= intro 
You are deafened by the cacophony of bird sounds coming from the countless number of birds before you. They seem to cover every space available, leading up to the cliff facing the lake. You see a glint of metal in the center. -> main
= main
    + [GO SOUTH] -> thicket
    * [Examine birds] You see a wide range of birds, mostly crows and sparrows, but with a majestic eagle in the center. -> main
    * [Examine coin]
        {not coin_visible: You can barely see a glint from the silvery coin between the constantly moving throng of birds. -> main}
    * [Make noise] All of the birds, save one, fly off as a single unit over the lake. The eagle flies onto your shoulder, you are terrified. It gently places a metal coin in your open palm before flying away. 
    -> fake_ending
    
    
== shore == 
= intro
Walking upon the sandy shore, you see a rotting old shack and remember spending time at the beach with your foster parents. You see a cliff jutting out over the waterline and swear you can hear something over the sound of waves. -> main
= main
{not wearing_boots: There are a pair of boots by the shore.}
    + [GO SOUTH] -> brambles
    + [GO INTO SHACK] -> shack
    * [Examine shack] This wooden shack is probably missing more planks than it still has left, you’re not sure how its still standing. The mildewy door swaying in the lake breeze. -> main
    * [Examine cliff] Atop the sheer cliff over the water you see a grassy knoll. You hear some sort of sound, almost as of tons of sheets of paper rustling. -> main
    * [Examine water] The water looks cleaner than it smells, somehow -> main
    * [Examine boots] These new boots pristinely sit by the shore, perfectly in a line. If you didn’t know better, you’d say they had never been used before. Picking them up, you realize they are full of water and dump it back into the lake.
        ~ wearing_boots = true
        -> main
        
        
== shack == 
= intro
As you enter the dusty, grimy shack you instantly understand why your new parents want you to clean your room so often. Apart from the rusting bedframe and what might once have been food on a desk, you see a pile of rope in fairly good condition on top of a shelf. -> main
= main
    + [GO OUT] -> shore
    * [Examine bed] The bed sits under a thick layer of dust, still made. You can’t tell the last time someone used it, but you’re betting it wasn’t last night. -> main
    * [Examine desk] On top of the desk you see the mottled old remains of a sketch of an man with a thick beard. Maybe a self portrait? -> main
    * [Examine shelf] The shelf seems to be almost twice your height, you wonder why the shack’s owner put it so high. You see a pile of rope on top of it. -> main
    * {not has_rope} [Examine rope] The rope seems a little out of place, being the only thing in the shack that is in good condition. -> main
    + {not has_rope} [Take rope] The shelf is too high for you to reach. -> main
    * {has_stick} [Use stick on rope] You knock over the rope, picking up the coil and throwing it over your shoulder. This should come in handy somewhere, right?
    ~has_rope = true
    -> main
    
    
== fake_ending ==
You got the coin!
-> END