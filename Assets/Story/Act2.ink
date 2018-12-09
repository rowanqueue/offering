//INCLUDE act1.ink

== Act2 ==
->afterDinner
== afterDinner ==
:kari:"I'm so excited you're here! Did you have a nice dinner?"
*   [Yes]
*   [No]
- :kari:Kari laughs. "Grandpa cooked my favorite meal. I want to show you something. Follow me to the trees!"
*   ^A,2^[Follow]->enterwood1

== enterwood1 ==
You've reached the foggy thicket of trees and Kari is speeding right along. 
:kari:"Come on, this way!"
*   [Follow]->enterwood2
== enterwood2 ==
:kari:"Over here!"
*   [Follow]->enterwood3
== enterwood3 ==
:kari:"Just a bit further!"
*   [Follow]->enterwood4
== enterwood4 ==
:kari:"We're almost there, it's just through here!"
*   [Follow]->campfire

======== campfire ========  
The grass gives way to dirt as you reach a clearing between the trees. There is a lean-to and some logs set up as benches around a fire pit. 
:kari:"We made it, cousin! Oh, this is a very special place. Five times a year, this is where grandpa and I gather with all his friends for the celebration Grandpa calls Blót. There is always music and singing and good food! We used to do it more often. There used to be more people too."->cousinConvo
==cousinConvo==
*   What's a Blót? ->cousinConvo
*   Who else comes here?->cousinConvo
*   What happened?->cousinConvo
- :kari:"Wanna see something funny?"
*   [Examine wooden sculpture]
- Huh.
*   [return] He's gone.
->DONE