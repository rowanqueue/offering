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
Alex looked around, the fields around her feeling quiet and empty.
    ->lady
== lady ==
= intro
#s_act4/Audio/COW OUTSIDE
#s_stop_m
#v_act4/barnExterior
Alex could still see Grandfather and Audi talking through the window. Every once in a while, he would glance over at her and gave her a look she didn't understand. With the barn behind her, she was disgusted by the smell of manure drifting through the air.
She didn't even know how to milk a cow, but to protest would be pointless. She rolled her sleeves up.
->main

= main
    * [Alex examined her Grandfather] Alex realized that he felt like a stranger to her now. She had only known him for a day or so and he already hated her. Why? What did she do? He changed so quickly, it really scared her. Now she had to milk a cow? She didn't even know how to milk a cow! She needed to be looking for Kari but she was too scared to tell him that.  
    ->main
    
    //+ [Examine Audi] You would talk to her but you don't want get close to Grandpa right now. No one here will help. Your parents are gone, your friends are miles away, your Grandpa refuses to talk to you, and you cousin has dissapeared. You just feel so alone.
    //->main
    + [Alex went to the pasture]She headed towards the cow smell reluctantly. She didn't want to do this, her stomach churned at the thought of what she had to do. ->pasture
    +{cow1milked and cow2milked and cow3milked} [Alex showed her Grandfather the milk] -> grandpayelling
        
== pasture ==
= intro
#v_clearScreen
#v_act4/pasture1
#v_exit
She stopped at the foot of some rolling hills. She was astonished by the size of this farm. She saw cows roaming all around, lazily chewing grass. Speckled bushes sprouted wildly along the field to her right. ->main
= main
    + {not eatenBerries or not hasBerries} ^H:J,7:9 ^[Examine bushes] ->bushes
    + ^A:F,6:7 ^A:D,8:10 ^E,8^[Examine cow]
        {cow1milked : This was a nice cow -> main}
        {hasBucket: ->cow1} She didn't feel like she was ready to do that yet. ->main
    +[Alex went forward] ->pasture2
    +[Alex went right] ->pasture3
    +[Alex headed back to the barn.] -> lady
    
= bushes
    Alex looked at the bushes and found brightly colored berries hanging from the branches. 
    *[Alex ate some berries] Alex shoved some berries in her mouth. Their sweet taste made her feel a little better and they made her feel light headed.
    ~stamina += 10
    ~eatenBerries = true
    ->bushes
    
    *[Alex put some berries in her pocket] Alex pocketed some berries for later, they had to be here for a reason, right?
    ~hasBerries = true
    ->bushes
    *->main

