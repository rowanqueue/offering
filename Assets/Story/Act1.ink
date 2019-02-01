VAR has_drawing = false
VAR given_drawing = false
VAR wight_drawn = 0

== ACT1 ==
#check_act1
-> town
== town ==
= intro
#s_stop
#v_act1/dock
#s_act1/Audio/WAVESMENUSPROLOGUE
//TOO MUCH, ALSO WEIRD??
The ferry pulled into the harbor and Alex's family drove off in their rental car. The town of Fjallvík is small, it took less than five minutes to drive slowly to its limits. On the way Alex noticed a fish market, school house, and general store, along with some tour advertisements for hiking, skiing, horse stables, and fishing.

*   [Alex sat in silence]
*   [Alex started sketching]
//alex asked about something?

//Something innocent
//dad got a splinter on the dock, grandpa reinforces asatru values, it gets infected, the nearest doctor was all the way back across in dalvik

-:dad:"When I was a kid, there wasn't anything here except for a small dock that your grandfather built. I would go out fishing with him every morning and sell what we caught at the market back across the bay in Dalvík. 
//people in dalvik made fun of them? gave them bad deals? nine virtues? ahhh


*   [Alex drew]
*   [Alex looked at the floor]
*   [Alex stared out the window]

-  :dad:"Now there are lots of tourists coming to see the mountains. They're even developing the area for skiing. My father lives in town here. After dinner we'll go to their place to stay the night.":

//:mom:"He's mourning. We have to keep him company.":
//Dad turns to Alex. :dad:"Trust me, she'll be singing a different tune by tomorrow morning.":
//:mom:"Keep your eyes on the road!"
//MAKE THIS MORE DRAMATICALLY INTERESTING
->arrival
    
== arrival ==
//needs change of people
Alex spent the next forty minutes managing her nausea as her father drove them through vast expanses of completely empty land - a tunnel burrowed through the snowy grey mountains behind the port to reveal a wide green valley with no civilization in sight.  Eventually, Alex's family pulled up to a small house. An old man who Alex knew must be her grandfather stood out front.
#v_act1/houseExterior

//Alex had the thought that she had never seen so far in one direction. 
:mom:"Leave your things in the car, Alex.":

Her parents got out of the car, and to prove a point Alex waited for her mother's approval to follow. Grandfather shook dad's hand, and then him and Mom looked at eachother and said a few words. Alex watched intently. Grandfather gestured towards her, and mom motioned for her to come out of the car.

*   [Alex got out of the car]     Alex got out of the car and walked to the house, getting a better look at her Grandfather - she realized that were he not hunched over a cane he would be an enormously tall man. Even decrepit like this he was a very imposing figure, but Alex couldn't get a read on his expression. It was the kind of disapproving frown that was typical for old men, but there was something so relaxed about Grandpa Jorgur that Alex felt even more small. 


    To his right, she realized, was her younger cousin, Kari, hiding behind her grandfather's legs. He looked to be around 11 years old. Kari stared at her, mesmerized. 
    
*   [Alex refused to get out of the car] Alex refused to get out of the car, and slowly her mom walked over to her. She jerked the door open. Alex flinched, but when she looked up, her mom wouldn't meet her gaze. Alex slid out of the back seat and walked to the porch, Fjola following behind.

    Alex got out of the car and walked to the house, getting a better look at her Grandfather - she realized that were he not hunched over a cane he would be an enormously tall man. Even decrepit like this he was a very imposing figure, but Alex couldn't get a read on his expression. It was the kind of disapproving frown that was typical for old men, but there was something so relaxed about Grandfather Jorgur that Alex felt even more small. 

    To his right was Alex's younger cousin, Kari, who looked to be around 11 years old. He gawked at her, mesmerized. 

- Grandfather spoke to Alex in English, fumbling with through the words-
:grandpa: "So... you are the one I've waited so long to meet. You look just like your mother.": 
They all stood there while Alex's Grandfather eyed her up and down before making sullen eye contact with Fjola.

:grandpa:"My name is Jorgur. I am absolutely thrilled you are here. Kari, introduce yourself.": 

