VAR hasBerries = false
VAR stamina = 100
VAR hasBucket = false
VAR cow1Soothed =  false
VAR milk = 0
VAR cow2Soothed = false
VAR cow3Soothed = false
VAR cow1milked = false
VAR cow2milked = false
VAR cow3milked = false

->west
=== west ===
You have been told to milk a cow. You don't even know how to milk a cow, but Grandpa seemed angry at you so its best to go do it. The fields around you feel quiet and empty.
    ->lady
    
== lady ==
= intro
You can still see Grandpa and Audi talking through the window. Everyonce in a while, he will glance over at you and give you a look you don't understand. With the barn behind you, the horizon is comprised  of  and the smell of manure drifting through the air.
->main

= main
    + [Examine Grandpa] He feels like a stranger you now. You've only know him for a couple days and he already hates you. Why? What did you do? He changed so quickly, it really scared you. Now you have to milk a cow? You don't even know how to milk a cow You need to be looking for Kari but you're too scared to tell him that.  
    ->main
    
    + [Examine Audi] You would talk to her but you don't want get close to Grandpa right now. No one here will help. Your parents are gone, your friends are miles away, your Grandpa refuses to talk to you, and you cousin has dissapeared. You feel so alone.
    ->main

    + [Go to pasture] You head towards the cow smell reluctantly. You don't want to do this, your stomach churns at the thought of what you have to do. 
    ->pasture
    
    +{milk > 2} [Show Grandpa] You knock on the door and show grandpa the bucket of milk. He looks at you and looks at the bucket and snarls. 
        :Grandpa: "What is this? You call this milk? You are useless! Just like the rest of them, useless burdens on our town! Look at this, its pink! How dare you hurt those cows with your stupid city boy hands. Did you even strip them? Are you trying to make me sick?"
        You stammer trying to find a response but you're too scared. You don't know what hes capable of. You don't want him to hurt you. 
        :Grandpa: "Useless, stupid boy! I'll show you how someone of my blood should milk a cow."
        He pulls you by the ear and you yelp in pain. He does not let go. You can feel the blood course through your veins. You are terrified. You have trouble breathing and your eyesight is getting blurry. 
        By the time you reach the barn tears stream down your face. You feel light headed. He continues to yell at you, but this time its mostly in icelandic. He shoves you too the ground picks, you up by the collar, and pushes you toward a cow. You panic, you feel trapped with no one to help you. You feel like blacking out. 
        :Grandpa: "You want to be a real man of iceland use this!" He pulls out a hideous creature out of a nearby crate. It looks like a long, hairy snake made of wrapped in old, crusty fur. On its two ends are wrinkled and swolen screaming faces. Their lips are cracked and swolen, its mouth gaping wide. Grandpa wiggles it around infront of you and you see its beady eyes glazed over with puss. You scream and Grandpa laughs. 
        :Grandpa: "Whats the matter? You've never seen the Tilberi before? What have you parents been teaching you? This is our culture! This is how we use to milk the cows! You coward, children here are raised properly, to not fear such silly things."
        He shoves the Tilberi in your hands and you panic. You don't know whats real and whats fake any more. You breath heavily, unable to tell if hes joking or not. 
        ->dadEnter
        
== pasture ==
= intro
You stop at foot of some rolling hills. You are astonished by the size of this farm. You see cows roming all around lazily chewing grass. Speckled bushes sprout wildly along the field to your right.
 ->main
 
= main
    + [Examine bushes] ->bushes
    + [Examine cow] 
        {hasBucket: ->cow1} 
        you don't feel like your ready to do that yet. 
        ->main
    +[Go forward] ->pasture2
    +[Go right] ->pasture3
    
= bushes
    You look at the bushes and find brightly colored berries hanging from the branches. 
    *[Eat Berries] You shove some berries in your mouth. Their sweet taste make you feel a little better and they make you feel light headed.
    ~stamina += 10
    ->main
    
    *[Put Berries in Pocket] You pocket some berries later, they have to be here for a reason. 
    ~hasBerries = true
    ->main
    
    +[Step Away] You remind yourself of the task at hand and decide to move on. 
    ->main

