VAR hasLighter = false
VAR hasPapers = false
== ACT3 ==
//fade in, grandpa's here
#v_clearScreen
#v_act3/bedroomEmpty
#v_enter_act3/fadedGRAMPS
#v_fadeIn
#s_audio/Somber_m
:grandpa: "Wake up child. While you stay here you will live like a member of our kindred.":
*   [Alex refused to get up]
Alex refused to get up.
:grandpa:"I will not ask you again.":
*   [Alex got up]
- Alex begrudgingly got out of bed.
*   [Ask about Kari] Alex got up in a daze, and suddenly remembered the events of the previous night. She asked if Kari was back.
    :grandpa: "He didn't come home last night. Probably sleeping over at Audhumbla's. You don't understand. If you grew up here, you would not be afraid of the land. Come downstairs. Make yourself something to eat."
- 
//grandpa fade out
*   ^I:J,3:7 ^[Go downstairs]->leaveHouse

=leaveHouse
#v_exit
#v_act3/insideHouseEmpty
    Grandpa headed out the front door. Alex found some bread in the cabinet and started to eat it. Her parents still weren't back, and she was getting worried.
 
    :grandpa: "":
    //Something sus that motivates the puzzle
   
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
~coin +=1
Alex finally entered the boat to find a mess of drawings, notes, and trinkets. Kari had fashioned this place into a home, or maybe a studio. From the amount of stuff lying around, Alex assumed he must spend a lot of his time here.
->Insideboat

=Diary
Alex picked up a notebook and opened it to the first page.
//mom has been sick, i wish i could help her, grandpa doesn't want 
:kari:"I am writing this in english to practice. english feels more secret too. Last night mom was coughing a lot after dinner. I wanted to draw the wights with her but she said she had to rest. I made soup for mom and she went to bed early. I could hear her coughing in her room. I wanted to go lay with her but I don’t want to get sick too.":

+  [Next entry]
+  [Alex kept looking] Alex decided to keep looking through the boat. 
~seenBoat = seenBoat +1
->Insideboat

- :kari:"Grandfather let me stay home from school today so we could pray for mom to get better. Yesterday a friend in school said that when they got sick, they went to the doctor in Dalvík. I told Grandfather but he said that our family has been cursed since the landvættir fled and that doctors cannot help. I want the landvættir to come back because they would be able to help mom.":
+   [Next entry]
+  [Keep looking] Alex decided to keep looking through the boat. 
~seenBoat = seenBoat +1
->Insideboat

- :kari: "Mother passed to Valhalla last night. I know I should not be sad because she is with the spirits now, but I miss her. Breakfast always tasted best when she made it and she knew exactly how to put my socks on my feet so it was not uncomfortable. . Maybe she can talk to the landvættir and ask them to come back to our house and things will be a little better. I am excited because my cousin and aunt and uncle are coming to celebrate her. I really want to meet my cousin and I hope I can show her how great Asatru is. I hope what Grandfather says about them being traitors is not true. I have a good feeling about them, even though I have not met them yet.":
+  [Keep looking] Alex decided to keep looking through the boat. 
~seenBoat = seenBoat +1
->Insideboat

=Insideboat
VAR seenBoat = 0
*   [Examine drawings]:player:Alex examined the drawings: 
~seenBoat = seenBoat +1
Heaps of half-finished papers lay around the boat. Alex recognized them as his wight drawings, but these were far more intricate than the ones in Kari's bedroom. Many of the drawings were frantically scribbled out. In a few drawings, the wights appeared dead, with Xs in their eyes. ->Insideboat
+   [Examine journal]->Diary
*   [Examine trinkets] Scattered around the boat, Alex saw a bowl with some runes carved in it, some little hammers, twigs, a knife, and a hollowed-out wooden horn.
~seenBoat = seenBoat +1
->Insideboat 
*  {seenBoat > 2} [Go Home] ->act3HomeOutside
==act3HomeOutside
#v_clearScreen
#s_stop
#v_act3/outsideHouse
//get back home, go inside
Alex had seen enough in the boat and decided to go home. When she arrived back at Jorgur's house, she was bruised and thoroughly exhausted. Through the window she could see Grandpa napping in his chair.
*   [Alex walked right in]->act3walkIn
*   [Alex attempted to sneak in]->act3Sneak