Kari spoke deliberately. Alex assumed he was nervous.

:kari:"Hello cousin, my name is Kari. Good to meet you.":

:grandpa:"Come inside, everyone.":

*   [Alex followed] -> intro_livingroom 
*   [Alex introduced herself to her cousin]
Alex decided to introduce herself to her cousin. 
:player:"Hey, I'm Alex,": she said. Kari lowered his voice.
:kari:"Hey! It's so amazing to meet you. Wow, okay, come inside!":
**  [Alex followed] Alex followed Kari in.
->intro_livingroom

== intro_livingroom ==
#v_act1/houseInterior
Jorgur walked into the house and took a seat.
:grandpa:"Welcome back.":
:dad:"It looks just like it did when we left,": Dad said. 
Mom squeezed Alex's shoulder.
:grandpa:"Kari, show your cousin around the house.":
Kari's head shot down towards his feet.
:kari:"Yes, grandfather.": He looks at you. 
:kari:"Cousin, follow me upstairs?": 

*   ^H:H,2:5 ^[Go upstairs]->

->intro_upstairs


== intro_upstairs ==
//needs dad floated in
#v_act1/bedroomKari
#s_audio/FootStep(Inside)_s
- :kari:"...and this is my room! What do you think?":
Alex stepped into her cousin's room. There were drawings scattered everywhere, on almost every surface. Alex might have wished she was allowed to keep her drawings on display like this, but something about Kari's room made her uneasy. Maybe it was the fact that the drawings were so incongruous. Looking closer, she realized that almost all the drawings were of the same four creatures over and over- a dragon, a bird, a bull, and a giant.

