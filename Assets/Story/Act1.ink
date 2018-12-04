INCLUDE prologue.ink
VAR has_drawing = false
VAR given_drawing = false

== ACT1 ==
-> town
== town ==
= intro
The ferry pulls into the harbor and you drive off the boat in the rental car. The town of Fjallvík is small, it takes less than five minutes to drive slowly to its limits. On the way you pass a fish market, a schoolhouse, and a general store, along with some attractions like a museum and advertisements for a swimming pool, a golf course, whale and bird watching, and sightseeing by tractor. Your dad tells you about the town along the way:
        "When we were kids, nobody ever thought about visiting here. It was just a town of fishermen who couldn't afford to live in Dalvík, with their families of course. They would sell their fish over there and dock their boats here. Now there are lots of tourists coming to see the mountains. There's talk of even developing the area for skiing." 
    * [You drive through a tunnel, into the mountains.]->arrival
    
== arrival ==
After an hour's drive through what seems like completely empty land you arrive at a small house. A man who must be your grandfather waits out front. He hugs your dad and then your mom. You wait in the car and watch. He gestures to you, and after a nod from your mother you get out and walk over. You get a better look at him: he's a tall man, hunched over but still an imposing figure. Helping him stand is a cane and, to his right, your younger cousin, who smiles at you but doesn't say a word. 
Grandpa speaks to you in English, finding his way slowly through the words. "So you are the one I've waited so long to meet. You look just like your mother." He looks at you for a moment. Mom doesn't take her eyes off him. "I'm thrilled you are here, please come inside."
*   [Help bring the bags in]->intro_livingroom
    
== intro_livingroom ==
Grandpa walks into the house and takes a seat. "Welcome home."
"It hasn't changed at all," says Dad. 
"Kari, please show our guests to their rooms."
"Yes, grandfather."

*   [Go upstairs]->intro_upstairs

== intro_upstairs == 
"...and you'll be staying in my room! What do you think?" You look at the drawings of creatures scattered around the room. 
*   [It's nice] "It's a nice room. I like your drawings."
    "Thank you! Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you."
*   [Weird drawings] "Your drawings are funny."
    "You think so? Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you."
*   [Boring] "There's nothing in it except your drawings."
    "Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here, I made this for you."
- He hands you a drawing of a whale. 
~has_drawing = true
*   [Thanks] "Thanks." 
- Kari laughs. "What do you think of my English? I learn at school but Grandpa never allows me to speak it. It always is so funny to hear him use it!"
Before you can answer, your dad enters the room. "Dinner is ready, come downstairs."
"Coming!" Kari cheerfully replies.
*   [Go downstairs]->dinner

==dinner==
You walk downstairs and a large dinner of lamb, fish stew, potatoes, and freshly baked bread awaits. You are very hungry.
*   [Dig in]
You eat ravenously for a bit before realizing Mom hasn't touched her food. Nobody is saying anything. 
You bring your plate up to the sink and wipe it down. 
-"What's that paper you have there?" asks Grandpa.

*   [Give drawing]
    ~has_drawing = false
    ~given_drawing = true
{given_drawing: Ah, Kari drew for you. How lucky you are! Did your parents teach you the significance of the whale?->whale_story}
= whale_story
*   [No]
- Well there are obviously many whales here in Iceland. I can have my men take you out to find some if you want. But legend tells of a king who sent a wizard to Iceland, disguised as a whale. Let's take a photo for the family book.
Mom interjects: "Actually, why don't you go play outside with your cousin instead?"

"Oh, I know exactly what to show you!"

"Don't go too far," Grandpa says.





-> DONE

