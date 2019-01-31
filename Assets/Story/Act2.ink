== ACT2 ==
->afterDinner
== afterDinner ==
//needs kari added
#v_clearScreen
#v_act2/outsideHouse
#s_audio/FootStep(Outside)_s
:kari:"Did you enjoy dinner?":
*   [Yes] :player: "Yeah. Besides the smell.":
*   [No] :player: "How can you stand eating that fish? I feel like I'll never get the smell out of my nose":
- Kari laughed. 
    :kari:"We eat that almost every day though. I like it best when it's thicker. Anyway, I want to show you something. Follow me over here!":
    Before Alex could protest, Kari sped off toward the grassy hills behind the house. She figured she might as well follow.
*   ^I:J,3:5 ^[Follow]->enterwood1

== enterwood1 ==
#v_act2/forest5
#v_enter_act2/forrest5KARI
#s_audio/FootStep(Outside)_s
Alex cleared the hill and couldn't believe how wide open everything was. The hills seemed to roll on for miles and miles, but it all seemed within reach.
:kari:"This way, cousin! It's not too far!": Kari ran along a brook and Alex tried to keep up.
*   ^A:B,6:7^[Follow]->campfire

======== campfire ========
#v_act2/meadowcampfire
#v_enter_act2/entranceKARI
#s_audio/Piano LeadUp_m
~coin +=1
Alex wasn't sure how far she'd gone or how long it took by the time the cousins arrived at their destination. A lean-to and some logs sat around a fire pit. Kari stood proudly in the center of the campsite.

:kari:"We made it, cousin! This is a very special place. Grandfather and I come here to pray, and sometimes camp! A few times a year, we gather with his friends for some bigger celebrations. There is always music and singing and good food! We used to do it more often. There used to be more people too.":->cousinConvo_campfire
== cousinConvo_campfire ==
*   [Who else comes here?] :player:"Who else comes here?": 

:kari:"Well, it used to be Aunt Sigrún, Grandfather, Grandmother, Einar, Ólafur, Helga, Björn, Margrét, Ásta, Brynja, and Audhumbla.": Kari looked around, some apprehension in his eyes. :kari:"Now it’s just me, Audhumbla, and Grandfather.":->cousinConvo_campfire
*   [Camping?] :player:"Camping?": she asked. 
:kari:"It's so nice and fun. We stay here for a few days and just relax and pray.":
->cousinConvo_campfire
*   [Celebrations?] :player:"Celebrations?": 
    :kari:"Well, we perform the blót here, and make an offering to the gods or wights. On holidays we do one for all the gods.":
    **  [How does it work?] :player:"How does it work?": she asked.
    -> wightPower
== wightPower ==
#s_audio/ThunderRain
- Kari pulls out a piece of bread he’s bitten into the shape of a horse
:kari:"Do you want to meet one of the land wights?":
*   [Alex wanted to]
:player:"Yeah.":
:kari:"Okay. They can be mischievous, so we have to be very polite.":
*   [Alex asked if they were real]
:player:"Are they real?":
:kari:"Of course they're real!":
*   [Alex was scared]
:kari:"I promise they won’t hurt you, it’ll be okay! We just have to remember to be super polite. They are a bit mischievous.":
- :kari:"Here,": he said, :kari:"take a bite of this.:" 

*   [Take a bite]
    Alex bit off a chunk of the bread horse and handed it back to Kari, who chewed off one of the legs.
*   [Refuse]
:player:"Um, I don't think I want to. My stomach hurts.":
:kari:"Oh, that's okay. I'll take your bite,": he said. Kari then chewed off two of the bread horse's legs.

-:kari:"Now, we put our wishes into the bread. You go first. You don't have to tell me what you wish for.":
*   [I wish I was home]
*   [I wish my parents would stop fighting]
*   [I wish I knew why my parents left this place]
- :player:"Okay, I made my wish.":

:kari:"I always wish for the wights to come back to our house to protect us. Okay, come here.":

