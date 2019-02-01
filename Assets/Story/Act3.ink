VAR hasLighter = false
VAR hasPapers = false
VAR foundClues = false
== ACT3 ==
//fade in, grandpa's here
#v_clearScreen
#check_act3
#v_act3/bedroom
#v_enter_act3/grandpaFade
#s_audio/Somber_m
~coin = 1
:grandpa: "Wake up child. While you stay here you will live like a member of our kindred.":
*   [Alex refused to get up]
Alex refused to get up.
:grandpa:"I will not ask you again.":
*   [Alex got up]
- Alex begrudgingly got out of bed.
*   [Alex asked about Kari] After coming out of her sleepy haze, Alex suddenly remembered the events of last night. She asked where Kari was.
    :grandpa: "He didn't come home last night. Probably sleeping over at Audhumbla's or the Jóhannsons. You don't understand, child, our kindred are unafraid of the land. She is far less cruel than the city you live in." 
    Alex was unsatified with that answer and felt horribly guilty. She felt that if Kari wasn't safe, it was her fault.
    :grandpa: "Come downstairs. I've already made breakfast while you slept in. I will be hard at work outside."
    ->askGramp
    
=askGramp
    +[Alex pressed further] :player:"How can you be sure he's safe?"://Add alex's dialogue here
    :grandpa: "I said come downstairs. Don't doubt my family's strength, Kari is far better at navigating this land then you will ever be!"
     Alex followed him downstairs but couldn't help but worry about her cousin.
    ->breakfast
    +[Alex dropped the subject] Alex followed downstairs but couldn't help but worry about her cousin.
    ->breakfast
    
=breakfast
#v_exit
#v_act3/houseInterior
#v_enter_act3/grandpaFade
Grandfather plopped a plate of oatmeal and a dolop of white stuff Alex didn't reconize onto the table. Alex took a seat at the table as he stared directly at her.
    +[Alex asked about the breakfast]Alex asked what the white stuff was and Grandpa scoffed.
    :grandpa: "Its skyr!"
    Grandfather's face began to turn red.
    :grandpa: "It's like yogurt. Gah!": He threw his hands into the air. :grandpa:"What does your family teach you? How dare they let our culture die like this.":
    
    #v_exit
    He stormed out and Alex felt relieved.
    ->eat 
    
    +[Alex took a bite] Alex took a spoonful of the white yogurt-like substance. It was thick, creamy, but still sweet. Grandfather grunted, he actually seemed glad that she enjoyed it. 
    :grandpa: "I put sugar in the oatmeal. I know how they spoil you in America."
    He hobbled out the door.
    ->eat
    
=eat
    Alex's parents still weren't home, and neither was Kari.
    //Third person
    Alex sat alone at the table and began to think to herself.
    *[It was your fault] The guilt cut deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!": she said to herself. ->livingRoomPuzzle
    *[Alex took a bite] She took a bite of her oatmeal. ->eat2
=eat2
    *[Kari could be dead] The guilt cut deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!": She said to herself.
    ->livingRoomPuzzle
    *[Alex took another bite] She took another bite of her skyr. ->eat3
