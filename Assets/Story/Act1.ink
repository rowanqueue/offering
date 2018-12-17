VAR has_drawing = false
VAR given_drawing = false

== ACT1 ==
-> town
== town ==
= intro
#s_stop
#v_act1/dock
//TOO MUCH, ALSO WEIRD??
The ferry pulls into the harbor and you drive off the boat in the rental car. The town of Fjallvík is small, it takes less than five minutes to drive slowly to its limits. On the way you pass a fish market and a general store, along with some tour advertisements for hiking, skiing, whale watching, and bird watching.
*   [Ask about town]
*   [Sit in silence] -> arrival
-   Dad begins to tell you about Fjallvík. :dad: "When we were kids, nobody ever thought about visiting here. It was just a town of fishermen who couldn't afford to live in Dalvík - with their families of course. They would sell their fish over there and dock their boats here. Now there are lots of tourists coming to see the mountains. There's talk of even developing the area for skiing.": 
*   [Stare out the window]
*   [Look at the floor]
*   [Stare out the other window]
-  :dad:"My father lives in town here. We'll go to see him tomorrow, but we're going to have to stay with Grandpa Jorgur, per your mother's request":
:mom:"He's mourning. We have to keep him company.":
Dad turns to you. :dad:"Trust me, she'll be singing a different tune by tomorrow morning.":
:mom:"Keep your eyes on the road!"
*   [Ugh]
*   [Sigh]
*   [Groan]
-
->arrival
    
== arrival ==
//needs change of people
#v_act1/outsideHouseFirst
After an hour's drive through what seems like completely empty land you arrive at a small house. A man who must be your grandfather waits out front. He hugs your dad and then your mom. You wait in the car and watch. He gestures to you, and you look to your mother. She nods.
*   [Get out of the car] You get out of the car and walk over, getting a better look at him- Grandpa is a tall man, hunched over a cane but still an imposing figure. To his right, your younger cousin, who smiles at you mouth agape.
- Grandpa speaks to you in English, finding his way slowly through the words-
:grandpa: "So you are the one I've waited so long to meet. You look just like your mother.": 
He looks at you for a moment. Mom doesn't take her eyes off him.
:grandpa:"I'm thrilled you are here. Please, come inside.":
*   [Go in] -> intro_livingroom 
//*   [Help with bags]->intro_livingroom //maybe you click this?
    
== intro_livingroom ==
#v_act1/homeInterior
Grandpa walks into the house and takes a seat. 
:grandpa:"Welcome home.":
:dad:"It hasn't changed at all,": says Dad. 
:grandpa:"Kari, please show our guests to their rooms.":

:kari:"Yes, grandfather.": He looks at you. 
:kari:"Cousin! Follow me upstairs!": 

*   ^H:H,2:5 ^[Go upstairs]->intro_upstairs


== intro_upstairs ==
//needs dad floated in
#v_act1/bedroom
#s_audio/FootStep(Inside)_s
:kari:"...and you'll be staying in my room! What do you think?":
You step into your cousin's room. Drawings of creatures are scattered everywhere, covering almost every surface. 
*   [It's nice] :player:"It's a nice room. I like your drawings.":
    :kari:"Thank you! Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you.":
*   [Weird drawings] :player:"Your drawings are funny.":
    :kari:"You think so? Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you.":
*   [Boring] :player:"There's nothing in it except your drawings.":
    :kari:"Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you.":
- He hands you a drawing of a whale. 
~has_drawing = true
*   [Thanks] :player:"Thanks.": 
*   [Smile awkwardly] You're not sure what to do with this, exactly.
- Kari laughs. :kari:"What do you think of my English? I learn at school but Grandpa never allows me to speak it. It always is so funny to hear him use it!":
//more
#v_enter_act1/fadedDAD
Before you can answer, your dad enters the room. :dad:"Dinner is ready, come downstairs.":
:kari:"Coming!": Kari cheerfully replies.
*   ^I:J,3:7 ^[Go downstairs]->dinner

==dinner==
#v_exit
#v_act1/homeInterior
#s_audio/FootStep(Inside)_s
You walk downstairs and a large dinner of lamb, fish stew, potatoes, and freshly baked bread awaits. You are very hungry.
*   [Dig in]
//WEIRD MOMENT
You eat ravenously for a bit before realizing Mom hasn't touched her food. Nobody is saying anything. Finally, Dad breaks the silence. 
-:dad: "Ólafur, we're all so sorry about Fjola. We all know how much she meant to you.":
Grandpa looks at his plate and smiles. :grandpa:"She was a wonderful woman. It would make her so happy to know you all came to send her off. We missed you all so much.":
Mom nods, then looks at Grandpa. :mom:"We're only staying here for three days. After the wake, we have to leave.":
Grandpa frowns. :grandpa: "Of course, of course.": 
After a moment, he turns and looks at you, and asks :grandpa:"What do you think of Iceland so far, little one?":
*   [It's cold] Grandpa laughs. :grandpa:"You'll adjust to it soon! The Icelandic blood in you will come to the fore, you'll see right away.":
*   [It's beautiful] Grandpa smiles- :grandpa:"Why that's wonderful. I'm so glad to hear it. This is your home, the home of your forefathers!":
*   [It's alright I guess] Grandpa smiles- :grandpa:"You'll see, we'll show you a wonderful time here, isn't that right, Kari?": Kari nods. :kari:"Yes, grandfather!":
- You finish your dinner and are instructed to place your dish in the sink.
*   [Put dish away]:grandpa:"What's that paper you have there in your pocket?": asks Grandpa. :grandpa:"Bring it here.":
**   [Give drawing]
    ~has_drawing = false
    ~given_drawing = true
{given_drawing: :grandpa:"Ah, Kari drew for you. How lucky you are! Did your parents teach you the meaning of the whale?":->whale_story}
= whale_story
*   [Lie] :player:"Yes,": you say.
    Grandpa looks at you intently.
*   [Tell the truth] :player:"No,": you say
    Grandpa looks at you intently.
//WEIRD MOMENT!!
- :grandpa: "There are four landvættir, land wights, protected it. Say, why don't we all take a family photo?":
Mom interjects- :mom:"Actually, why don't they go play outside instead?":

:kari:"Oh, yes! I know exactly what to show you!":

:grandpa:"Don't go too far,": says Grandpa.
*^J:J,3:7 ^[Follow Kari outside]-> ACT2
//coordinates link to next section
-> DONE