= cow1
    You feel the body heat of the cow on your skin. It exhales loudly once you crouch down. You seem more nervous than it does. 
    
    + [Pet the Cow]
        Your hands tremble a little bit as you pet the cow. You have never seen an animal of this size in person before. This whole trip has been a stark change from your New York home leaving you nervous and uncomphotable. The cow, on the other hand, seems at ease even going so far as to move closer to you.  
            ~cow1Soothed = true
            ->cow1
    
    + [Scratch Behind Its Ears] 
        You try scratching behind her ears, like a dog. It snorts furiously and trashs her head angrily. This scares you even more. You don't know how to approach these animals. If you can't even soothe them properly, how are you going to milk them?
            ~stamina -= 5
            ~cow1Soothed = false
            ->cow1
    
    + { not cow1milked}[Milk Cow]
        {cow1Soothed and hasBucket} ~milk += 1
        {cow1Soothed and hasBucket} ~cow1milked = true
        {hasBucket and cow1Soothed: You pull out the bucket, sit down, and stare at the udders. You don't like how they feel in your hands. They're fleshy, moist, and warm to the touch. You feel sick everytime to squeeze them. You try not to gag while the bucket fills. ->main}
        {not hasBucket: You are not prepared to do that right now. ->cow1}
        {not cow1Soothed: You reach down and the cow stops her foot. You are scared to go any further. ->cow1}
    
    
== pasture2 ==
= intro
Audi's property goes on for what seemes like miles. You have yet to even see a fence any where. The cows seem to just wonder where they please.   
 ->main
 
= main
    + [Examine sky] 
        The clouds are thin, as if they were smeared across the sky. It looks like its getting late, you are cold, you want to go home.
        ->main
        
    + [Examine cow] 
        {hasBucket: ->cow2} 
        you don't feel like your ready to do that yet. 
        ->main
        
    +[Go back] ->pasture

= cow2
    You see the cow intermintatly rustle through the bushes looking for something. It immediately stops and stares at you when you approach.  

    + [Give The Cow What It Wants]
        {hasBerries: You take some berries out of your pocket to feed the cow some berries. You feel its tounge brush up against your hand as it takes them. It nuzzles your hand once it finishes chewing.}
        {hasBerries} ~ cow2Soothed = true
        {not hasBerries: you don't know what you can do.}
        ->cow2
    
    + {not cow2milked} [Milk Cow]
        {cow2Soothed and hasBucket} ~cow2milked = true
        {hasBucket and cow2Soothed} ~milk += 1
        {hasBucket and cow2Soothed: You tug on the udders hoping to get this over with as soon as possible. The cow cries out in pain and knocks you to the ground when you get up you see the bucket contains drops of blood. ->main}
        {not hasBucket: You are not prepared to do that right now. ->cow2}
        {not cow2Soothed} ~stamina -= 5
        {not cow2Soothed: You get closer and the cow squeals and stomps off angrily, stepping on your foot on the way out. ->cow2}
    
    
    
    
== pasture3 ==
= intro
Your feet start to hurt again. You haven't really had a chance to fully recover from yesterday. Everything is moving so fast but it feels like you have made so little progress in finding your cousin.  
 ->main
 
= main
    * [Examine bucket] 
        You see a metal bucket just lying on the floor. It is dented all over and a little dirty but it should do the trick.
        ~hasBucket = true  
        ->main
        
    + [Examine cow] 
        {hasBucket: ->cow3} 
        you don't feel like your ready to do that yet. 
        ->main
        
    +[Go back] ->pasture

= cow3
    This cow fidgets constantly, sparaticly swatting its tail and kicking its feet.  

    + [Talk to the cow]
        You apologize for what you are about to do. You don't want to hurt it and your not here by choice. It seems to stop kicking and stay still.
        ->cow3

    + {not cow3milked} [Milk Cow]
        {hasBucket} ~cow1milked = true
        {not hasBucket: You are not prepared to do that right now. ->cow3}
        ->cowtail
        
    =cowtail
        You sit down to milk the cow and the cow turns away. You try to move with it being careful of its feet. Once you finally settle it down, a tail swats you in the face. Like clockwork, the cow slaps you in the face with its tail. You move around hoping to get out of its reach but the cow moves with you. You start to get angry.
                *[swat the tail away] You get frustrated and slap the tail out of your face. This startles the cow and it kicks its hind legs. They narrowly miss you. But if it hadn't you would have been seriously injured. You hastily squeeze the milk you need ignoring every swat in the face.
                    ~stamina -= 10
                    ~milk += 1
                    ->main
                    
                *[ignore it] As best you can you try to ignore the tail in your face. Its hairs are coarse scratching up your face, getting in your eyes and mouth. Your face itches after every hit and you start to notice how bad this cow smells. You can hardly see, sometimes your hands jerk in reaction and milk sprays all over you. Despite this you get your milk even if most of it ended up on you. 
                    ~stamina -=10
                    ~milk += 1
                    _->main
    ==dadEnter
    Just then the door of your barn busts open. Its your dad, you run towards him.
    ->END
    
    
    
    
    
    
    0