=eat3
    *[If you hadn't been so childish] The guilt cut deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!": She said to herself. ->livingRoomPuzzle
    *[Alex drank some milk] She sipped some of her milk. ->eat4 
=eat4
    *[Everyone will hate you]  The guilt cut deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!" She said to herself. ->livingRoomPuzzle
    *[Alex kept eating] She kept eating. ->eat5 
=eat5
    *[Everyone hates you]  The guilt cut deep into her. :player: "I can't just sit here and do nothing, not while Kari is still out there!": She said to herself. ->livingRoomPuzzle
    *[Alex kept eating] She kept eating. ->eat5
    /*
    You get up, put on your coat and boots and leave through the front door. 
    Grandpa stops you.
    :grandpa: "Where do you think you're going? Go back inside! You are not Kari. You haven't lived here and I doubt you would ever make it home safely. You're parents have made you soft. They would blame me for you getting lost and I will not have that" 
    He glares at you until you head back inside. You can tell there will be no chance to reason with them.
   */

=livingRoomPuzzle
{not foundClues: Alex got up, determined to save her cousin. She just had to figure out how. <>}
{foundClues: Alex surveyed the room, deciding how she would sneak out of the house. <>}
#v_act3/houseInterior
+ ^B:C,2:3^[The window]
    {not foundClues: 
    Alex looked out the window perhaps hoping to see Kari. Unfortunately, all she found was the rolling hills to the north and her grandfather occationally walking past to water the plants.
    ->livingRoomPuzzle
    }
    Alex saw hills that looked a lot like the ones on Kari's map. She clenched her fists and waited for her grandfather to turn the corner. She then opened the window and bolted for the hills. 
    ->puzzleEnd
//clickable
+ ^D:F,2:3^[The Cabinets]
    {not foundClues: 
    Where ever Alex ended up going, she knew it will probably be a long journey. She stocked up on some snacks for her eventual journey, stuffing her pockets.//with what?
    ->livingRoomPuzzle
    }
    Alex came to the realization that she was not getting out of this house while her Grandfather guarded the outside. She decided to break one of the shelves. With a loud crack, she snapped out a shelf in the cabinet, spilling the contents it supported. She frantically ducked out of sight as her Grandfather burst through the door to investigate. She then took the chance to bolt through the door, knowing he wouldn't be able to catch up.
    ->puzzleEnd

+^A:B,5:7^[Click Fireplace] 
    {not foundClues: 
    A shiver went down Alex's spine. She cozied up next to the lit fireplace, just for a little while. For that short while, she felt like she was home again.
    ->livingRoomPuzzle 
    }
    Alex came to the realization that she was not getting out of this house while her Grandfather guarded the outside. She started frantically throwing things into the fire until smoke filled the room. She frantically ducked out of sight as her Grandfather burst through the door to investigate. She then took the chance to bolt through the door, knowing he wouldn't be able to catch up.
    ->puzzleEnd
    
+{hasPapers}^I:I,3:7^[Front Door]  Alex got up, put on her coat and boots and left through the front door. 
    Grandfather stopped her.
    :grandpa: "Where do you think you're going? Go back inside! You are not Kari. You haven't lived here and I doubt you would ever make it home safely. You're parents have made you soft. They would blame me for you getting lost and I will not have that":
    He glared at her until she headed back inside. Alex can tell there will be no chance to reason with him.
    ~foundClues = true
    ->livingRoomPuzzle
    
+^H:H,2:5 ^[Click Stairs] ->UpstairsPuzzle

= UpstairsPuzzle
#v_act3/bedroom
* ^F:G,8:8 ^[Click Papers] Alex picked up Kari's drawings. Sifting through them, she desperately looked for a clue, a message, anything that could guide her to Kari. She had to squint to make out what they were, which only served to remind her how young Kari was and how much danger he could be in.
One drawing took her particularly long to decipher. But it soon dawned on her what it was- a map. There seemed to be a path through the mountains that lead to the shore. At the top right of the map was a boat circled in red. :player:"If Kari is anywhere it's there.":
    ~hasPapers = true
    ->UpstairsPuzzle
* ^A:E,5:8 ^ [The Bed] Alex had hardly slept at all the night before, seeing Kari's empty bed only made her feel worse. ->UpstairsPuzzle
+ ^I:I,3:7 ^[down]->livingRoomPuzzle

=puzzleEnd
As she ran, Alex heard her Grandfather's shouting behind her but she did not care. She needed to find her cousin, and this was how she was going to do it. 
* [Alex headed north] ->trails
==act3Boat
#v_act3/boatInterior
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
*   [Examine drawings]Alex examined the drawings.
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
#v_act3/houseExterior
//get back home, go inside
Alex had seen enough in the boat and decided to go home. When she arrived back at Jorgur's house, she was bruised and thoroughly exhausted. Through the window she could see Grandpa napping in his chair.
*   [Alex walked right in]->act3walkIn
*   [Alex attempted to sneak in]->act3Sneak

=act3Sneak
//empty homeInterior
#v_act3/houseInterior
Alex opened the door and couldn't mask the loud creak. She looked toward Grandpa’s chair, but he was nowhere to be seen.
*  ^H:H,2:5 ^[Go upstairs]->act3SneakUpstairs

=act3SneakUpstairs
//grandpa in bedroom
#v_clearScreen
#v_enter_act3/grandpaFade
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
#v_act3/houseInterior
#v_enter_act3/grandpaFade
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
- Alex and her grandfather got in his car and started to drive west. 
#v_exit
->ACT4

//diary entries:
//entry #1: today I was out and I saw a man leading a group of people into the mountains. I told grandpa and he was concerned. He forbade me from talking to them. 
//entry #2: grandpa called a meeting with the kindred to talk about the tourists. (there is grandma/grandpa/kari, cow lady, a third family, and a fourth family) patriarch #3 says we should be open to the tourists, the fishing industry isn't what it was when we started this community. grandpa says this is our land and we need to preserve our way of life. grandma seems uncomfortable but takes his side
//entry #3: grandpa finds out patriarch #3 sold a plot of land near the bay to a guide. he is furious. He told me to stop speaking in english. grandma tried to calm him. i ran off and hid here.grandpa exiled family #3 and gave cow lady and other family an ultimatum - either swear off the tourists or leave the kindred. family #4 follows #3, cow lady stays.
//entry #4: Several months since families were sworn off. Grandpa doesn't let me see #3 and #4 kids anymore. Family not doing well(very little money, supported by cow woman and land?). Grandpa was stubborn but Grandma finally convinced him to hire some fishermen from Dalvik. grandma has been quiet, grandpa has been mean. I've been seeing cow lady and she gives me milk and talks to me about grandpa. 

//important to weave in details about kids in #3 and #4
//maybe family #3 and #4 fish for grandpa and they abandon him to fish for themselves
