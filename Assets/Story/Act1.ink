INCLUDE prologue.ink
INCLUDE Act2.ink
VAR has_drawing = false
VAR given_drawing = false

== ACT1 ==
-> town
== town ==
= intro
#s_stop
The ferry pulls into the harbor and you drive off the boat in the rental car. The town of Fjallvík is small, it takes less than five minutes to drive slowly to its limits. On the way you pass a fish market and a general store, along with some tour advertisements for hiking, whale and bird watching, a swimming pool, a golf course, and sightseeing by tractor. 
*   [Ask about town]
-   :dad: "When we were kids, nobody ever thought about visiting here. It was just a town of fishermen who couldn't afford to live in Dalvík - with their families of course. They would sell their fish over there and dock their boats here. Now there are lots of tourists coming to see the mountains. There's talk of even developing the area for skiing." 
*   [You drive through a tunnel, into the mountains.]->arrival
    
== arrival ==
After an hour's drive through what seems like completely empty land you arrive at a small house. A man who must be your grandfather waits out front. He hugs your dad and then your mom. You wait in the car and watch. He gestures to you, and you look to your mother. She nods.
*   [Get out of the car] You get out of the car and walk over, getting a better look at him: Grandpa is a tall man, hunched over a cane but still an imposing figure. To his right, your younger cousin, who smiles at you mouth agape.
- Grandpa speaks to you in English, finding his way slowly through the words: 
:grandpa: "So you are the one I've waited so long to meet. You look just like your mother." He looks at you for a moment. Mom doesn't take her eyes off him. "I'm thrilled you are here, please come inside."
*   [Help bring the bags in]->intro_livingroom
    
== intro_livingroom ==
#k_act1/homeInterior
Grandpa walks into the house and takes a seat. 
:grandpa:"Welcome home."
:dad:"It hasn't changed at all," says Dad. 
:grandpa:"Kari, please show our guests to their rooms."
:kari:"Yes, grandfather."

*   ^H:H,2:5 ^[Go upstairs]->intro_upstairs

== intro_upstairs == 
#k_act1/bedroom
:kari:"...and you'll be staying in my room! What do you think?" You step into your cousin's room. Drawings of creatures are scattered everywhere, covering almost every surface. 
*   [It's nice] :player:"It's a nice room. I like your drawings."
    :kari:"Thank you! Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you."
*   [Weird drawings] :player:"Your drawings are funny."
    :kari:"You think so? Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you."
*   [Boring] :player:"There's nothing in it except your drawings."
    :kari:"Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you."
- He hands you a drawing of a whale. 
~has_drawing = true
*   [Thanks] :player:"Thanks." 
- :kari: Kari laughs. "What do you think of my English? I learn at school but Grandpa never allows me to speak it. It always is so funny to hear him use it!"
Before you can answer, your dad enters the room. "Dinner is ready, come downstairs."
:kari:"Coming!" Kari cheerfully replies.
*   ^I:J,3:7 ^[Go downstairs]->dinner

==dinner==
#k_act1/homeInterior
You walk downstairs and a large dinner of lamb, fish stew, potatoes, and freshly baked bread awaits. You are very hungry.
*   [Dig in]
You eat ravenously for a bit before realizing Mom hasn't touched her food. Nobody is saying anything. Finally, dad breaks the silence. 
-:dad: "Ólafur, we're all so sorry about Fjola. We all know how much she meant to you."
:grandpa: Grandpa looks at his plate and smiles. "She was a wonderful woman. It would make her so happy to know you all came to send her off. We missed you all so much."
:mom: Mom nods, then looks at grandpa. "We're only staying here for three days. After the wake, we have to leave."
:grandpa: Grandpa frowns. "Of course, of course." After a moment, he turns and looks at you: "What do you think of Iceland so far, little one?"
*   [It's cold] :grandpa: Grandpa laughs. "You'll adjust to it soon! The Icelandic blood in you will come to the fore, you'll see right away."
*   [It's beautiful] :grandpa: Grandpa smiles: "Why that's wonderful. I'm so glad to hear it. This is your home, the home of your forefathers!" 
*   [It's alright I guess] Grandpa smiles: "You'll see, we'll show you a wonderful time here, isn't that right, Kari?" Kari nods. "Yes, grandfather!"
- You finish your dinner and are instructed to place your dish in the sink.
*   [Put dish away]:grandpa:"What's that paper you have there in your pocket?" asks Grandpa. "Bring it here."
**   [Give drawing]
    ~has_drawing = false
    ~given_drawing = true
{given_drawing: :grandpa:"Ah, Kari drew for you. How lucky you are! Did your parents teach you the meaning of the whale?"->whale_story}
= whale_story
*   [Say No]
- :grandpa: "Well there are obviously many whales here in Iceland. I can have my men take you out to find some if you want. But legend tells of a king who sent a wizard to Iceland, disguised as a whale. The whale tried to find the weaknesses of Iceland but the four landvættir, land wights, protected it. Say, why don't we all take a family photo?"
Mom interjects: "Actually, why don't they go play outside instead?"

:kari:"Oh, yes! I know exactly what to show you!"

:grandpa:"Don't go too far," says Grandpa.
-> ACT2
//coordinates link to next section
-> DONE

