VAR hasBerries = false
VAR eatenBerries = false
VAR givenBerries = false
VAR stamina = 100
VAR hasBucket = false
VAR cow1Soothed =  false
VAR milk = 0
VAR cow2Soothed = false
VAR cow3Soothed = false
VAR cow1milked = false
VAR cow2milked = false
VAR cow3milked = false
=== west ===
#t_reset
You have been told to milk a cow. You don't even know how to milk a cow, but Grandpa seemed angry at you so its best to go do it. The fields around you feel quiet and empty.
    ->lady
== lady ==
= intro
#s_audio/COW OUTSIDE
#v_act4/barnEx
You can still see Grandpa and Audi talking through the window. Every once in a while, he will glance over at you and give you a look you don't understand. With the barn behind you, you are disgusted by the smell of manure drifting through the air.
->main

= main
    + [Examine Grandpa] He feels like a stranger to you now. You've only known him for a a day or so and he already hates you. Why? What did you do? He changed so quickly, it really scares you. Now you have to milk a cow? You don't even know how to milk a cow! You need to be looking for Kari but you're too scared to tell him that.  
    ->main
    
    + [Examine Audi] You would talk to her but you don't want get close to Grandpa right now. No one here will help. Your parents are gone, your friends are miles away, your Grandpa refuses to talk to you, and you cousin has dissapeared. You just feel so alone.
    ->main

    + [Go to pasture]You head towards the cow smell reluctantly. You don't want to do this, your stomach churns at the thought of what you have to do. ->pasture
    +{milk > 2} [Show Grandpa] -> grandpayelling
        
== pasture ==
= intro
#v_clearScreen
You stop at foot of some rolling hills. You are astonished by the size of this farm. You see cows roaming all around, lazily chewing grass. Speckled bushes sprout wildly along the field to your right. ->main
= main
#v_act4/hillBushes
    + {not eatenBerries or not hasBerries} ^H:J,7:9 ^[Examine bushes] ->bushes
    + ^A:F,6:7 ^A:D,8:10 ^E,8^[Examine cow]
        {cow1milked : This was a nice cow -> main}
        {hasBucket: ->cow1}
        You don't feel like your ready to do that yet. 
        ->main
    +[Go forward] ->pasture2
    +[Go right] ->pasture3
    +[Go back] -> lady
    
= bushes
    You look at the bushes and find brightly colored berries hanging from the branches. 
    *[Eat Berries] You shove some berries in your mouth. Their sweet taste make you feel a little better and they make you feel light headed.
    ~stamina += 10
    ~eatenBerries = true
    ->bushes
    
    *[Put Berries in Pocket] You pocket some berries for later, they have to be here for a reason. 
    ~hasBerries = true
    ->bushes
    
    +[Step Away] You remind yourself of the task at hand and decide to move on. 
    ->main

= cow1
    You feel the body heat of the cow on your skin. It exhales loudly once you crouch down. You seem more nervous than it does. Its ear seem to twitch constantly and its fur looks surprisingly soft.
    //write text in the above to indicate doing either petting or scratching
    +^A:D,6:7 ^[Pet the Cow]
        Your hands tremble a little bit as you pet the cow. You have never seen an animal of this size in person before. This whole trip has been a stark change from your New York home, leaving you nervous and uncomphotable. The cow, on the other hand, seems at ease even going so far as to move closer to you.  
            ~cow1Soothed = true
            ->cow1
    
    +^E:F,6:7 ^[Scratch Behind Its Ears]
        You try scratching behind her ears, like a dog. It snorts furiously and trashs her head angrily. This scares you even more. You don't know how to approach these animals. If you can't even soothe them properly, how are you going to milk them?
            ~stamina -= 5
            ~cow1Soothed = false
            ->cow1
    
    + { not cow1milked}^A:E,9:10 ^[Milk Cow]
        {cow1Soothed and hasBucket:
        ~milk += 1
        }
        {cow1Soothed and hasBucket: 
            ~cow1milked = true
        }
        {hasBucket and cow1Soothed: You pull out the bucket, sit down, and stare at the udders. You don't like how they feel in your hands. They're fleshy, moist, and warm to the touch. You feel sick every time you squeeze them. You try not to gag while the bucket fills. ->main}
        {not hasBucket: You are not prepared to do that right now. ->cow1}
        {not cow1Soothed: You reach down and the cow stomps her foot. You are scared to go any further. ->cow1}
    + [Step Away] -> main
    
    
