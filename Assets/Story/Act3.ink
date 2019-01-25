VAR hasLighter = false
VAR hasPapers = false
VAR foundClues = false
== ACT3 ==
//fade in, grandpa's here
#v_clearScreen
#v_act3/bedroomEmpty
#v_enter_act3/fadedGRAMPS
#v_fadeIn
#s_audio/Somber_m
:grandpa: "Wake up child. While you stay here you will live like a member of our kindred.":
*   [Refuse]
*   [Get up]
#v_fadeIn
- You reluctantly get out of bed. 

*   [Ask about Kari] You get up in a daze, then suddenly realize the events of last night. You ask where Kari is.
    :grandpa: "He didn't come home last night. Probably sleeping over at Audhumbla's or the Jóhannsons. You don't understand, child, our kindred are unafraid of the land. She is far less cruel than the city you live in." 
    You are unsatified with that answer and feel horribly guilty. If Kari isn't safe, it's your fault.
    :grandpa: "Come downstairs. I've already made breakfast while you slept in. I will be hard at work outside."
    ->askGramp
    
=askGramp
    +[Press Further]
    :grandpa: "I said come downstairs. Don't doubt my family's strength, Kari is far better at navigating this land then you will ever be!"
     You head downstairs but can't help but worry about your cousin.
    ->breakfast
    +[Drop It] You head downstairs but can't help but worry about your cousin.
    ->breakfast
    
=breakfast
#v_exit
#v_act3/insideHouseEmpty
Grandpa drops a plate of oatmeal and a dolop of white stuff you don't reconize. He stares at you.
    +[Ask About the Breakfast]You ask what the white stuff is and Grandpa scoffs.
    :grandpa: "Its skyr!"
    Grandpa's face begins you turn red.
    :grandpa: "It's like yogurt. Gah! What does your family teach you? How dare they let our culture die like this."
    He storms out and you feel relieved.
    ->eat 
    
    +[Take A Bite] You take a spoonful of the white yogurt-like substance. It's thick, creamy, but still sweet. Grandpa grunts, he seems glad you enjoy it. 
    :grandpa: "I put sugar in the oatmeal. I know how they spoil you in America."
    He hobbles out the door
    ->eat
    
=eat
    Your parents still aren't home, and neither is Kari.
    //Third person
    Alex sits alone at the table.
    *[It was your fault] The guilt cuts deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!"
    she says to herself. ->livingRoomPuzzle
    *[Take a bite] She takes a bite of her oatmeal. ->eat2
=eat2
    *[Kari could be dead] The guilt cuts deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!"
    She says to herself.
    ->livingRoomPuzzle
    *[Take another bite] She takes another bite of her skyr. ->eat3
