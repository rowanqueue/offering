== ACT4 ==
#v_clearScreen
#s_audio/Farm_m
#v_act4/westDoorOpen
//throw grandpa and audi here
Jorgur drove up to an old farm. 
~coin +=1
:grandpa: “This is Audhumbla Ívarsdóttir’s house. She is the only remaining member of my kindred. Everyone else abandoned us to live with comforts, they abandoned the ways of our forefathers. I want you to see the life that we have.”:

*    [What about other grandparents?] :player:”What about my other grandparents?”: Alex asked.
    :grandpa:”They can wait.”:
*    [Are we going to stay here for long?] :grandpa:”That is up to you.”:

-Jorgur pulled in and got out of the car. It took him a second. You both walk over to the house and Grandpa knocked on her door.

:audie:"Halló, Jorgur,": Alex heard from inside.
:grandpa: “Halló, Audie. [I have a visitor with me.]”
//door opens and audie comes out
Suddenly the door swung open, and Audhumbla appeared before Alex. She was younger than Jorgur but still pretty old. She looked Alex up and down for a long time.
:audie:”You are the one I have been waiting to meet... Hm. You look nothing like your grandfather.”:
:grandpa:”This one has been out exploring. She thinks she’s one of the kindred.”:
She smiled. 
:audie: ”I guess she’ll have to work like one. Go on, child. Go...:
#t_speedDown
#t_speedDown
:audie:milk the cows.”:

#v_act4/barnEx
Grandpa heads inside and they slam the door in your face.
-> west
== grandpayelling ==
#v_clearScreen
Alex knocked on the door and showed Grandpa the bucket of milk. He looks at you and looks at the bucket and snarled. 
        :grandpa: "What is this? You call this milk? You are useless! Just like the rest of them, useless burdens on our town! Look at this, it's pink! Blood! How dare you hurt those cows with your stupid city girl hands. Did you even strip them? Are you trying to make me sick?"
        *[Try to explain] Alex stammered trying to find a response but was too scared. 
    - :grandpa: "Useless, stupid girl! I'll show you how someone of my family should milk a cow."
    Audhumbla calls from inside - :audie:"That's enough, Jorgur. Bring her inside!":
    Grandpa snapped back, :grandpa:"Quiet! This is my grandchild and I will do as I please.":
        He pulled Alex by the ear and she yelped in pain. He did not let go. She pulled against his grip, but he was shockingly strong
        *[Cry out] Alex tried to call out for someone to help but couldn't get the words out as she was jostled around.
    //throw grandpa, audi in this motherfucker
    #v_act4/inBarnOne
    - By the time they reached the barn tears were streaming down Alex's face. She felt light-headed. Jorgur shoved her to the ground, picked her up by the collar, and pushed her toward a cow. 
    #v_act4/inBarnTwo
        :grandpa: "You want to be a part of the folk? Use this!" He pulled a hideous, writhing creature out of a nearby crate. It looked like a snake made of matted fur. On its two ends were wrinkled and swollen faces, frozen in screams, their lips cracked, mouths gaping wide. Grandpa wiggled it in front of Alex and its beady eyes glazed over with pus. 
        * [Scream] Alex screamed. 
    - :grandpa: "What's the matter? You've never seen a Tilberi before? What have your parents been teaching you? This is our culture! This is how our ancestors milked the cows."
        Jorgur shoved the Tilberi in her hands. She could no longer tell if this was real.
        * [Shut your eyes] Alex squeezed her eyes shut and wished to be anywhere else but here. 
- Suddenly Grandpa looked up and shushed her. He let the Tilberi go and it slithered away to suckle on a cow. Grandpa pressed himself against the wall, out of view behind the door.->dadEnter
== dadEnter ==
Alex waited, shocked and unable to move. Jorgur turned to her and grinned, his fist wrapped around a shovel.
#v_act4/inBarnThree
The door of the barn burst open to reveal Alex's father Einar.

:dad:"There you are! Oh no... What did he do?!": Alex tried to warn him, but it was too late.
//add variable that gives you more time with audy
Jorgur stepped forward, lifting the shovel over his head, and let it come down with all his force on the back of Einar’s skull. He collapsed.
#v_act4/inBarnFour
:player:"Dad!":
Jorgur laughed, winded. :grandpa:"You're not going anywhere,": he wheezes. 
*   [Alex sprinted for the door] Terrified, Alex made a break for the door. Jogur grabbed her arm in an attempt to stop her, but she yanked herself free and ran for her life.
*   [Alex ran to her father] Alex ran to Einar's side. He was still breathing but knocked out cold. Jorgur grabbed a hold of Alex before she could do anything. She broke free.
- Alex barely made it to the door.
->barnAudy
==barnAudy==
Alex tore out of the barn and ran straight into Audhumbla. She looked down at you with fear in her eyes.
:audie:"I'm so sorry,": she croaked. She meant it. :audy:"I didn't think it would go this far, I...":
*   [Get out of my way!]
*   [Then help me!]
- :audie:"To the south, down that road... some old members of the kindred run a ski mountain - find them!":
With no time to think, Alex took off toward the mountains.

->ACT5
