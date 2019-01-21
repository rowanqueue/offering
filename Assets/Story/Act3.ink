VAR hasLighter = false
VAR hasPapers = false
== ACT3 ==
//fade in, grandpa's here
#check_act3
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
    :grandpa: "Come downstairs. Make yourself something to eat. I will be hard at work outside."
    ->askGramp
    
=askGramp
    +[Press Further]
    :grandpa: "I said come downstairs. Don't doubt my family's strength, Kari is far better at navigating this land then you will ever be!"
     You head downstairs but can't help but worry about your cousin.
    ->leaveHouse
    +[Drop It] You head downstairs but can't help but worry about your cousin.
    ->leaveHouse
    
=leaveHouse
#v_exit
#v_act3/insideHouseEmpty
    Grandpa heads out the front door. You sit down at the table and try to make yourself breakfast. Your parents still aren't home, and neither is Kari. It doesn't take long for you to decide what you need to do.
    You get up, put on your coat and boots and leave through the front door. 
    Grandpa stops you.
    :grandpa: "Where do you think you're going? Go back inside! You are not Kari. You haven't lived here and I doubt you would ever make it home safely. You're parents have made you soft. They would blame me for you getting lost and I will not have that" 
    He glares at you until you head back inside. You can tell there will be no chance to reason with them.
   
    ->livingRoomPuzzle
    
=livingRoomPuzzle
#v_act3/insideHouseEmpty
+ ^B:C,2:3^[Climb through the window] You could climb out the window but Grandpa would see you. You are going to need to do something more drastic. Cause a distraction, find a way to lure him into the house.
    ->livingRoomPuzzle
//clickable
* ^D:F,2:3^[Click Cabinets] You open up some cabniets to get some ideas. You see a lighter and take it.
    ~hasLighter = true
    ->livingRoomPuzzle

+^A:B,4:7^[Click Fireplace] {not hasPapers: You need something to burn if you're going to start a fire.}
    {not hasLighter: You need something to start a fire.}
    {not hasPapers or not hasLighter: ->livingRoomPuzzle }
    {hasPapers and hasLighter: You frantically throw in every thing you can into the fire place and light it on fire. Then hide around the corner.}
    ->puzzleEnd
    
+^H:H,2:5 ^[Click Stairs] ->UpstairsPuzzle

=UpstairsPuzzle
#v_enter_act3/papers
{hasPapers:
#v_exit
}
#v_act3/bedroomEmpty
* ^G:H,8:8 ^[Click Papers] You pick up Kari's drawings. He wouldn't mind losing a few drawings if it meant saving his life. You glance over the papers and realize one of them features a map to a spot north of the house. You decide to pocket it.
    ~hasPapers = true
    ->UpstairsPuzzle
+ ^I:J,3:7 ^[down]->livingRoomPuzzle

=puzzleEnd
Grandpa rushes in clearly confused about the fire. You take that chance to bolt through the door, knowing he won't ever be able to catch up. You can hear his shouting in the distance but you don't care. You have to find your cousin. 
* [Head North] ->trails
==act3Boat
#v_clearScreen
~coin = 2
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