Kari led Alex over to a big rock. He got on his knees next to it and Alex followed. He started to speak in Icelandic. From what Alex knew of the language, it sounded like he was asking permission for something and introducing her. Kari finished, and the two stared at the rock in silence.
:player:"Is something going to-":

Sure enough, the biggest lizard Alex had ever seen crawled out from under the rock and sat on the top, eating the bread right out of Kari's hand. Alex couldn't take her eyes off of it.

:kari:"I call this one Smorble,": he whispered.

The lizard finished the bread, and started to stare right into Kari's eyes. Kari stared back. 
:kari:"I think he wants to show us something.":

It turned to Alex. Alex forced herself to meet its gaze. Slowly, it crawled off the rock and onto Alex's leg.

*   [Remain calm] Alex took a deep breath and let the lizard crawl up her leg onto her stomach. From there, it seemed to stare even deeper into her soul. She kept her cool, and eventually it crawled down off of her, and started to slink towards the tree line.

:kari:"We should follow it. Come on Alex!":
*   [Freak out] Alex couldn't handle the lizard on her body and frantically shook it off with a yelp.
:kari:"Alex!":
The lizard fell to the ground and started to crawl away towards the tree line.
:kari:"Come on, it's leaving, we have to follow it!":
- Alex wasn't sure this was a good idea. She had already gone much farther than her parents would have liked. On the other hand, Alex was curious to see what would happen if they followed this lizard.

*   [Alex followed Kari] Kari had made up his mind, and Alex felt safer with him than without him. She started to chase after him.
~followedKari = true
->entrance
*   [Alex turned back] Kari had made up his mind, and Alex knew that to protest would be pointless. Her parents would already be mad at her for being gone so long, following Kari now would be too much. She figured she could get back to Grandfather's house if she followed the stream. 
~followedKari = false
-> entrance

//IF YOU FOLLOW KARI:
//He appears in the next screen, but not in the one after. Text says you can still hear him but you can't tell from where. You call his name and he calls back, but you're unsure. Once you get to the stream, the text is like well, you decide to go home.

//IF YOU DON'T FOLLOW KARI:
//jump into ze puzzle back, kari doesn't appear



//announce our greetings and our intentions, and to make an offering to them for their hospitality
//To meet with the land-wights, find such a boulder or go to a waterfall or the peak of a hill. Take some food and drink; hallow it to them, eating some yourself and leaving some; then tell them who you are and what you want. Again, remember that politeness is the most important thing in dealing with such wights; they are not like the demons of ceremonial magic, who can (and must!) be dominated and harshly commanded in specific detail, but rather they are free beings who have no reason to wish you ill – or even to deny their help to you – unless you manage to personally offend them.

//This part of the rite is performed when you are working in your home or other such place where everyday life usually takes place. It serves to create a ritual space in which you may work more directly with the god /esses and ghosts – a place that stands half in the Middle-Garth, half in the worlds beyond, and into which no unholy or unfriendly wight may tread; on a psychological level, it heightens your awareness of things of the soul and blocks out distractions which might interfere with your communion with the god/esses. For this reason, the hallowing is not necessary in any of the places which are considered wih-steads (see the chapter on Holy Steads). The hallowing, indeed, can be seen as creating a temporary garth of the soul around the space where the ritual is taking place.
//In many ways the hallowing is similar to the circle-casting of the magician, but the level of energy is not usually so intense, nor does a great danger exist if the bounds of the garth are crossed during a religious rite. Indeed, as you will notice, several of the dramatic rites for the greater seasonal blessings in this book specifically integrate a figure bringing a holy gift from the realms without into the community of folk inside. In the rituals here, the figures embodied are Wodan (bearing the mead of poetry and leading the ghosts of the kin) and the Spring Bride (Eostre/Idunn, bringing the golden apples of new life). In the Eddic myths, Thunar also fares to Etin-Home to gain or reclaim treasures for the god/esses (such as Ægir's brewing-cauldron and his own hammer); any of these tales can be used as models on which to build a similar dramatic rite.
//The Hallowing which I describe in this book – the tracing of the Hammer-sign at the ættir – is the simplest form possible. The four-quartered circle was not unknown to the Germanic folk – it appears, for instance, in Anglo-Saxon charm spells where the names of the evangelists set at the quarters have probably been substituted by Christian writers for the names of the heathen god/esses. Since the frithgarth is firstly an affair of the Wans, you might choose to call upon them at the quarters thus: Fro Ing in the east, the Frowe in the south, Njördhr in the west, Nerthus in the north. Otherwise, if you wish to make a rite which is specifically given to the Ases, you can call upon Thunar in the east, Tiw in the south, Heimdallr in the west, and Wodan in the north