=act3Sneak
//empty homeInterior
#v_act3/insideHouseEmpty
Alex opened the door and couldn't mask the loud creak. She looked toward Grandpa’s chair, but he was nowhere to be seen.
*  ^H:H,2:5 ^[Go upstairs]->act3SneakUpstairs

=act3SneakUpstairs
//grandpa in bedroom
#v_clearScreen
#v_enter_act3/fadedGRAMPS
#v_act3/bedroom
Grandpa stood in Kari's room with an angry look on his face. 
:grandpa:"Where have you been?"
*   [Out looking for Kari] 
    #t_speeddown
    :grandpa: "You were told to stay in the house. Come downstairs. You will eat lunch, and then we leave.":

    ->act3Leaving
    #t_reset
*   [Just getting some air]
    :grandpa: "You should not leave the house without my permission. Come downstairs, I am to give you lunch and then we leave.":
    ->act3Leaving
*   [Wanted to look at the mountains]
    :grandpa: "Hm. They are beautiful. Come downstairs, I am to give you lunch and then we leave.":
    ->act3Leaving
    
=act3walkIn
//just grandpa
#v_clearScreen
#v_act3/insideHouseEmpty
#v_enter_act3/fadedGRAMPS
Alex strolled into the house. Jorgur was sitting in his chair. 
:grandpa: "Oh, hello.":
#t_speeddown
*   [Hello Grandpa] :player:"Hello grandpa":
*   [Sup]:player:"Sup.":
*   [Hey]:player:"Hey.":
#t_reset
- Grandpa seemed unconcerned. 
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
-:grandpa: "Hrmph. I told you he is just out playing.":

->act3Leaving

=act3Leaving
- :grandpa: "Your parents asked I bring you to your father's family in the village. I do not go there anymore.":
    *  [Why?] :player: "Why?":
    :grandpa:"His family betrayed the kindred. They paid money to a foreigner for the land that is rightfully ours, to employ tourist guides to let them invade and deface our land.":
    :player: "Huh.":
    *  [Okay] :player: "Okay.":
    -:grandpa:"Time to go.":
->act3car
=act3walk
->act3car
=act3car
- Alex and Jorgur got in his car and started to drive west. 
#v_exit
->ACT4

//diary entries:
//entry #1: today I was out and I saw a man leading a group of people into the mountains. I told grandpa and he was concerned. He forbade me from talking to them. 
//entry #2: grandpa called a meeting with the kindred to talk about the tourists. (there is grandma/grandpa/kari, cow lady, a third family, and a fourth family) patriarch #3 says we should be open to the tourists, the fishing industry isn't what it was when we started this community. grandpa says this is our land and we need to preserve our way of life. grandma seems uncomfortable but takes his side
//entry #3: grandpa finds out patriarch #3 sold a plot of land near the bay to a guide. he is furious. He told me to stop speaking in english. grandma tried to calm him. i ran off and hid here.grandpa exiled family #3 and gave cow lady and other family an ultimatum - either swear off the tourists or leave the kindred. family #4 follows #3, cow lady stays.
//entry #4: Several months since families were sworn off. Grandpa doesn't let me see #3 and #4 kids anymore. Family not doing well(very little money, supported by cow woman and land?). Grandpa was stubborn but Grandma finally convinced him to hire some fishermen from Dalvik. grandma has been quiet, grandpa has been mean. I've been seeing cow lady and she gives me milk and talks to me about grandpa. 

//important to weave in details about kids in #3 and #4
//maybe family #3 and #4 fish for grandpa and they abandon him to fish for themselves
