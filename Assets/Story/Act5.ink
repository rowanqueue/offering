== ACT5 ==
You run out onto the road, heading for the mountains. You hear your grandfather yelling behind you. He can't chase you, and eventually all you can hear is the wind. You're freezing cold and soon praying to see any sort of car on the road. 

Sure enough, you see a pickup truck coming up from behind you. 
*   [Stick your thumb up] You stick your thumb up and the car rolls to a stop next to you.
*   [Walk in front of car] The car slows down in front of you and you walk around to the driver's side. You prepare to use what little Icelandic you know.

- :dad:"[Hello, child! What are you doing out here?]":
*   [Lost my parents] :player:"I lost my parents,": you say.
*   [Running from crazy man] :player:"I'm running from a crazy man,": you say.
*   [Need to go skiing] :player:"I need to get to the ski resort,": you say.
- :driver:"Huh, well if you're heading up this way then I would have to be a monster not to help a child such as yourself from the cold. Hop in.":
//click car
*   [Get in]
#v_fadeOut
- You drive for
"This as far as I can go." they say "Good luck out there, kid. You have a rough trip ahead of you." They hand you a blanket and tell you to keep warm. 
->mountainBase
==mountainBase==
->mountain1

==act5Arrival==
#v_clearScreen
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
You enter the small cabin and the warmth instantly makes you feel safe and secure. There are two rooms - one a sort of kitchen and one lined with beds (in which there are two kids sleeping). It's a lovely home. The woman whispers into the house in Icelandic and someone comes out from the kitchen.
:brynja:"My name is Brynja,": the woman says. :brynja:"This is my wife, Ásta."
:asta:"What are you doing here, little one?":
*   [Trying to find Kari] :player:"I'm trying to find Kari,": you say. :player:"Have you seen him?":
:brynja:"No, but..." They share a look. 
*   [Grandpa has gone crazy]:player:"Grandpa has gone crazy,": you say. :player:"He's attacked my dad.":
They share a look. :brynja:"We assumed as much." 
*   [I'm in danger] :player:"Grandpa attacked my dad.",: you say. :player:"I needed help.":
- They share a look. :"asta":"How did you find us?": Ásta asks. You tell them about how Audhumbla helped you escape. Brynja is stunned. 
:brynja:"Audhumbla went against Jorgur?":

:asta:"He must have really gone insane.":

:brynja:"We sort of knew about this... Your cousin left us this note. We didn't see him but it was on our doorstep this morning.": They hand you a piece of paper.

*   [Read letter]
#v_clearScreen
-:kari:"Dear Jóhannson family, 
i hope you are well. i am sorry for writing in english but grandpa jorgur cannot read it. i wanted to tell you that grandma Fjola died but we are doing ok. my cousin and aunt and uncle have come to visit. grandpa tells me they are bad people but i really like to see them. i have been staying outside away from our house to fool them like he told me. grandpa said my cousin will help the kindred get strong again. the blót is tomorrow. he told me never to talk to you again but i miss playing with björn and margrét and wanted to say i hope you and grandpa make up and join us again.":
You look up at Brynja and Ásta.->chatpt1

=chatpt1
VAR hateAskNum = 0
VAR kindredAskNum = 0
VAR grandpaPlanNum = 0
+   [Why does grandpa hate me?]:brynja:"The way he sees it, his kindred betrayed him. We survived for years by fishing but we couldn't keep up with the times. The tourism industry is a betrayal of what he thinks is an authentic Icelandic life.": -> grandpaHateAsk
    
+  [What was the kindred like?] Ásta and Brynja both start to speak, then Brynja motions to Ásta. :asta:"For a time it was nice. It was like a family, we shared everything. We could nearly sustain ourselves... I had so much time to enjoy life. We felt like rebels, and Jorgur was our mighty leader. In our eyes he could do no wrong. Things really changed.": 
->kindredAsk

+  [What is Grandpa going to do?] Brynja looks at Ásta. :asta:"We're not sure, but.. he is planning a blot.":
    :brynja:"A sacrifice.":
    Ásta glares at Brynja. :asta:"Who knows, he's a crazy old man. If Audhumbla really did send you here, he's alone. He can't hurt you.":->grandpaPlanAsk
* ->chatpt2

->chatpt1
=grandpaHateAsk
*  [Ask about fishing] :player:"What happened with the fishing?":
    Ásta sighs. :asta:"We would sell our fish to the town across the bay, Dalvík. They didn't like us pagans but they still bought our fish. It started to grow and they got new fishing technology. Suddenly our fish were worth less and less.":
    ~hateAskNum += 1
    ->grandpaHateAsk
*  [Ask about "authentic"] :player:"What does that mean, authentic?":
    :asta:"Jorgur talked about 'hard virtues.' Courage, honor, endurance, control. He thought that only those who lived like we did - worshiping the old gods, living off the land - were real Icelandic. To him, working in tourism is soft. We also started to realize that he hated the idea of anyone not 'true icelandic' invading his soil."
    ~hateAskNum += 1
    ->grandpaHateAsk
*   [Ask about skiing] :player:"So... people ski here?": you ask.
        :asta:"Yes, it's quite popular. We have a great website." She looks lovingly at Brynja. 
        :brynja:"I do freelance web development. And most of the management. Ásta handles the tourists but mainly she is a writer.":    
    ~hateAskNum += 1
    ->grandpaHateAsk

+ {hateAskNum>0}[Ask other questions] ->chatpt1

=kindredAsk

+  [Ask why they joined] :player:"So why did you join the kindred in the first place?":
    Brynja answers. "In Dalvík we kept a low profile... We were gay and back then there was, well, contempt for us. We met your grandfather in town one day and he offered us something too good to be true."
    :asta:"A place where we didn't have to hide, and didn't have to worry about money."
    ~kindredAskNum += 1
    ->kindredAsk
+   [Ask about leaving] :player:"Why did you leave the kindred?": 
    :brynja:"Your parents had already run away and everyone was on edge. Tour guides started bringing people in to see the "untouched nature" and it made Jorgur crazy. We were poor and sad and when your father's father sold some land to a tour agency it was time for us to find our own way. We still practice Asatru, but not like Jorgur.":    
    ~kindredAskNum += 1
    ->kindredAsk
+   [Ask about skiing]
    ~kindredAskNum += 1
    ->kindredAsk
+ {kindredAskNum>0}[Ask other questions] ->chatpt1

=grandpaPlanAsk

+ {grandpaPlanAsk>0}[Ask other questions] ->chatpt1


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
:grandpa:"There you are, you little asni.": Grandpa lurches forward but Brynja steps between you. 
:brynja:"What are you doing with this child, Jorgur?":
:grandpa:"Agh, stop speaking in his ugly language.":
:brynja:"I'll speak so the child can understand it. This is madness. You sent Kari out into the wilds? Why?":
:grandpa:"It's the design of the gods. I needed to distract the parents so the child can be brought to our ritual site. Don't you see? These foul tourists own you, they pillage the land and you bow to them. We need the most acceptible":
//once we perform the blot the gods will look upon us favorably
//fishing will be bountiful and i will build a new community here. my influence will be strong and many will join our cult reborn. 
//grandpa 



->END