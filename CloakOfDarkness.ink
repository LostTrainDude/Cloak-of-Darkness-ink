VAR cloak = true
VAR times_disturbed = 0

-> foyer

=== foyer ===
{A strange dream pays you a visit, while you are asleep. You are in the foyer of a huge theater. Outside, pouring rain and horrifying thunder; around you, no one.|Back in the foyer, you can't help but notice it is still raining outside.}

    + [Go South]
        -> bar
    
    + [Go West]
        -> wardrobe
        
    + [Leave the theater]
        -> closed_door

=== bar ===
{cloak:{The room is pitch dark. You can't see a thing, except the feeble light coming from the foyer.|The room is pitch dark.}}

{cloak:You can't hear anything other than the sound of your steps and can't help but notice that right there, in the dark, something doesn't want to be disturbed.|The room is now lit, all of a sudden. It seems that the cloak was absorbing all of its light. On the floor, carved into the wood, a message.}

    + {cloak} [Go back to the foyer]
        -> foyer
        
    + {!cloak} [Read the message]
        -> message
    
    * {cloak} [Try to find a way to turn on the lights]
        You move your hand across the adjacent wall, when you hear a faint lament. You immediately pull your hand back, startled.
        ~times_disturbed += 1
        
        + + ->

    * {cloak} [Try to walk inside the dark room]
        ~times_disturbed += 1
        Every step you take, something creaks beneath your feet. Feeling like a burglar, you don't progress any further.
        
        + + ->
        
- + [Ok] -> bar

=== wardrobe ===
{!The wardrobe room is quite dusty.} {Inside the room you don't seem to find anything important except|In the wardrobe room you see} a wall mirror and an iron hook not far from it. {!It looks like a coathanger and, apparently, it's the last one standing. All the other ones have been ripped off the wall leaving quite visible marks on it.}

    + [Go back to the foyer]
        -> foyer

    + (mirror) [Look yourself in the mirror]
        {You now realize you're wearing a very dark velvet cloak. It's so dark that it seems to absorb the light that touches it.|You look at yourself again, nothing seems to have changed.}

    + [Look at the iron hook on the wall]
        {cloak:The cloak now lies on the hook. Looking at it from the distance you can now see how much light it would absorb and how peculiar this is to you.|Taking a closer look, the hook is definitely a coat hanger.}
            
        * * {mirror} [Hang the cloak on the hook]
            You leave the cloak on the hook.
            ~ cloak = false
            
        + + ->

- -> wardrobe

=== closed_door ===
The door is closed. You feel like there's something you still need to do.
-> foyer

=== message ===
{times_disturbed > 1:The message, carved, aggressively in the wood, says: "YOU LOST!"|The message, elegantly carved in the wood, says: "YOU WON!"}

You wake up, abruptly.
-> END
