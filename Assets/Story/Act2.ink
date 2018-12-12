//INCLUDE act1.ink
== Act2 ==
->afterDinner
== afterDinner ==
:kari:"I'm so excited you're here! Did you have a nice dinner?"
*   [Yes]
*   [No]
- :kari:Kari laughs. "Grandpa cooked my favorite meal. I want to show you something. Follow me to the trees!"
*   ^A,2^[Follow]->enterwood1

== enterwood1 ==
You've reached the foggy thicket of trees and Kari is speeding right along. 
:kari:"Come on, this way!"
*   [Follow]->enterwood2
== enterwood2 ==
:kari:"Over here!"
*   [Follow]->enterwood3
== enterwood3 ==
:kari:"Just a bit further!"
*   [Follow]->enterwood4
== enterwood4 ==
:kari:"We're almost there, it's just through here!"
*   [Follow]->campfire

======== campfire ========  
The grass gives way to dirt as you reach a clearing between the trees. There is a lean-to and some logs set up as benches around a fire pit. 
:kari:"We made it, cousin! Oh, this is a very special place. Fifteen or so times a year, this is where grandpa and I gather with his friends for our the celebrations. There is always music and singing and good food! We used to do it more often. There used to be more people too."->cousinConvo_campfire
==cousinConvo_campfire==
*   What kind of celebrations? ->cousinConvo_campfire
*   Who else comes here?->cousinConvo_campfire
*   What happened to the other people?->cousinConvo_campfire
- :kari:"Wanna see something funny?"
*   [Examine wooden sculpture]
- Huh.
*   [return] He's gone.->act2Home_outside

== act2Home_outside ==
You emerge from the trees and your parents run to you and embrace you. 
:mom:"Are you okay?"
*   Yes
*   No
- :mom: "You look hurt... where is your cousin?"
*   [I lost him]
*   [He just disappeared]
*   [I don't know]
- :mom:"Okay, okay. We're going to go look for him and get the police. Stay at home, just go to bed and we'll get him back."
*   [Okay] :player:"Okay."
*   [I want to help] :player:"I want to help." 
- :mom: "We need you to stay here. Just get into bed, Grandpa will help. We'll be back soon, krútt."

*   [Go inside]->act2Home_inside
== act2Home_inside ==
You walk inside with Grandpa. 
:grandpa: "Just you and me now, child. You should go to bed like your mother said."
*   [Are you concerned?]"Are you scared about Kari?" you ask.
"Oh, Kari is just out playing. He knows the area well, your parents never listen to me. Here." 
*   [Do you know where Kari is?] "Oh, Kari is just out playing. He knows the area well, your parents never listen to me. Here." 
*   [Okay]
//rewrite this based on act2 damage
- Grandpa wets a cloth in the sink and cleans you up a bit. He gives you a bandage.
"Okay, time for bed. Go upstairs."
*   ^H:H,2:5 ^[Go to bed]->act2Home_bedroom
== act2Home_bedroom ==
Finally back in your room, you are exhausted and cannot wait to get into bed. 
*   ^A:F,5:8 ^[Get into bed]
You toss and turn thinking about your cousin, possibly lost or hurt in the vast outdoors that surrounds the house. Eventually you drift off.
//fade out
//slow text
- :mom: "Krútt... wake up..."
//fade in
//regular speed text
Your mother shakes you awake. You can't tell what time it is because this bedroom has no windows, but you haven't been asleep long. 
:mom: "We went to the police across the bay. They're going to come in the morning to look for Kari but in the meantime Dad and I are going out to keep searching. I left you some food in the fridge just in case, but I think Grandpa might be able to cook for you. Please don't sneak out. I love you." 
She leaves and you drift back asleep.
//fade out
//fade in, grandpa's here
:grandpa: "Wake up child. While you stay here you will live like a member of our kindred."
*   [Refuse]
*   [Get up]
- You reluctantly get out of bed. 
//SNEAKING OUT PUZZLE, BEGIN ACT 3
->DONE