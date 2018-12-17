== ACT4 ==
#v_clearScreen
#s_audio/Farm_m
#v_act4/westDoorOpen
//throw grandpa and audi here
You drive up to a decrepit old farm. It’s definitely not Dad’s parents’ place by the water. Grandpa answers your question before you ask it. 
~coin +=1
:grandpa: “This is Audhumbla Ívarsdóttir’s house. She is the only remaining member of my kindred. Everyone else abandoned us to live with comforts, they abandoned the ways of our forefathers. I want you to see the life that we have.”:

*    [What about other grandparents?] :player:”What about my other grandparents?”: you ask.
    :grandpa:”They can wait. I don’t care to see them. It’s been two years since I talked to them last.”:
*    [Are we going to stay here for long?] :grandpa:”That is up to you.”:

-You pull in and get out of the car. It takes Grandpa a second. You both walk over to the house and Grandpa knocks on her door.

:audie:”Halló Jorgur“: you hear from inside.
:grandpa: “Halló Audie. [I have a visitor with me.]”
//door opens and audie comes out
Suddenly the door swings open, and Audhumbla towers over you. She’s younger than Grandpa but still pretty old. She looks you up and down for a long time.
:audie:”You are  the one I have been waiting to meet... Hmph. You look nothing like your grandfather.”:
:grandpa:”This one has been out exploring. She thinks she’s one of the kindred.”:
She smiles. 
:audie: ”I guess she’ll have to work like one. Go on, child. Go...:
#t_speedDown
#t_speedDown
:audie:milk the cows.”:

Grandpa heads inside and they slam the door in your face, laughing.
-> west
== grandpayelling ==
#v_clearScreen
#v_act4/westDoorOpen
You knock on the door and show Grandpa the bucket of milk. He looks at you and looks at the bucket and snarls. 
        :grandpa: "What is this? You call this milk? You are useless! Just like the rest of them, useless burdens on our town! Look at this, its pink! How dare you hurt those cows with your stupid city boy hands. Did you even strip them? Are you trying to make me sick?"
        *[Try to explain] You stammer trying to find a response but you're too scared. You don't know what he's capable of. You don't want him to hurt you. 
    - :grandpa: "Useless, stupid boy! I'll show you how someone of my blood should milk a cow."
    Audhumbla calls from inside - :audy:"That's enough, Jorgur. Bring the boy inside!":
    Grandpa snaps back, :grandpa:"Quiet Audhumbla! This is my grandchild and I will do as I please.":
        He pulls you by the ear and you yelp in pain. He does not let go. You have trouble breathing and your eyesight is getting blurry. You are terrified.  
        *[Cry out] You try to call out for someone to help but you can't get the words out.
    //throw grandpa, audi in this motherfucker
<<<<<<< HEAD
    #v_act4/barnInt
    - By the time you reach the barn tears stream down your face. You feel light headed. He continues to yell at you, now mostly in icelandic. He shoves you too the ground, picks you up by the collar, and pushes you toward a cow. You panic, trapped with no one to help you. You feel like blacking out.
        :grandpa: "You want to be a real man of Iceland use this!" He pulls out a hideous creature out of a nearby crate. It looks like a long, hairy snake made of wrapped in old, crusty fur. On its two ends are wrinkled and swolen screaming faces. Their lips are cracked and swolen, its mouth gaping wide. Grandpa wiggles it around infront of you and you see its beady eyes glazed over with puss. 
=======
    #v_act4/inBarnOne
    - By the time you reach the barn tears stream down your face. You feel light headed. He continues to yell at you, but this time its mostly in icelandic. He shoves you too the ground picks, you up by the collar, and pushes you toward a cow. You panic, you feel trapped with no one to help you. You feel like blacking out.
        :grandpa: "You want to be a real man of iceland use this!" He pulls out a hideous creature out of a nearby crate. It looks like a long, hairy snake made of wrapped in old, crusty fur. On its two ends are wrinkled and swolen screaming faces. Their lips are cracked and swolen, its mouth gaping wide. Grandpa wiggles it around infront of you and you see its beady eyes glazed over with puss. 
        #v_act4/inBarnTwo
>>>>>>> 95b6881e00952d04f6bb0e1c7e9173039f54140c
        * [Scream] You scream and Grandpa laughs. 
    - :grandpa: "What's the matter? You've never seen a Tilberi before? What have you parents been teaching you? This is our culture! This is how we use to milk the cows! You coward, children here are raised properly, to not fear such silly things."
        He shoves the Tilberi in your hands and you panic. You don't know whats real and whats fake any more. You breath heavily, unable to tell if he's joking or not. 
        * [Shut your eyes] You squeeze your eyes shut and wish to be anywhere else but here. 
- Suddenly Grandpa perks up and shushes you. He lets the Tilberi go and it slithers away and begins to suckle on the cow. Grandpa hides behind the door.->dadEnter
== dadEnter ==
<<<<<<< HEAD
You wait, shocked and unable to move. He turns to you and grins. :grandpa:"Scream if you want child.": 

The door of your barn busts open. It's your dad, you call out to him.

:dad:"There you are! Oh no... What did he do?!": He starts to move towards you, you try to warn him but it's too late.
//add variable that gives you more time with audy
Grandpa swings back and knocks out your father with a shovel. 
:player:"Dad!":
Grandpa laughs, winded. :grandpa:"You're not going anywhere,": he wheezes. His hands are on his knees. You have to act now.
*   [Sprint for the door] You make a break for the door. He tries to lunge at you but he misses. 
*   [Knock him over] You run at Grandpa full tilt, lower your shoulder, and try to knock him off his feet. He tries to grab you but you manage to bring him to the ground.
- You barely make it to the door.
->barnAudy
==barnAudy==
You tear out of the barn and run straight into Audhumbla. She looks down at you with fear in her eyes.
:audie:"I'm so sorry,": she croaks. She means it. :audy:"I didn't think it would go this far, I...":
*   [Get out of my way!]
*   [Then help me!]
- :audie:"Wait okay! To the south, down that road... some old members of the kindred run a ski mountain - find them!":
With no time to think, you take off towards the mountains.
->mountain1
=======
    Just then the door of your barn busts open. Its your dad, you run towards him.
    ->ACT5
>>>>>>> 95b6881e00952d04f6bb0e1c7e9173039f54140c
