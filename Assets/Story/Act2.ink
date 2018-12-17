== ACT2 ==
->afterDinner
== afterDinner ==
//needs kari added
#v_clearScreen
#v_act2/outsideHouse
:kari:"I'm so excited you're here! Did you have a nice dinner?":
*   [Yes] :player: "Yeah, it was really good, actually.":
*   [No] :player: "Ugh! How can you stand eating that fish? I feel like I'll never get that smell out of my nose":
- Kari laughs. 
    :kari:"Grandpa cooked my favorite meal. I want to show you something. Follow me to the trees!":
*   ^I:J,3:5 ^[Follow]->enterwood1

== enterwood1 ==
#v_act2/forest5
You've reached the foggy thicket of trees and Kari is speeding right along. 
:kari:"Come on, this way!":
*   ^A:B,6:7^[Follow]->enterwood2
== enterwood2 ==
#v_act2/forest4
:kari:"Over here!":
*   ^G:H,6:7^[Follow]->enterwood3
== enterwood3 ==
#v_act2/forest3
:kari:"Just a bit further!":
*   ^A:B,6:7 ^[Follow]->enterwood4
== enterwood4 ==
#v_act2/forest2
:kari:"We're almost there, it's just through here!":
*   ^G:H,9:10 ^[Follow]->campfire

======== campfire ========
#v_act2/meadowcampfire
#v_enter_act2/entranceKARI
#s_audio/Piano LeadUp_m
~coin +=1
The grass gives way to dirt as you reach a clearing between the trees. There is a lean-to and some logs set up as benches around a fire pit. 
:kari:"We made it, cousin! Oh, this is a very special place. Fifteen or so times a year, this is where grandpa and I gather with his friends for our the celebrations. There is always music and singing and good food! We used to do it more often. There used to be more people too.":->cousinConvo_campfire
== cousinConvo_campfire ==
*   What kind of celebrations? ->cousinConvo_campfire
*   Who else comes here?->cousinConvo_campfire
*   What happened to the other people?->cousinConvo_campfire
+ -> fuck
== fuck ==
#s_audio/ThunderRain
- :kari:"Wanna see something funny?":
*   [Examine wooden sculpture]
#v_exit
- Huh. Where did he go?
*   [Start looking for him] He's gone. 
-> entrance
== act2Home_outside ==
//needs parents
#v_clearScreen
#s_audio/WAVESMENUSPROLOGUE_m
#v_act2/outsideHouseAfter
You emerge from the trees and your parents run to you and embrace you. 
:mom:"Are you okay?":
*   [Yes] :player:"Yeah, I... I think so":
*   [No] :player:"Do I look okay?":
- :mom: "You look hurt... where is your cousin?":
*   [I lost him] :player: "It's all my fault! I tried my best to find him... but I just ended up losing him out there.":
*   [He just disappeared] :player:"I have no idea! I turned around and then he was just... gone!":
*   [I don't know] :player:"I don't know!":
- :mom:"Okay, okay. We're going to go look for him and get the police. Stay at home, just go to bed and we'll get him back.":
*   [Okay] :player:"Okay.":
*   [I want to help] :player:"I want to help." :
- :mom: "We need you to stay here. Just get into bed, Grandpa will help. We'll be back soon, krútt.":
//add something here about your emotions that makes you stay
*   [Go inside]->act2Home_inside
== act2Home_inside ==
//needs just grandpa
#v_act2/houseInterior
You walk inside with Grandpa. 
:grandpa: "Just you and me now, child. You should go to bed like your mother said.":
*   [Are you concerned?]:player:"Are you scared about Kari?": you ask.
:grandpa:"Oh, Kari is just out playing. He knows the area well, your parents never listen to me. Here.":
*   [Do you know where Kari is?] :player:"Oh, Kari is just out playing. He knows the area well, your parents never listen to me. Here.":
*   [Okay]:player:"Okay.":
//rewrite this based on act2 damage
~Stamina += 15
- Grandpa wets a cloth in the sink and cleans you up a bit. He gives you a bandage.
:grandpa:"Okay, time for bed. Go upstairs.":
*   ^H:H,2:5 ^[Go to bed]->act2Home_bedroom
== act2Home_bedroom ==
//get rid of kari, fade in mom
#v_clearScreen
#v_act2/bedroom
Finally back in your room, you are exhausted and cannot wait to get into bed. 
*   ^A:F,5:8 ^[Get into bed]
You toss and turn thinking about your cousin, possibly lost or hurt in the vast outdoors that surrounds the house. 
#v_fadeOut
Eventually you drift off.
#t_speedDown
#t_speedDown
- :mom: "Krútt... wake up...":
#t_reset
Your mother shakes you awake. 
#v_fadeIn
You can't tell what time it is because this bedroom has no windows, but you haven't been asleep long. 
:mom: "We went to the police across the bay. They're going to come in the morning to look for Kari but in the meantime Dad and I are going out to keep searching. I left you some food in the fridge just in case, but I think Grandpa might be able to cook for you. Please don't sneak out. I love you.":
She leaves and you drift back asleep.
//fade out
#v_fadeOut
* [Dream] -> ACT3