==ACT5==
->act5Road
==act5Road==
#v_exit
#v_clearScreen
#check_act5
#v_act5/road
#s_act3/Audio/WindStooorm
~coin = 3
Alex ran out onto the road, headed for the mountains. As her body grew colder, she prayed that Audhumbla wasn't tricking her and hoped to see a car come down the road.

Sure enough, she saw a pickup truck coming up from behind her. 
*   [Alex stuck her thumb up] Alex stuck her thumb up and the car rolled to a stop next to her.
*   [Alex walked in front of the car] The car slowed down in front of her and she walked around to the driver's side. Alex prepared to use what little Icelandic she knew.

- :dad:"[Hello, child! What are you doing out here?]":
*   [Lost my parents] <>
:player:"[I lost my parents,]": she said in broken Icelandic.
*   [Running from crazy man] <>
:player:"[I'm running from a crazy man,]": she said in broken Icelandic.
*   [Need to go skiing] <>
:player:"[I need to get to the ski resort,]": she said in broken Icelandic.

- :dad:[Well, I'd have to be a monster to leave you in the cold. Hop in.]":
//click car
*   [Alex got in the car]
#v_fadeOut
- The two drove for a few miles, eventually making their way into the mountains. The ground was covered in snow as far as the eye could see.
#v_fadeIn
"This as far as I can go." The driver said, "Good luck out there, kid. You have a rough trip ahead of you." They handed Alex a blanket, telling her to keep warm. 
->mountainBase
==mountainBase==
->mountain1

==act5Arrival==
#v_act5/snowyhouse
#v_clearScreen
#s_stop
#s_act3/audio/Somber_m
Alex finally saw the small wooden cabin, just where Audhumbla said it would be. The lights were on, but everything was totally still. 
//click door
*   [Alex knocked on the door] Alex knocked on the cabin door and heard commotion inside. A woman around her mother's age opened the door. She looked at Alex like she'd seen a ghost.
- :brynja:"...Kari? Is that you?":
*   [Yes]
*   [No]
*   [Say nothing]
-   :brynja:"Wait, you're not Kari. Who are you?": 
*   [Kari's cousin] :player:"Kari's cousin,": Alex said.
*   [Sigrún's daughter] :player:"Sigrún's daughter,": Alex said.
*   [Jorgur's granddaughter]:player:"Jorgur's granddaughter,": Alex said.
- Her face turned white. :brynja:"Oh gods... come in, quickly. But be quiet, my kids are asleep.":
//click door again
*   [Go inside]->act5insideHouse
=act5insideHouse
#v_act5/lesbianHouse1
Alex entered the small cabin and the warmth instantly made her feel safe and secure. Closing the door behind her, the woman excused herself to the other room. Alex was struck by how welcoming the home was. After a moment the woman returned, another woman trailing behind her, and took a seat before Alex.

:brynja:"My name is Brynja, and this is my wife, Ásta": the woman said.

:asta:"What are you doing here, little one?":
*   [Trying to find Kari] :player:"I'm trying to find Kari,": Alex said. :player:"Have you seen him?":
:brynja:"No, but..." They shared a look. 
*   [Grandpa has gone crazy]:player:"Grandpa has gone crazy,": Alex said. :player:"He's attacked my dad.":
They shared a look. :brynja:"We assumed as much.":
*   [I'm in danger] :player:"Grandpa attacked my dad.",: Alex said. :player:"I need help.":
- They shared a look. :asta:"How did you find us?": Ásta asked. Alex told them about how Audhumbla helped her escape. Brynja is stunned. 
:brynja:"Audhumbla went against Jorgur?":

:asta:"He must have really gone insane.":

:brynja:"We sort of knew about this... Your cousin left us this note. We didn't see him but it was on our doorstep this morning.": They handed Alex a piece of paper.

*   [Read letter]
#v_clearScreen
-:kari:"Dear Jóhannson family, 
:kari:i hope you are well. i am sorry for writing in english but grandpa jorgur cannot read it. i wanted to tell you that my mother died but we are doing ok. my cousin and aunt and uncle have come to visit. grandpa tells me they are bad people but i really like them. i have been staying outside away from our house to fool them like he told me. grandpa said my cousin will help the kindred get strong again. the blót is tomorrow. he told me never to talk to you again but i miss playing with björn and margrét and wanted to say i hope you and grandpa make up and join us again.":
Alex looked up at Brynja and Ásta.->chatpt1

=chatpt1
VAR hateAskNum = 0
VAR kindredAskNum = 0
VAR grandpaPlanNum = 0
*   [Why does grandpa hate me?]:brynja:"The way he sees it, his kindred betrayed him. We survived for years by fishing but we couldn't keep up with the times. The tourism industry is a betrayal of what he thinks is an authentic Icelandic life.": -> grandpaHateAsk
    
*  [What was the kindred like?] Ásta and Brynja both start to speak, then Brynja motions to Ásta. :asta:"For a time it was nice. It was like a family, we shared everything. We could nearly sustain ourselves... I had so much time to enjoy life. We felt like rebels, and Jorgur was our mighty leader. In our eyes he could do no wrong. Things really changed.": 
->kindredAsk

*  [What is Grandpa going to do?] Brynja looks at Ásta. :asta:"We're not sure, but.. he is planning a blot.":
    :brynja:"A sacrifice.":
    Ásta glares at Brynja. :asta:"Who knows, he's a crazy old man. If Audhumbla really did send you here, he's alone. He can't hurt you.":->chatpt1
* ->chatpt2

->chatpt1
=grandpaHateAsk
*  [Fishing] :player:"What happened with the fishing?":
    Ásta sighs. :asta:"We would sell our fish to the town across the bay, Dalvík. They didn't like us pagans but they still bought our fish. It started to grow and they got new fishing technology. Suddenly we couldn't catch anything. Jorgur thought we were cursed.":
    ~hateAskNum += 1
    ->grandpaHateAsk
*  ["Authentic"] :player:"What does that mean, authentic?":
    :asta:"Jorgur talked about 'hard virtues.' Courage, honor, endurance, control. He thought that only those who lived like we did - worshiping the old gods, living off the land - were real Icelandic. To him, working in tourism is soft. We also started to realize that he hated the idea of anyone not 'true icelandic' invading his soil."
    ~hateAskNum += 1
    ->grandpaHateAsk
*   [Skiing] :player:"So... people ski here?": you ask.
        :asta:"Yes, it's quite popular. We have a great website." She looks lovingly at Brynja. 
        :brynja:"I do freelance web development. And most of the management. Ásta handles the tourists but mainly she is a writer.":    
    ~hateAskNum += 1
    ->grandpaHateAsk

+ {hateAskNum>0}[Ask other questions] ->chatpt1

=kindredAsk

*  [Why would you join the kindred?] :player:"So why would you join the kindred in the first place?":
    Brynja answers. "In Dalvík we kept a low profile... We are gay and back then there was contempt for us. We met your grandfather in town one day and he offered us something too good to be true."
    :asta:"A place where we didn't have to hide, and didn't have to worry about money."
    ~kindredAskNum += 1
    ->kindredAsk
*   [Why did you leave the kindred?] :player:"Why did you leave the kindred?": 
    :brynja:"Your parents had already run away and everyone was on edge. Tour guides started bringing people in to see the "untouched nature" and it made Jorgur crazy. We were poor and sad and when your father's father started buying and selling land to tour agencies it was time for us to find our own way. We still practice Asatru, but not like Jorgur.":    
    ~kindredAskNum += 1
    ->kindredAsk
*   [Why did my parents leave the kindred?] Your mother fell in love with a man from London. He promised to show her the world, and one day he just disappeared. It only made her more determined to leave.
    ~kindredAskNum += 1
    ->kindredAsk
* {kindredAskNum>0}[Ask other questions] ->chatpt1

=grandpaPlanAsk

+ {grandpaPlanAsk>0}[Ask other questions] ->chatpt1


=chatpt2

->chatend
=chatend
:brynja:"Come,": Brynja said, putting on her coat, :brynja:"we have to get you back to your mother.": 
:asta:"Wait,": said Ásta. :asta:"Don't move.":
Alex felt a chill move through the air.
//door open sound
//grandpa enters
#v_act5/lesbianHouse2
#t_speedDown
#t_speedDown
:grandpa:"Ásta. Brynja."
#t_reset
:asta:"Ye gods, Jorgur. You look awful.":
He did. Jorgur's skin was ghostly white and his hair was disheveled from the wind. He brandished a shotgun in the doorway of the house.
:grandpa:"There you are, asni.": Jorgur started to move forward but Brynja stepped between him and Alex.
:brynja:"What are you doing with this child, Jorgur?":
:grandpa:"[Agh, stop speaking in her ugly language. She is a worthless American.]":
:brynja:"I'll speak so Alex can understand me. This is insane. Leave the girl alone.":
:grandpa:"I will do as I wish. My daughter died because of Fjola's sin. It drove the landvættir from my land and placed a curse on my family.":
:asta:"You would rather make yourself a martyr than rejoin society?":
:grandpa:"Asatru must rebuild our ancestral tribes. We cannot falter in this mission, we must regain our native freedom if we are to survive. I will not let you get in my way.": Jorgur pointed the gun at Brynja. :grandpa:"Kari. Put Alex in the car.":
To his right, hiding behind his Grandfather's legs, was Kari. He looked terrified, but well. 
:player:"Kari!": cried Alex. He didn't look at her. Jorgur gestured with his gun and the wives stepped back against the wall.
:grandpa:"Now, Kari!":
:kari:"Yes, grandfather.": Kari walked over to Alex with a rope and tried to tie her hands.
*   [Alex resisted] Alex struggled and pushed Kari away. 
:kari:"Just let me do it, Alex. If I don't, he'll hurt us.":
*   [Alex let him tie her]
- Kari tied Alex's hands behind her back and led her over to Jorgur.
:grandpa:"[Come, we are leaving.]":
->ACT6
//These foul tourists own you, they pillage the land and you bow to them.
// Tonight the first moon of February rises and we will perform the ceremony as intended.
//once we perform the blot the gods will look upon us favorably
//fishing will be bountiful and i will build a new community here. my influence will be strong and many will join our cult reborn. 
//grandpa 



->END