=eat3
    *[If you hadn't been to childish] The guilt cuts deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!"
    She says to herself. ->livingRoomPuzzle
    *[Drink some milk] She sips some of her milk. ->eat4 
=eat4
    *[Everyone will hate you]  The guilt cuts deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!" 
    She says to herself. ->livingRoomPuzzle
    *[Keep eating] She keeps eating. ->eat5 
=eat5
    *[Everyone hates you]  The guilt cuts deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!"
    She says to herself. ->livingRoomPuzzle
    *[Keep eating] She keeps eating. ->eat5
    /*
    You get up, put on your coat and boots and leave through the front door. 
    Grandpa stops you.
    :grandpa: "Where do you think you're going? Go back inside! You are not Kari. You haven't lived here and I doubt you would ever make it home safely. You're parents have made you soft. They would blame me for you getting lost and I will not have that" 
    He glares at you until you head back inside. You can tell there will be no chance to reason with them.
   */

=livingRoomPuzzle
{not foundClues: Alex gets up, determined to save her cousin. She just has to figure out how.}
{foundClues: Alex surveys the room deciding how she would sneak out of the house.}
#v_act3/insideHouseEmpty
+ ^B:C,2:3^[The window]
    {not foundClues: 
    Alex looks out the window perhaps hoping to see Kari. Unfortunately, all she finds are the rolling hills to the north and her grandfather occationally walk past to water the plant.
    ->livingRoomPuzzle
    }
    Alex sees hills that look alot like the ones on the map. She clenches her fists and wairs for her grandfather to turn the corner. She then opens the window and bolts for the hills. 
    ->puzzleEnd
//clickable
+ ^D:F,2:3^[The Cabinets]
    {not foundClues: 
    Where ever Alex ends up going, she know it will probably be along journey. She stocks up on some snacks for her eventual journey. 
    ->livingRoomPuzzle
    } 
    Alex comes to the realization that shes not getting out of this house while her Grandfather guards the outside. She decides to break one of the shelves. With a loud crack, she snaps out a shelf in the cabinet, spilling the contents it supported. She frantically ducks out of sight as her Grandfather burst through the door to investigates. She, then, takes that chance to bolt through the door, knowing he won't ever be able to catch up. 
    ->puzzleEnd

+^A:B,4:7^[Click Fireplace] 
    {not foundClues: 
    A shiver goes down Alex's spine. She cozys up next to the lit fireplace, just for a little while. For that short while, she felt like she was home again.
    ->livingRoomPuzzle 
    }
    lex comes to the realization that shes not getting out of this house while her Grandfather guards the outside. She starts frantically throwing things into the fire until smoke filles the house. She frantically ducks out of sight as her Grandfather burst through the door to investigates. She, then, takes that chance to bolt through the door, knowing he won't ever be able to catch up.
    ->puzzleEnd
    
+{hasPapers}^J:J,3:7^[Front Door]  Alex gets up, puts on her coat and boots and leaves through the front door. 
    Grandpa stops her.
    :grandpa: "Where do you think you're going? Go back inside! You are not Kari. You haven't lived here and I doubt you would ever make it home safely. You're parents have made you soft. They would blame me for you getting lost and I will not have that" 
    He glares at her until she head back inside. Alex can tell there will be no chance to reason with them.
    ~foundClues = true
    ->livingRoomPuzzle
    
+^H:H,2:5 ^[Click Stairs] ->UpstairsPuzzle

= UpstairsPuzzle
#v_enter_act3/papers
{hasPapers:
#v_exit
}
#v_act3/bedroomEmpty
* ^G:H,8:8 ^[Click Papers] Alex picks up Kari's drawings. Sifting through them, she desperately looks for a clue, a message, anything that could guide her to Kari. She has to squint to make out what they are, which only serves to remind her how young Kari and how much danger he could be in.
One drawing takes her particularly long to decipher. But it soon dawns on her what it is: a map. There seems to be a path through the mountains that leads to shore. At the top right of the map is a boat circled in red. :player: "If Kari is anywhere it's there." She says.
    ~hasPapers = true
    ->UpstairsPuzzle
* ^A:F,5:8 ^ [The Bed] Alex had hardly slept at all the night before, seeing Kari's empty bed only makes her feel worse. ->UpstairsPuzzle
+ ^I:J,3:7 ^[down]->livingRoomPuzzle

=puzzleEnd
Grandpa rushes in clearly confused about the fire. You take that chance to bolt through the door, knowing he won't ever be able to catch up. Alex hears her Grandfather's shouting in the distance but she does not care. She needs to find her cousin. 
* [Head North] ->trails

==act3Boat
#v_clearScreen
~coin +=1
Your heart sinks as you realize Kari really isn't in here. Once again you are lost and alone in the Icelandic wilderness. And now you have to go back to your parents and grandpa empty handed and in huge trouble. 

You finally enter the boat and find a mess of drawings, notes, and trinkets. Kari has fashioned this place into a home, or maybe a studio. From the amount of stuff lying around, you assume he must spend a lot of his time here.
->Insideboat

=Diary
You pick up a school notebook and begin to read.
:kari: "I am writing this in english to practice and it feels more secret. today I was out and i saw a man leading a group of strange people into the mountains. I told Grandpa and he was very upset and told me not to talk to them. he called them tourists. later we made really good bread with margret and bjorn johannson and we played outside and drew the wights.":
+  [Next entry]
+  [Keep looking] You decide to keep looking through the boat. 
~seenBoat = seenBoat +1
->Insideboat

- :kari: "Today grandpa made a meeting for the kindred to talk about the tourists. There was grandpa, Audy, the Geirssons, and the Johannsons. I always like seeing mr. geirson. he said that we should be open to the tourists and fishing isn't as good anymore and Grandpa said that we need to protect our land. Grandpa got really mad and Mr. Geirson said that this is why aunt Sigrun and uncle einar left. That made Grandpa really mad. when we got home he didn't want to bake with me.":
+   [Next entry]
+  [Keep looking] You decide to keep looking through the boat. 
~seenBoat = seenBoat +1
->Insideboat

- :kari: "Grandpa has been quiet and mean. he found out Mr geirson sold some land to the man. grandma said maybe we should try to change and he was mean to her. i told grandpa that today was the day for eyvind kinnrifi and he told me it wasnt and he would not forget that even though it was the 9 february. he got really really mad and confused and punished me and i ran here to my boat.":
+   [Next entry]
+  [Keep looking] You decide to keep looking through the boat. 
~seenBoat = seenBoat +1
->Insideboat
- :kari:"i have not written in this diary in a few months. grandpa does not allow me to speak english anymore or talk to the geirssons. the Johannsons left the kindred too. I miss playing with bJörn and margrét Johannson a lot but grandpa says i can not see them either. he has been very mean and yells a lot. he does not talk to grandma any more. at least auntie audy is still okay to talk to. i often sneak out to stay at her house in the west and she gives me milk. it does not seem like grandpa notices.":
    +  [Keep looking] You decide to keep looking through the boat. 
    ~seenBoat = seenBoat +1
    ->Insideboat

=Insideboat
VAR seenBoat = 0
*   [Examine drawings]:player:You examine the drawings: 
~seenBoat = seenBoat +1
Heaps of half-finished papers lie around the boat. Over and over you see the same four creatures in Kari's drawings - dragon, eagle, bull, and giant. It's obsessive. In many of the drawings the four are pictured with a whale, sometimes fighting the whale or towering over it. The creatures are labeled, respectively, as East, North, West, South. ->Insideboat
+   [Examine journal]->Diary
*   [Examine trinkets] Scattered around the boat you see a bowl with some runes carved in it, some little hammers, twigs, a knife, and a hollowed-out horn.
~seenBoat = seenBoat +1
->Insideboat 
*  {seenBoat > 3} [Go Home] ->act3HomeOutside
==act3HomeOutside
#v_clearScreen
#s_stop
#v_act3/outsideHouse
//get back home, go inside
You'd seen enough in the boat and decided to stop back home before heading out to meet Audhumbla. Finally, you arrive back at Grandpa's house, exhausted and beaten up from your journey north. Through the window you can see Grandpa napping in his chair. You could try to sneak back in or greet grandpa like nothing is wrong.
*   [Walk in]->act3walkIn
*   [Sneak in]->act3Sneak

=act3Sneak
//empty homeInterior
#v_act3/insideHouseEmpty
You open the door and it creaks loudly. You don't see Grandpa. 
*  ^H:H,2:5 ^[Go upstairs]->act3SneakUpstairs

=act3SneakUpstairs
//grandpa in bedroom
#v_clearScreen
#v_enter_act3/fadedGRAMPS
#v_act3/bedroom
Grandpa is standing in Kari's room with an angry look on his face. 
:grandpa:"Where have you been?"
*   [Out looking for Kari] 
    #t_speeddown
    :grandpa: "Hrmph. Your parents told you to stay in, didn't they?: 
    :grandpa:Well I do like a rebel. Maybe you have a bit of Iceland in you after all. But don't do it again. Now, come downstairs. I am to give you lunch and then we leave":
    ->act3Leaving
    #t_reset
*   [Just getting some air]
    :grandpa: "Well stay inside. Your parents told you. Now, come downstairs, I am to give you lunch and then we leave.":
    ->act3Leaving
*   [Wanted to look at the mountains]
    :grandpa: "They are beautiful. Well stay inside. Your parents told you. Now, come downstairs, I am to give you lunch and then we leave.":
    ->act3Leaving
    
=act3walkIn
//just grandpa
#v_clearScreen
#v_act3/insideHouseEmpty
#v_enter_act3/fadedGRAMPS
You stroll into the house like you own the place. Grandpa is sitting in his chair. 
:grandpa: "Oh, hello.":
#t_speeddown
*   [Hello grandpa] :player:"Hello grandpa":
*   [What's up]:player:"What's up.":
*   [Hey]:player:"Hey.":
#t_reset
- Grandpa seems unconcerned. 
:grandpa:"Hrmph. Where did you go? You seem hurt.":
#t_speeddown

*   [Just getting some air] :player:"Just... getting some air.":
#t_reset
:grandpa: "Ah, good. The air here is the best you will find in the world."
#t_speeddown

*   [Exploring]:player:"Um... exploring.":
#t_reset
:grandpa: "Ah. It's good for you.":
#t_speeddown

*   [Looking for Kari]:player:"I was looking for Kari":
#t_reset
:grandpa: "Hrmph. I told you he is just out playing.":

-:grandpa:"You seem hurt. Here.":

->act3Leaving

=act3Leaving
- Grandpa cleans you up a bit and gives you a bowl of lamb stew with bread. :grandpa: "Your parents asked I bring you to your father's family in the village. I do not go there anymore.":
    *  [Why?] :player: "Why?":
    :grandpa:"His family betrayed the kindred. They sold land to the tourist guides, to let them invade and deface our land. Now, I must employ fishermen from across the water.":
    :player: "Huh.":
    *  [Okay] :player: "Okay.":
    -:grandpa:"Time to go.":
->act3car
=act3walk
->act3car
=act3car
- You and grandpa get in his car and start to drive west. 
#v_exit
->ACT4

//diary entries:
//entry #1: today I was out and I saw a man leading a group of people into the mountains. I told grandpa and he was concerned. He forbade me from talking to them. 
//entry #2: grandpa called a meeting with the kindred to talk about the tourists. (there is grandma/grandpa/kari, cow lady, a third family, and a fourth family) patriarch #3 says we should be open to the tourists, the fishing industry isn't what it was when we started this community. grandpa says this is our land and we need to preserve our way of life. grandma seems uncomfortable but takes his side
//entry #3: grandpa finds out patriarch #3 sold a plot of land near the bay to a guide. he is furious. He told me to stop speaking in english. grandma tried to calm him. i ran off and hid here.grandpa exiled family #3 and gave cow lady and other family an ultimatum - either swear off the tourists or leave the kindred. family #4 follows #3, cow lady stays.
//entry #4: Several months since families were sworn off. Grandpa doesn't let me see #3 and #4 kids anymore. Family not doing well(very little money, supported by cow woman and land?). Grandpa was stubborn but Grandma finally convinced him to hire some fishermen from Dalvik. grandma has been quiet, grandpa has been mean. I've been seeing cow lady and she gives me milk and talks to me about grandpa. 

//important to weave in details about kids in #3 and #4
//maybe family #3 and #4 fish for grandpa and they abandon him to fish for themselves