*   [It's nice] :player:"It's a nice room. I like your drawings.":
    :kari:"Thank you! Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. Here. I made this for you.":
*   [Weird drawings] :player:"Your drawings are strange.":
    :kari:"You think so? Drawing is my favorite. Grandpa likes them too. He says I could be a famous artist one day. I made this for you.":
*   [Boring] :player:"There's nothing fun up here.":
    :kari:"I think drawing is fun. Grandpa likes my sketches, too. He says I could be a famous artist one day. Here, I made this for you.":
    
- He handed Alex a crude drawing of a whale swimming towards an island with the four creatures on it.

~has_drawing = true
*   [Alex thanked him] Alex thanked Kari for the drawing. She wasn't sure what this meant, but she wanted to be polite. 
*   [Alex smiled awkwardly] Alex smiled awkwardly. She wasn't sure what this meant, exactly.

- Kari shifted a bit as he prepared to explain.

:kari:"So this is - wait, um, do you speak Icelandic?":

:player:"A bit, but... not really,": Alex admitted.

:kari:"Oh! That's okay. So... this is a drawing of the four landvættir. I love to draw them. They are spirits that protect the land, and help the people who live with them. There are many different wights but these four are the most important.":

*   [Alex remembered the story]

- Alex started to remember the story her father had told her once when she was very little. :player:"And an evil king sent his wizard to attack Iceland in the form of a whale?":

:kari:"Yes!": Kari replied. :kari:"Wow... I am so happy you know the story.": 

Kari lowered his voice. :kari:"Listen Alex, I need to tell you something. There are not any wights around this house anymore. They were driven away from here, but Grandpa says drawing them is a good way to pay tribute and invite them. I like to hang my drawings on the clothesline for them to see. I sit by the window and watch them move in the wind like they are here protecting us, and soon they will come. Would you like to draw landvættir with me?":

*   Alex accepted.
//clear screen
- Kari got Alex some charcoal and paper and the two cousins started to draw.

*   [Alex started with the dragon] Alex started by drawing the dragon wight.
:kari:"Ooh, that's good! The dragon is super cool - it guards the east side of Iceland with other lizards and worms and snakes.":
~wight_drawn = 1
*   [Alex started with the bird] Alex started by drawing the bird wight.
:kari:"Ooh, that's good! The bird is super amazing - it guards the north side of Iceland with many other birds, great and small.":
~wight_drawn = 2
*   [Alex started with the giant] Alex started by drawing the giant wight.
:kari:"Ooh, that's good! The giant is super cool - he guards the south side of Iceland with many other jötnar.":
~wight_drawn = 4
-
->drawingConvo
=drawingConvo
*   [Alex complimented Kari's drawing] Alex complimented Kari's drawing. :player:"Your cow is really cool too.":
Kari giggled at this. :kari:"It's not a cow, it's a bull! The bull is HUGE, and he wades into the water to the west and bellows out at the whale, with all the land wights behind him!": At this, Kari jumped up and made the biggest roar he could - until he started coughing and collapsed onto the floor in a laughing fit. Alex tried to imagine a bull making a sound anything like this hyper little boy, and she started laughing along with him.
->drawingConvo
*   [Alex asked his favorite wight] :player:"Which is your favorite wight, Kari?":
:kari:"Ooh, that's hard. I think probably the bird. The birds can go anywhere they want.":
->drawingConvo
*   [Some time passed as they drew together.]
->predinner

=predinner
Some time passed as the pair studiously drew creatures of all sorts. 

:kari:"Hey Alex, what do you think of my English? I learn at school but Grandpa never allows me to use it. He hates English.":

#v_enter_act1/dadFade
Before Alex could respond, her dad entered the room. :dad:"Dinner is ready, kids.":
:kari:"Coming!": Kari cheerfully replied.
*   ^I:I,3:7 ^[Go downstairs]->dinner

==dinner==
#v_exit
#v_act1/houseInterior
#s_audio/FootStep(Inside)_s
//dinner is actually gross and small
Alex walked downstairs to find Jorgur ladeling out fish stew and hunks of bread. Alex still felt sort of sick from traveling, and the strong odor just made it worse.

*   [Alex took a seat]
//WEIRD MOMENT
Alex sat at the small dinner table next to her cousin. The room until Einar cleared his throat.

-:dad: "Jorgur, I'm so sorry about Lilja. We wish we could have been here.":
Grandpa looked at his plate. :grandpa:"It was never the same after you left. She fell into a deep depression, and on top of the illness… it’s a shame you couldn’t see her before she died. It would have meant a lot to her.":
*   [Alex ate her bread] Alex nibbled her bread, which was somewhat stale.
*   [Alex tried the stew] Alex tried the stew, which was fishy and thin but warmed her up.
*   [Alex didn't eat] Alex stared at her bowl without touching her food.

- Mom didn't look up from the table. :mom:"Didn't you know she was sick? And yet you didn't take her to a single doctor?":

:grandpa:"You know it is not my way.":

:mom:"I should have been here to do something about it,”: she said. :mom:”We're only staying here for two days. After the funeral, we're leaving.":

:grandpa: "As you do.": 

After a moment, he turned to look at Alex and asked, :grandpa:"What do you think of Iceland so far, little one?":

*   [It's cold] :player:"It's very cold,": she replied.
Grandfather laughed. :grandpa:"You'll adjust to it soon! The Icelandic blood in you will come to the fore.":
*   [It's beautiful] :player:"It's beautiful,": she replied.
:grandpa:"This is the home of your forefathers, it is right for you to respect it.":
*   [It's alright I guess] :player:"It's alright, I guess.":
Grandfather squinted at Alex. :grandpa:"You'll learn to love it. It's part of who you are. Right, Kari?": Kari nodded in return. :kari:"Yes, grandfather.":
- Alex finished her dinner and was instructed to place her dish in the sink.

:grandpa:"Kari, go play outside with Alex. Don't go too far.":
Kari nodded. :kari:"Yes, grandfather!": he said. Kari and Alex started putting their shoes on.

:mom:"Hold on, Alex. I think it's time for us to leave. We really need to be getting to Ólafur's.":

At the mention of Ólafur's name, Jorgur grimaced. :grandpa:"Fjola, let the children play for a little while. Ólafur is hardly any concern of mine, and after all, it's been years since I've seen you.":

:mom:"Alex, just... don't go far.":

:player:"I won't.":
*^I:I,3:7 ^[Alex followed Kari outside]-> ACT2
//coordinates link to next section
-> DONE