= cow1
    Alex felt the body heat of the cow on her skin. It exhaled loudly once she crouched down. It seemed more nervous than she did, but she could barely believe it. 
    //write text in the above to indicate doing either petting or scratching
    +[Alex pet the cow]
        Alex's hands trembled a little bit as she pet the cow. She had never seen an animal of this size in person before. This whole trip had been a stark change from her New York home, leaving her nervous and uncompfortable. The cow, on the other hand, seemed at ease even going so far as to move closer to her.  
            ~cow1Soothed = true
            ->cow1
    
    *[Alex scratched behind its ears]
        Alex tried scratching behind her ears, like a dog. It snorted furiously and thrashed her head angrily. This scared her even more. She didn't know how to approach these animals. If she couldn't even soothe them properly, how was she going to milk them?
            ~stamina -= 5
            ~cow1Soothed = false
            ->cow1
    
    + { not cow1milked}[Alex milked the cow]
        {cow1Soothed and hasBucket:
        ~milk += 1
        }
        {cow1Soothed and hasBucket: 
            ~cow1milked = true
        }
        {hasBucket and cow1Soothed: She pulled out the bucket, sat down, and stared at the udders. She didn't like how they felt in her hands. They were fleshy, moist, and warm to the touch. She felt sick every time she squeezed them. Alex tried not to gag while the bucket filled. ->main}
        {not hasBucket: She was not prepared to do that right now. ->cow1}
        {not cow1Soothed: She reached down and the cow stomped her foot. She was scared to go any further. ->cow1}
    *-> main
    
    
== pasture2 ==
= intro
#v_act4/pasture2
#v_exit
Audie's property went on for what seemed like miles. She had yet to even see a fence anywhere. The cows seemed to just wander where they pleased.   
 ->main
= main
    * ^A:J,1:4^[Examine sky]
        The clouds were thin, as if they were smeared across the sky. It looked like it was getting late. Alex was cold, she wanted to go home.
        ->main
    + ^H:J,5:10^[Examine cow]
        {cow2milked: This was also a nice cow. -> main}
        {hasBucket: ->cow2}Alex didn't feel like she was ready to do that yet. ->main
        
    +[Alex went back] ->pasture

= cow2
    Alex saw the cow periodically rustle through the bushes looking for something. It immediately stopped and stared at her when she approached.
    //explain what you do with the cow down here
    + {not cow2Soothed}[Alex fed the cow some berries]
        {hasBerries: She took the berries out of her pocket to feed the cow. She felt its tounge brush up against her hand as it took them. It nuzzled her hand once it finished chewing.}
        {hasBerries:
            ~cow2Soothed = true
        }
        {not hasBerries: Alex wasn't sure what to can do.}
        ->cow2
    
    + {not cow2milked and cow2Soothed}[Milk Cow]
        {cow2Soothed and hasBucket:
            ~cow2milked = true
        }
        {hasBucket and cow2Soothed:
            ~milk += 1
        }
        {hasBucket and cow2Soothed: Alex tugged on the udders hoping to get this over with as soon as possible. The cow cried out in pain and knocked her to the ground. When she got up, she saw the bucket contained drops of blood. ->main}
        {not hasBucket: Alex was not prepared to do that. ->cow2}
        {not cow2Soothed:
            ~stamina -= 5
        }
        {not cow2Soothed: Alex got closer and the cow squealed and stomped off angrily, stepping on her foot on the way out. ->cow2}
    *->main
    
    
    
    
== pasture3 ==
= intro
#v_act4/pasture3
{not hasBucket: 
#v_enter_act4/bucketFade
}
{hasBucket:
#v_exit
}
Alex's feet started to hurt again. She hadn't really had a chance to fully recover from her earlier adventures. Everything was moving so fast but she felt like she had made such little progress in finding Kari.  
 ->main
 
= main
{hasBucket:
#v_exit
}
    * ^B:C,8:10^[Examine bucket]
        Alex saw a metal bucket lying on the floor. It was dented all over and a little dirty but it would do the trick.
        ~hasBucket = true  
        ->main
        
    + ^F:H,6:9 ^E:F,8:10 ^[Examine cow]
        {cow3milked: This was the nicest cow of all. -> main}
        {hasBucket: ->cow3} 
        Alex didn't feel like she was ready to do that yet. 
        ->main
        
    +[Alex went back] ->pasture

= cow3
    The cow fidgeted constantly, sporadically swatting its tail and kicking its feet.  

    +[Alex talked to the cow]
        Alex apologized for what she was about to do. She didn't want to hurt it and she wasn't here by choice. It seemed to stop kicking and stay still.
        ->cow3

    + {not cow3milked} [Milk Cow]
        {hasBucket:
        ~cow3milked = true
        }
        {not hasBucket: Alex was not prepared to do that right now. ->cow3}
        ->cowtail
    *-> main
        
    = cowtail
        Alex sat down to milk the cow and the cow turned away. She tried to move with it, being careful of its feet. Once she finally managed to settle it down, the cow slapped her in the face with its tail. She moved around hoping to get out of its reach but the cow moved with her. Alex began to get angry.
            ~cow3milked = true
                *[Alex swatted the tail away] She got frustrated and slapped the tail out of her face. This startled the cow and it kicked its hind legs. They narrowly missed hitting her in the side, but if they hadn't she would have been seriously injured. Alex hastily squeezed the milk she needed, ignoring every swat in the face.
                    ~stamina -= 15
                    ~milk += 1
                    ->main
                    
                *[Alex ignored it] As best as she could Alex tried to ignore the tail in her face. Its hairs were coarse, scratching up her face, getting in her eyes and mouth. Her face itched after every hit and she started to notice how bad the cow smelled. She could hardly see, sometimes her hands jerked in reaction and milk sprayed everywhere. Despite this she got her milk even if most of it ended up on her or the ground. 
                    ~stamina -= 10
                    ~milk += 1
                    ->main