->act5Arrival
==act5Arrival==
You finally see the small wooden cabin, just where Kari's map said it would be. The lights are on, but it's quiet. 
//click door
*   [Knock on door] You knock on the cabin door and hear commotion inside. A woman around your mother's age opens the door. She looks at you like she's seen a ghost.
- :brynja:"...Kari? Is that you?":
*   [Yes]
*   [No]
*   [Say nothing]
-   :brynja:"Wait, you're not Kari. Who are you?": 
*   [Kari's cousin] :player:"Kari's cousin,": you say.
*   [Sigrún's daughter] :player:"Sigrún's daughter,": you say.
*   [Jorgur's granddaughter]:player:"Jorgur's granddaughter,": you say.
- Her face turns white. :brynja:"Odin's spear... come in, quickly":
//click door again
*   [Go inside]->act5insideHouse
=act5insideHouse
You enter the small cabin and the warmth feels amazing. There are two rooms - one a sort of kitchen and one lined with beds (in which there are two kids sleeping). The woman whispers into the house in Icelandic and someone comes out from the kitchen.
:brynja:"My name is Brynja,": the woman says. :brynja:"This is my wife, Ásta."
:asta:"What are you doing here, little one?":
*   [Trying to find Kari] :player:"I'm trying to find Kari,": you say. :player:"Have you seen him?":
:brynja:"No, but..." They share a look. :brynja:"We assumed as much. Your cousin left us this note. We didn't see him but we're sure it was him.": They hand you a piece of paper.
*   [Grandpa has gone crazy]:player:"Grandpa has gone crazy,": you say. :player:"He's attacked my dad.":
They share a look. :brynja:"We assumed as much. Your cousin left us this note. We didn't see him but we're sure it was him.": They hand you a piece of paper.
*   [My parents are in danger] :player:"My parents are in danger.",: you say. :player:"Grandpa has gone crazy.":
They share a look. :brynja:"We assumed as much. Your cousin left us this note. We didn't see him but we're sure it was him.": They hand you a piece of paper.

-:kari:"Dear Jóhannson family, 
i hope you are well. i am sorry for writing in english but grandpa jorgur cannot read it. i wanted to tell you that grandma Fjola died but we are doing ok. my cousin and aunt and uncle have come to visit. grandpa tells me they are bad people but i really like to see them. i have been staying outside away from our house to fool them like he told me. grandpa said my cousin will help the kindred get strong again. the blót is tomorrow. he told me never to talk to you again but i miss playing with björn and margrét and wanted to say i hope you and grandpa make up and join us again.":
You look up at 
->chatpt1
=chatpt1
*   [Why does grandpa hate me?]->chatpt1

*   [What is grandpa going to do?]->chatpt1

*   [What happened with you and Jorgur?]->chatpt1

//


->chatpt2
=chatpt2

->chatend
=chatend
:brynja:"Come, we have to get to your mother,": Brynja says. You start to get up but Brynja quiets you.
//door open sound
//grandpa enters
#t_speedDown
#t_speedDown
:grandpa:"Ásta. Brynja."
#t_reset
:asta:"Ye gods, Jorgur. You look awful.":
He does.

:grandpa:"There you are, you little asni. ":
//once we perform the blot the gods will look upon us favorably
//fishing will be bountiful and i will build a new community here. my influence will be strong and many will join our cult reborn. 
//grandpa 



->END