//kari has a horse he made out of bread from dinner


== act2Home_outside ==
//needs parents
#v_clearScreen
#s_audio/WAVESMENUSPROLOGUE_m
#v_act2/outsideHouseThird

Alex emerged from the trees and her parents ran to embrace her. She'd never seen them this upset. Dad was seemingly unable to speak.
:mom:"Are you okay?":
*   [Yes] :player:"Yeah, I think so":
*   [No] :player:"I was scared.":
- :mom: "You look hurt... where is your cousin?":
{followedKari == false} ->whereKariLeft
{followedKari == true} ->whereKariFollowed
=whereKariFollowed
*   [I lost him] :player: "It's all my fault, I tried to follow him but I couldn't keep up.":
*   [He just disappeared] :player:"I ran after him and he just vanished":
*   [I don't know] :player:"I don't know!":
- ->momScaredCont
=whereKariLeft
*   [I left him] :player:"He ran off... I didn't follow him because you told me not to go far":
*   [I don't know] :player:"I don't know!":
- ->momScaredCont
=momScaredCont
- :mom:"Okay, okay. We're going to go look for him. Just go to bed and we'll find Kari.":
*   [Okay] :player:"Okay.":
*   [I want to help] :player:"I want to help." :
- :mom: "We need you to stay here. I left some clothes for you in Kari's room. Just get into bed, don't go anywhere. We'll be back soon, krútt.":
//add something here about your emotions that makes you stay
*   [Go inside]->act2Home_inside
== act2Home_inside ==
//ART PROBLEM
//needs just grandpa
#v_act2/insideHouseJustGramps
Alex walked inside with Grandpa. 
:grandpa: "Just you and me now, child.":
*   [Are you concerned?]:player:"Are you scared about Kari?": you ask.
:grandpa:"Kari could not have gotten far. He is too weak. Here.":
*   [Do you know where Kari is?] :player:"I'm sure he is just out playing. He knows the area well, and does not have the determination to run away. Here.":
*   [Okay]:player:"Okay.":
//rewrite this based on act2 damage
~Stamina += 15
- Grandpa wets a cloth in the sink and cleans you up a bit. He gives you a bandage.
:grandpa:"Okay, time for bed. Go upstairs.":
*   ^H:H,2:5 ^[Go to bed]->act2Home_bedroom
== act2Home_bedroom ==
//get rid of kari, fade in mom
#v_clearScreen
#v_act2/bedroomEMPTY
Alex was exhausted. Her mom had left some clothes for her, as promised.

*   ^A:F,5:8 ^[Alex changed and tried to sleep]

Alex changed and tried to sleep. Not knowing when her parents would be back, Alex tossed and turned for the next few hours, hoping Kari would come through the door.
#v_fadeOut
#t_speedDown
#t_speedDown
- :mom: "Krútt... wake up...":
#t_reset
#v_enter_act2/fadedMOM
Alex's mother shook her awake. 
#v_fadeIn
She couldn't tell what time it was, but she knew she asleep longer than her mom told her she would be.

:mom: "We went to the police across the bay. They're going to come in the morning to search for Kari but in the meantime Dad and I are going to keep looking. I left you some food in the fridge. Please stay here. I love you. ":
#v_fadeOut

//fade out
* Alex drifted back to sleep. -> ACT3