== pasture2 ==
= intro
Audi's property goes on for what seemes like miles. You have yet to even see a fence anywhere. The cows seem to just wander where they please.   
 ->main
= main
#v_act4/hill
    * ^A:J,1:4^[Examine sky]
        The clouds are thin, as if they were smeared across the sky. It looks like its getting late. You are cold, you want to go home.
        ->main
        
    + ^H:J,5:10^[Examine cow]
        {cow2milked: This was also a nice cow. -> main}
        {hasBucket: ->cow2} 
        You don't feel like your ready to do that yet. 
        ->main
        
    +[Go back] ->pasture

= cow2
    You see the cow periodically rustle through the bushes looking for something. It immediately stops and stares at you when you approach. It looks at you expectantly, mooing directly at you.  
    //explain what you do with the cow down here
    + {not cow2Soothed} ^H:J,5:10^[Give The Cow What It Wants]
        {hasBerries: You take some berries out of your pocket to feed the cow some berries. You feel its tounge brush up against your hand as it takes them. It nuzzles your hand once it finishes chewing.}
        {hasBerries:
            ~cow2Soothed = true
        }
        {not hasBerries: You don't know what you can do.}
        ->cow2
    
    + {not cow2milked and cow2Soothed} ^H:J,5:10^[Milk Cow]
        {cow2Soothed and hasBucket:
            ~cow2milked = true
        }
        {hasBucket and cow2Soothed:
            ~milk += 1
        }
        {hasBucket and cow2Soothed: You tug on the udders hoping to get this over with as soon as possible. The cow cries out in pain and knocks you to the ground when you get up you see the bucket contains drops of blood. ->main}
        {not hasBucket: You are not prepared to do that right now. ->cow2}
        {not cow2Soothed:
            ~stamina -= 5
        }
        {not cow2Soothed: You get closer and the cow squeals and stomps off angrily, stepping on your foot on the way out. ->cow2}
    + [Step Away] -> main
    
    
    
    
== pasture3 ==
= intro
Your feet start to hurt again. You haven't really had a chance to fully recover from yesterday. Everything is moving so fast but it feels like you have made so little progress in finding your cousin.  
 ->main
 
= main
#v_act4/hillBucket
    * ^B:C,8:10^[Examine bucket]
        You see a metal bucket just lying on the floor. It is dented all over and a little dirty but it should do the trick.
        ~hasBucket = true  
        ->main
        
    + ^F:H,6:9 ^E:F,8:10 ^[Examine cow]
        {cow3milked: This was the nicest cow of all. -> main}
        {hasBucket: ->cow3} 
        You don't feel like your ready to do that yet. 
        ->main
        
    +[Go back] ->pasture

= cow3
    This cow fidgets constantly, sporadically swatting its tail and kicking its feet.  

    + ^E:F,9:10 ^[Talk to the cow]
        You apologize for what you are about to do. You don't want to hurt it and your not here by choice. It seems to stop kicking and stay still.
        ->cow3

    + {not cow3milked} ^F:J,6:8^[Milk Cow]
        {hasBucket:
        ~cow1milked = true
        }
        {not hasBucket: You are not prepared to do that right now. ->cow3}
        ->cowtail
    + [Step Away] -> main
        
    = cowtail
        You sit down to milk the cow and the cow turns away. You try to move with it, being careful of its feet. Once you finally settle it down, the cow slaps you in the face with its tail. You move around hoping to get out of its reach but the cow moves with you. You start to get angry.
            ~cow3milked = true
                *[Swat the tail away] You get frustrated and slap the tail out of your face. This startles the cow and it kicks its hind legs. They narrowly miss you. But if it hadn't you would have been seriously injured. You hastily squeeze the milk you need ignoring every swat in the face.
                    ~stamina -= 15
                    ~milk += 1
                    ->main
                    
                *[Ignore it] As best you can you try to ignore the tail in your face. Its hairs are coarse scratching up your face, getting in your eyes and mouth. Your face itches after every hit and you start to notice how bad this cow smells. You can hardly see, sometimes your hands jerk in reaction and milk sprays all over you. Despite this you get your milk even if most of it ended up on you. 
                    ~stamina -= 10
                    ~milk += 1
                    ->main