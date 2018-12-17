"This as far as I can go." they say "Good luck out there, kid. You have a rough trip ahead of you." They hand you a blanket and tell you to keep warm. 

== mountain1 == 
= intro
You are already very high up. Behind you, you can see the glint of the ocean in the horizon. Snow crunches beneath your feet. Coming from New York, you were prepared for the snow but not like this. Sleet slashes at your face. The blanket helps but not much. You now face foreward, looking up at the mountain top. A muddy road lies ahead of you. You feel closer to Kari than every before. Audi told you there would people  up here who can help.
    ->main
    
 =main
 
//clickable 
+ [Head Back Down the Mountain] There is no going back.->main

+ [Examine Rocks] Everything here is covered in dense ice. Its a much crueler cold here than it is in New York. The ice is harder and the winds are stronger. Everything is so open, making you feel more vulerable than ever before.->main

+ [Walk Up The Trail] You trudge up the hill, slowly bracing yourself against the wind. ->fork

//Same Screen
==fork
With the wind blowing in your face, its hard to tell whats in front of you. Looking ahead hurts your eyes and any exposed skin stings whenever the ice touches it. You think the trail ends here but your not entirely sure. You don't know were to go but you know you need to push foreward. 
    ->main
    
=main
//non clickable 
+ [Go Left] You veer left searching for anything that can point you in the correct direction. You thought you saw a trail here but everything just seems muddy and wet. The ground under you feels soft though kind of like gravel. You take that as a good sign. ->mountain2

+ [Go Right] You stomp through the wet ground veering right. You have no idea where you are going, but you know you are headed up hill. The house is definitely uphill, all you can do is climb up and hope for the best.
    ~stamina -= 5 
    ->mountain2


//same screen
==mountain2 ==
The higher you climb the icyier it gets. The ground has slowly been hardening beneath you and it is now to the point where you start to slip. 

//non clickable 
+ [Walk in the Snow] 
You remeber what happened on the beach and you decide not to take you chances. You move away from the rocky terrain and find an area that is covered in snow. Its is surprisingly deep and some snow seeps into your boots. You feel a shock as the snow starts to chill your feet, but its still better than slipping and falling.
    ~stamina -= 5
    ->mountain3

+ [Slow your Pace]
You keep your steps light and careful. You are so high up and the last thing you want is to loose your balance. You carry on in the same direction hopeful this whole ordeal will be over soon. It doesn't feel right slowing down. You feel like your grandpa could be right behind you, but there is no way he knows where you are.
    ->mountain3
    
+ [Grab a Walking Stick]
You find an old branch on the ground and decide it would make the perfect companion to traversing this mountain. When you put your weight on it, you immeadiately slip and fall. You land on your arm sevearly bruising it. You brace yourself ready to tumble down the side of the mountain but that moment never happens. You just get back up and push your self to go further.
    ~stamina -= 10
    ->mountain3
    


//new screen
== mountain3 ==
You no longer know where you are and the terrain ahead is not exactly walkable. Boulders about the size of you seem to have fallen over the cliff above blocking your path foreward. You stop and take in the situation. Lost in the mountains, alone. If you die, no one will be able to find your body. Your parents will have lost two children and it will have been all your fault. You have no idea how you're going to climb over these massive rocks but you need to, you need to end this no matter what happens to you.
=main
//non clickable 
+ [Use Your Blankets A Rope]
You wrap your blanket around sharp point in the rocks and pull yourself up on top. You make it through safely but you blanket is now mangled and soaking we. You throw it aside and soon realize how warm it was keeping you. You are shivering the rest of the way.
    ~stamina -= 10
    ->mountain4
    
+ [Squeeze through the Gaps]
You try to squeeze through the gaps 
    
+ [Find a Safer Path] You walk around the cliffside looking for a better path. You frantically pace around not ready to risk your life climbing something again. You search a bit more. And then a bit more. There has to be a better way. You are unable to find one. 
    ->main



//next room ice \7