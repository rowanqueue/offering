== ACT4 ==
#v_clearScreen
#s_audio/Farm_m
#v_act4/barnEx
//throw grandpa and audi here
You drive up to a decrepit old farm. It’s definitely not Dad’s parents’ place by the water. Grandpa answers your question before you ask it. 
~coin +=1
:grandpa: “This is Audhumbla Ívarsdóttir’s house. She is the only remaining member of my kindred. Everyone else abandoned us to live with comforts, they abandoned the ways of our forefathers. I want you to see the life that we have.”:

*    [What about other grandparents?] :player:”What about my other grandparents?”: you ask.
*    [Are we going to stay here for long?] :grandpa:”That is up to you.”:

-You pull in and get out of the car. It takes Grandpa a second. You both walk over to the house and Grandpa knocks on her door.

:audie:”Halló Jorgur!“: you hear from inside.
:grandpa: “Halló Audie. I have a visitor with me.”
//door opens and audie comes out
Suddenly the door swings open, and Audhumbla towers over you. She’s younger than Grandpa but still pretty old. 
:audie:”You must be the one I have been waiting to meet. Hmph. You look nothing like your grandfather.”:
:grandpa:”This one has been out exploring. She thinks she’s one of the kindred.”:
She smiles. 
:audie: ”I guess she’ll have to work like one. Go on, child. Go...:
#t_speedDown
#t_speedDown
:audie:milk the cows.”:

Grandpa heads inside and they slam the door in your face.
-> west
== grandpayelling ==
#v_clearScreen
You knock on the door and show Grandpa the bucket of milk. He looks at you and looks at the bucket and snarls. 
        :grandpa: "What is this? You call this milk? You are useless! Just like the rest of them, useless burdens on our town! Look at this, its pink! How dare you hurt those cows with your stupid city boy hands. Did you even strip them? Are you trying to make me sick?"
        *[Try to explain] You stammer trying to find a response but you're too scared. You don't know what hes capable of. You don't want him to hurt you. 
    - :grandpa: "Useless, stupid boy! I'll show you how someone of my blood should milk a cow."
        He pulls you by the ear and you yelp in pain. He does not let go. You can feel the blood course through your veins. You are terrified. You have trouble breathing and your eyesight is getting blurry. 
        *[Cry out] You try to call out for someone to help but you can't get the words out.
    //throw grandpa, audi in this motherfucker
    #v_act4/barnInt
    - By the time you reach the barn tears stream down your face. You feel light headed. He continues to yell at you, but this time its mostly in icelandic. He shoves you too the ground picks, you up by the collar, and pushes you toward a cow. You panic, you feel trapped with no one to help you. You feel like blacking out.
        :grandpa: "You want to be a real man of iceland use this!" He pulls out a hideous creature out of a nearby crate. It looks like a long, hairy snake made of wrapped in old, crusty fur. On its two ends are wrinkled and swolen screaming faces. Their lips are cracked and swolen, its mouth gaping wide. Grandpa wiggles it around infront of you and you see its beady eyes glazed over with puss. 
        * [Scream] You scream and Grandpa laughs. 
    - :grandpa: "Whats the matter? You've never seen the Tilberi before? What have you parents been teaching you? This is our culture! This is how we use to milk the cows! You coward, children here are raised properly, to not fear such silly things."
        He shoves the Tilberi in your hands and you panic. You don't know whats real and whats fake any more. You breath heavily, unable to tell if hes joking or not. 
        * [Shut your eyes] You squeeze your eyes shut and wish to be anywhere else but here. ->dadEnter
== dadEnter ==
    Just then the door of your barn busts open. Its your dad, you run towards him.
    ->END