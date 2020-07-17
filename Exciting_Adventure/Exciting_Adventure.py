import time
import random
import names


def message(s):
    print(s)
    time.sleep(1.6)


def generate_name(t, fn, sn1, sn2):
    title = random.choice(t)
    name = random.choice(fn)
    surname = random.choice(sn1) + random.choice(sn2)
    return title + name + " " + surname


def prompt(string, prompt1, prompt2, prompt3, prompt4, prompt5):
    response = input(string).lower()
    n = 0
    np = 0
    prompts = [prompt1, prompt2, prompt3, prompt4, prompt5]
    for p in prompts:
        if p != 'x':
            np += 1
    if np == 2:
        promptString = f"'{prompt1}' or '{prompt2}'"
    elif np == 3:
        promptString = f"'{prompt1}', '{prompt2}' or '{prompt3}'"
    elif np == 4:
        promptString = f"'{prompt1}', '{prompt2}', '{prompt3}' or '{prompt4}'"
    elif np == 5:
        promptString = (f"'{prompt1}', '{prompt2}', '{prompt3}',"
                        f" '{prompt4}' or '{prompt5}'")
    while True:
        if response == prompt1:
            return prompt1
        elif response == prompt2:
            return prompt2
        elif response == prompt3 and response != 'x':
            return prompt3
        elif response == prompt4 and response != 'x':
            return prompt4
        elif response == prompt5 and response != 'x':
            return prompt5
        else:
            if n == 0:
                response = input("Sorry, didn't catch that. "
                                 "Did you say {0}?\n".format(promptString))
                n += 1
            elif n == 1:
                response = input("I still don't understand you. Could you"
                                 " just type "
                                 "{0} for me.\n".format(promptString))
                n += 1
            elif n == 2:
                message("It really isn't that difficult.")
                message("All you have to do is type "
                        "{0}.".format(promptString))
                response = input("What's it gonna be?\n")
                n += 1
            elif n == 3:
                message("Ok, I see how it is.")
                message("Mr funny guy over here.")
                message("Making his funny jokes.")
                message("While I'm over here in this life "
                        "and death situation.")
                response = input("Well, if you're finished messing me around, "
                                 "could you do me a favour and type "
                                 "{0}?\n".format(promptString))
                n += 1
            elif n == 4:
                message("Geez, this guy's relentless.")
                message("Ok, well there's not much I can do about it.")
                message("Guess I'll just sit around and wait for you to "
                        "grow up a bit.")
                response = input(f"When you're ready, just type "
                                 "{0}.\n".format(promptString))
                n += 1
            else:
                response = input("...\n")


def intro():
    message('Hello!')
    message('Hello, can you hear me?')
    message('I need some help over here.')
    ans = prompt("If you can hear me, type 'y'. "
                 "And if not, type 'n' i guess.\n", 'y', 'n', 'x', 'x', 'x')
    if ans == 'y':
        message('Oh, thank god!')
    elif ans == 'n':
        message("Oh, so you can't hear me, but you knew to respond with 'n'??")
        message("Look, my life's on the line here, this is serious!")
        ans = prompt("Are you ready to stop messing me"
                     " around? (y/n)\n", 'y', 'n', 'x', 'x', 'x')
        if ans == 'y':
            message("Ok, good.")
        elif ans == 'n':
            message("Ok, well I'm gonna lay out the situation and you can")
            message("decide if you want to keep being a dick about it.")
    message(" ")
    message('My name is ' + name + '.')
    message("And my favourite colour is " + random.choice(names.colours) + ".")
    message("Don't worry about that though, I'm just showing some use of ")
    message("the 'random.choice' function")
    message(" ")
    message("I am in great peril!")
    message("I am a small elf-like creature from a beautiful fantasy world")
    message("where everyone is really happy and there's lots of")
    message("little creatures like me and it's really great.")
    message("But I've been kidnapped!")
    message("I'm trapped in some dungeon and it's all dark and scary")
    message("and I need you're help to get the heck out of here!")
    ans = prompt("Whaddya say? Can you help me get out of "
                 "this mess? (y/n)\n", 'y', 'n', 'x', 'x', 'x')
    if ans == 'y':
        message("Ok, sweet. Let's do it.")
    elif ans == 'n':
        message('Aw man, are you serious?\n')
        message("""1. "Yeah, I don't wanna hang out with some stupid elf, \n"""
                """    I've got better stuff to be doing." \n\n"""
                """2. "Nah, just kidding. Let's get you out of that """
                """dungeon!" \n""")
        ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
        if ans == '1':
            message("Geez, man.")
            message("That's cold.")
            message("...")
            message("Well, I'm basically trapped here so let me know if you "
                    "change your mind.\n")
            ans = input("Just type 'change' if you're ready to help out an elf"
                        " in need and maybe\ngo on a pretty sweet "
                        "adventure.\n").lower()
            while True:
                if ans == 'change':
                    message("I knew you'd come around.")
                    message("Ok, let's get to it!")
                    break
                else:
                    ans = input("Ready to change? Type 'change'.\n").lower()
        elif ans == '2':
            message("Phew, you really scared me for a second there.")
            message("Ok, let's do this thing!")
    message(" ")
    message('Before, we get started here, I should probably tell you')
    message("I'm part of a special family of elves. We have many")
    message("impressive powers and abilities. But, unfortunately, we're")
    message("completely incapable of making decisions.")
    message(" ")
    message("Seriously, I literally can't do it.")
    message("I can't decide which socks to put on in the morning, what")
    message("I'm gonna have for breakfast. Left, right? Up, down? "
            "Nothing.")
    message("Can't do it.")
    message(" ")
    message("That's where you come in.")
    message("We're probably gonna need to make some decisions on this")
    message("little adventure of ours.")
    message("And you've gotta take the lead on that.")
    message("I'm the muscle. You're the brains.")
    message("Just tell me what to do. And I'll do it.")
    message("No questions asked.")
    message("Just try not to get me killed, Ok?")
    room_1()


def room_1():
    if "room1" not in mem:
        message(' ')
        message("Alright, I'm in a small dark room. Not really much in here ")
        message("with me other than a few rats.")
        message("I've got a little rusty dagger, but I'm not sure how much")
        message("use it will be.")
        message("I also have this magic 6-sided die.")
        message("But I would only use that as a last resort...")
        message(" ")
        message("There's a small entry way to my left, looks like it might be")
        message("some kind of tunnel. But, it's pitch black down there.")
        message("Very creepy, not very appealling to be honest.")
        message("Straight ahead, there's a wooden door, and to my right ")
        message("there's another door, but it's got a big fat lock on it.")
        message("What do you reckon I should do?\n")
        message("""1. Creepy tunnel \n\n"""
                """2. Door in front \n\n"""
                """3. Try the locked door \n""")
        ans = prompt("(1/2/3)\n", '1', '2', '3', 'x', 'x')
        if ans == '1':
            message("Ok, I'll head down the creepy tunnel I guess.")
            message("It'll probably lead to my certain death, "
                    "but you're the boss.")
            message(" ")
            message("--ENTERING TUNNEL--\n")
            time.sleep(1)
            mem.append("room1")
            Knight_room()
        elif ans == '2':
            message("Ok, wooden door. Nice choice.")
            message("Definite safe option, let's check it out.")
            message(" ")
            message("--ENTERING NEXT ROOM--\n")
            time.sleep(1)
            mem.append("room1")
            Library()
        elif ans == '3':
            message("The locked door? Interesting choice.")
            message("Ok, I'll go give it a try.")
            message(" ")
            message("Yep.")
            message("I gave it a rattle.")
            message("It's definitely locked.")
            message("But I guess it was worth checking out.")
            message("Where to now?\n")
            message("""1. Creepy tunnel \n\n"""
                    """2. Other door \n""")
            ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
            if ans == '1':
                message("Aw geez.")
                message("Ok, creepy tunnel it is.")
                message(" ")
                message("--ENTERING TUNNEL--\n")
                time.sleep(1)
                Knight_room()
                mem.append("room1")
            elif ans == '2':
                message("Ok, wooden door. Nice choice.")
                message("Definite safe option, let's check it out.")
                message(" ")
                message("--ENTERING NEXT ROOM--\n")
                time.sleep(1)
                mem.append("room1")
                Library()
    elif "cloak" not in items:
        message("Ok, back in the creepy little room I started in.")
        if "library" not in mem:
            message("We've got the tunnel entrance, the wooden door and "
                    "the locked door.")
        else:
            message("We've got the tunnel entrance, the library and "
                    "the locked door.")
        message("What should I do?\n")
        if "library" not in mem:
            message("""1. Tunnel \n\n"""
                    """2. Door in front \n\n"""
                    """3. Try the locked door \n""")
        else:
            message("""1. Tunnel \n\n"""
                    """2. Library \n\n"""
                    """3. Try the locked door \n""")
        ans = prompt("(1/2/3)\n", '1', '2', '3', 'x', 'x')
        if ans == '1':
            message("Ok, I'll head through the tunnel.")
            message(" ")
            message("--ENTERING TUNNEL--\n")
            time.sleep(1)
            Knight_room()
        elif ans == '2':
            if "library" not in mem:
                message("Ok, I'll have a look through the door.")
                message("Kind of wish we'd tried that first.")
                message("Could of saved me crawling "
                        "through that creepy tunnel...")
                message(" ")
                message("--ENTERING NEXT ROOM--\n")
                time.sleep(1)
                Library()
            else:
                message("Cool, I'll head back into the library.")
                message(" ")
                message("--ENTERING LIBRARY--\n")
                time.sleep(1)
                Library()
        elif ans == '3':
            if "key" not in items:
                message("The locked door? Interesting choice.")
                message("Ok, I'll go give it a try.")
                message(" ")
                message("Yep.")
                message("I gave it a rattle.")
                message("It's definitely locked.")
                message("But I guess it was worth checking out.")
                message("Where to now?\n")
                if "library" not in mem:
                    message("""1. Tunnel \n\n"""
                            """2. Other door \n""")
                else:
                    message("""1. Tunnel \n\n"""
                            """2. Library \n""")
                ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
                if ans == '1':
                    message("Ok, I'll head through the tunnel.")
                    message(" ")
                    message("--ENTERING TUNNEL--\n")
                    time.sleep(1)
                    Knight_room()
                elif ans == '2':
                    if "library" not in mem:
                        message("Ok, I'll have a look through the door.")
                        message("Kind of wish we'd tried that first.")
                        message("Could of saved me crawling "
                                "through that creepy tunnel...")
                        message(" ")
                        message("--ENTERING NEXT ROOM--\n")
                        time.sleep(1)
                        Library()
                    else:
                        message("Cool, I'll head back into the library.")
                        message(" ")
                        message("--ENTERING LIBRARY--\n")
                        time.sleep(1)
                        Library()
            else:
                message("Oh yeah, maybe this key I found will")
                message("fit in the lock.")
                message("Let's give it a whirl...")
                message(" ")
                message("It worked!")
                message("Cool, let's have a look whats through here.")
                message(" ")
                message("Ok, its a small room with a big ol' chest.")
                message("I'm thinking treasure.")
                message("Hopefully, there's not another big sword in there.")
                message("Cos, these weedy little arms of mine ain't getting")
                message("any stronger.")
                message("I'm opening her up...")
                message(" ")
                message("Oh.")
                message(" ")
                message("It's empty.")
                message("Bummer.")
                message(" ")
                message("Wait a second, there is something here.")
                message("I can feel it but I can't see it.")
                message("Oh wow.")
                message("I know what it is.")
                message("It's an invisibility cloak!")
                message("Like, from Harry Potter.")
                message(" ")
                message("Now, this could really come in handy.")
                items.append("cloak")
                message(" ")
                message("Ok, where to next?\n")
                message("""1. Tunnel \n\n"""
                        """2. Library \n""")
                ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
                if ans == '1':
                    message("Ok, I'll head through the tunnel.")
                    message(" ")
                    message("--ENTERING TUNNEL--\n")
                    time.sleep(1)
                    Knight_room()
                elif ans == '2':
                    message("Cool, I'll head back into the library.")
                    message(" ")
                    message("--ENTERING LIBRARY--\n")
                    time.sleep(1)
                    Library()
    else:
        message("Ok, back in the creepy little room I started in.")
        message("Where should I head next?\n")
        message("""1. Tunnel \n\n"""
                """2. Library \n""")
        ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
        if ans == '1':
            message("Ok, I'll head through the tunnel.")
            message(" ")
            message("--ENTERING TUNNEL--\n")
            time.sleep(1)
            Knight_room()
        elif ans == '2':
            message("Cool, I'll head back into the library.")
            message(" ")
            message("--ENTERING LIBRARY--\n")
            time.sleep(1)
            Library()


def Knight_room():
    if "knight_vanquished" not in mem:
        if "knightRoom" not in mem:
            message("Ok, there is some light at the end of tunnel here.")
            message("I'm crawling out. I'm in a big, long hallway and...")
            message("Whoah! Ok, there's a big dude in a full suit of black")
            message("armour standing at the other end.\n")
            message("He's got a big ol' sword.")
            message("And he looks mean as hell.")
            message(" ")
            message("He's just standing there. Looking right at me.")
            message("Doesn't seem too bothered.")
            message("He's not coming over here or anything.")
            message(" ")
            message("It looks like theres some kind of doorway behind him.")
            message("But just to be clear. If I start a fight with this guy,")
            message("he will definitely kill me.")
        else:
            message("Ok, we're back in the long hallway.")
            message("The scary looking black knight is still over there.")

        message("What should I do?\n")
        message("""1. Go see what's up with the black knight \n\n"""
                """2. Head back through the tunnel \n""")
        ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
        if ans == '1':
            message("Ok, I'll go ask him for directions...")
            message(" ")
            message('He said: "NONE SHALL PASS!"\n')
            message("And he said it with conviction. I don't think I'm")
            message("getting past this guy.")
            message("What should I do?\n")
            if "beers" not in items:
                message("""1. Shank him with the dagger. \n\n"""
                        """2. I reckon he's bluffing. Try and sidestep """
                        """him. \n\n"""
                        """3. Head back through the tunnel. \n""")
                ans = prompt("(1/2/3)\n", '1', '2', '3', 'x', 'x')
            else:
                message("""1. Shank him with the dagger. \n\n"""
                        """2. I reckon he's bluffing. Try and sidestep """
                        """him. \n\n"""
                        """3. Head back through the tunnel. \n\n"""
                        """4. Offer him a cold beer. \n""")
                ans = prompt("(1/2/3/4)\n", '1', '2', '3', '4', 'x')
            if ans == '1':
                message(f'"{name} attempts to stab the knight with ')
                message('his trusty dagger..."')
                message('"and is swiftly cut in half."')
                game_over("lose")
            elif ans == '2':
                message(f'"{name} attempts to step around the knight..."')
                message('"and is swiftly cut in half."')
                game_over("lose")
            elif ans == '3':
                message("Ok, back through the tunnel.")
                message(" ")
                message("--ENTERING TUNNEL--\n")
                time.sleep(1)
                mem.append("knightRoom")
                room_1()
            elif ans == '4':
                message("--THE KNIGHT IS OVERWHELMED BY YOUR KINDNESS--\n")
                message(f'"{name} and the black knight enjoy a relaxing')
                message('bevarage together, and the knight decides to quit')
                message('his cause and stop preventing people from passing')
                message('through this hallway."\n')
                mem.append("knight_vanquished")
                message("Wow, that guy turned out to be pretty cool.")
                message("Don't judge a book by it's cover, I guess.")
                message("Alrighty, should we check what was through the")
                ans = prompt("doorway he was guarding? (y/n)\n",
                             'y', 'n', 'x', 'x', 'x')
                if ans == 'n':
                    message("Come on man, are you serious?")
                    message("What if there's something we need in there?")
                    message("I'll have to come all the way back here, crawl")
                    message("through that creepy tunnel again.")
                    message(" ")
                    message("You know what?")
                    message("No.")
                    message("I'm going against your decision on this one.")
                    message("I actually get to make one decision of my own")
                    message("each day. And I'm using it on this cos you're")
                    message("being ridiculous.")
                    message(" ")
                message("Oo, there's a big magic sword in here.")
                message("Wow, it's beautiful. I bet some one could do some")
                message("real damage with that bad boy.")
                message(" ")
                message("Not me though.")
                message("Yeah, that looks way too heavy for me to carry")
                if ans == 'n':
                    message("I guess you were right.")
                    message("It was pointless coming in here after all.")
                message("Oh well, guess I'll head back...")
                message(" ")
                message("Oh, wait a second. There's something else in here.")
                message("A key.")
                message("Better hang on to that. Might be useful later on.")
                items.append("key")
                message("Ok, cool. Nothing else going on here.")
                message("I'm gonna head back through that tunnel.")
                message(" ")
                message("--ENTERING TUNNEL--\n")
                time.sleep(1)
                mem.append("knightRoom")
                room_1()

        elif ans == '2':
            message("Ok, back through the tunnel.")
            message(" ")
            message("--ENTERING TUNNEL--\n")
            time.sleep(1)
            mem.append("knightRoom")
            room_1()
    else:
        message("I'm back in the hallway where that chill knight was.")
        message("The massive sword is at the end of the hallway, but")
        message("I'm still not gonna be able to lift it.")
        message("Don't think there's anything else I can do here.")
        message(" ")
        message("I'm gonna head back through the tunnel.")
        message("Again.")
        message("Maybe don't send me back in here.")
        message("I mean you're the boss... but you know.")
        message("We've been here before. We know there's nothing else to")
        message("do in here.")
        message("And my back's starting to hurt from crawling through that")
        message("tunnel.")
        message("Ok, here I go.")
        message(" ")
        message("--ENTERING TUNNEL--\n")
        time.sleep(1)
        room_1()


def Library():
    if "library" not in mem:
        message("I'm in the next room.")
        message("Looks like some kind of old library.")
        message("I'm sure you'll agree this isn't really the time")
        message("to sit around and read though.")
        message(" ")
        message("Oh, nice.")
        message("There's a couple of beers on the table.")
        message("I'm gonna pick those up.")
        message("Maybe I'll have a little celebratory brew if I")
        message("ever get out of this mess.")
        items.append("beers")
        message(" ")
        message("There's another door at the other end of the room.")
        message("It has a sign on it that says:")
        message(""" "BEWARE OF BEAR" """)
        message(" ")
        message("That's weird. You don't think there's actually a")
        message("bear in there do you?")
        message("Well, we've only got two options.")
        message("Check out the bear room, or head back the way")
        message("I came in.")
    else:
        message("I'm back in the library.")
        message("Nothing here but dusty old books.")
    message(" ")
    message("What should I do now?\n")
    message("""1. Bear room \n\n"""
            """2. Head back into the first room. \n""")
    ans = prompt("(1/2)\n", '1', '2', 'x', 'x', 'x')
    if ans == '1' and "bear" not in mem:
        message("Ok, I'll have a look.")
        message("There better not be a bear in here...")
        message(" ")
        message("--ENTERING BEAR ROOM--\n")
        mem.append("library")
        time.sleep(1)
        bear_room()
    elif ans == '1':
        message("What?!")
        message(" ")
        message("You know there's a bear in there right?")
        message(" ")
        message("I hope you have a plan that doesn't include")
        message("me getting eaten by a bear...")
        message(" ")
        message("--ENTERING BEAR ROOM--\n")
        time.sleep(1)
        bear_room()
    elif ans == '2':
        message("Heading back to the first room.")
        message(" ")
        message("--ENTERING START ROOM--\n")
        mem.append("library")
        time.sleep(1)
        room_1()


def bear_room():
    if "bear" not in mem:
        message("Holy smokes!")
        message("Yep, there's a bear in here!")
        message("That door is aptly signed.")
        message("Looks like an angry bear too.")
        message("And hungry.")
        message("Yep, definitely an angry, hungry bear over there.")
        message(" ")
        message("There's a door behind it.")
        message("Aw geez, and there's an 'exit' sign above the door.")
        message("But I don't know how I'm gonna get past this angry,")
        message("hungry looking bear.")
    else:
        message("Yep.")
        message("The bear is still here.")
        message("Standing right in front of that door marked with")
        message("the exit sign.")
        message("He looks even angrier...")
    message("What should I do?!\n")
    if "cloak" not in items:
        message("""1. Assert your dominance. \n\n"""
                """2. Throw magic die! \n\n"""
                """3. Try and run past it, I've heard bears"""
                """ are pretty slow.\n\n"""
                """4. Flee back to the library. \n""")
        ans = prompt("(1/2/3/4)\n", '1', '2', '3', '4', 'x')
    else:
        message("""1. Assert your dominance. \n\n"""
                """2. Throw magic die! \n\n"""
                """3. Try and run past it, I've heard bears"""
                """ are pretty slow.\n\n"""
                """4. Flee back to the library. \n\n"""
                """5. Put on the invisibility cloak and try\n """
                """   and sneak round him. \n""")
        ans = prompt("(1/2/3/4/5)\n", '1', '2', '3', '4', '5')
    if ans == '1':
        message("Err... Ok.")
        message("I'll growl at him, maybe he'll back down.")
        message(" ")
        message("grrrRrrr")
        message(" ")
        message("...")
        message(" ")
        message(f'"{name} was eaten by the bear."')
        game_over("lose")
    elif ans == '2':
        message("Ok, I'm rolling the die!")
        message(" ")
        n = random.randint(1, 6)
        if n == 1:
            message("Uh oh.")
            message("I rolled a 1...")
            message(' ')
            message('"A black hole opens on the floor where the')
            message('die fell."')
            message('"The bear is drawn into it vanishing forever')
            message('from existence."')
            message('"Then, everything else in the dungeon is pulled')
            message(f'in along with it, including {name}..."')
            game_over("lose")
        elif n == 2:
            message("I rolled a 2...")
            message(' ')
            message('"The bear is transformed into a dragon!"')
            message(f'"The dragon breathes fire and {name} is')
            message('engulfed in flames."')
            game_over("lose")
        elif n == 3:
            message("I rolled a 3.")
            message(" ")
            message('"The magic die transforms into a jack-in-the-box!"')
            message('"This enrages the bear!"')
            message(f'"{name} was eaten by the angry bear."')
            game_over("lose")
        elif n == 4:
            message("I rolled a 4.")
            message(" ")
            message('"The bear is transformed into..."')
            message(' ')
            message('"Two bears!"')
            message(f'"The two bears devour {name}."')
            game_over("lose")
        elif n == 5:
            message("Ok, I rolled a 5.")
            message("Hopefully thats enough to save me.")
            message(" ")
            message('"The bear vanishes in a puff of smoke!"')
            message(' ')
            message("Phew, that was lucky!")
            message("Ok, I'm heading for the exit!")
            message("Oh my god, I've made it!")
            message("I'm free baby!")
            message(f"{name} isn't dieing today!!")
            message(" ")
            message("Thank you so much!")
            message("I couldn't have done it without you.")
            message("But, to be honest, it was mostly the work")
            message("of this magic die.")
            message("Thanks anyway.")
            game_over("win")
        elif n == 6:
            message("Whoah, I rolled a 6!")
            message(' ')
            message('"The die transforms into a large salmon')
            message(f"""and flops back into {name}'s hands." """)
            message(f'"The bear cautiously approaches {name} and')
            message('eats the salmon."')
            message(f'"{name} and the bear become best friends and leave')
            message('the dungeon to live the rest of their lives in peace."')
            game_over("win")
    elif ans == '3':
        message("Ok, I'm gonna try and run for it.")
        message(" ")
        message(f'"{name} ran as fast as he could."')
        message('"But there bear was much faster..."')
        game_over("lose")
    elif ans == '4':
        message("That's the best idea you've had all day.")
        message("Ok, I'm getting out of here...")
        message(" ")
        message("--ENTERING LIBRARY--\n")
        mem.append("bear")
        time.sleep(1)
        Library()
    elif ans == '5':
        message("Oh yeah, I knew this would come in handy.")
        message("Ok, it's on. Hopefully, he doesn't smell me.")
        message(" ")
        message("I'm sneakin'...")
        message(" ")
        message("Sneakin'...")
        message(" ")
        message("Oh my god, I've made it!")
        message("I'm free baby!")
        message(f"{name} isn't dieing today!!")
        message(" ")
        message("Thank you so much!")
        message("I couldn't have done it without you.")
        game_over("win")


def game_over(condition):
    global mem
    global items
    global name
    message(" ")
    message("--GAME OVER--")
    message(" ")
    if condition == 'win':
        message("Congratulations!")
        message(f"{name} successfully escaped the dungeon!\n")
        ans = prompt("Would you like to play again? (y/n)\n",
                     'y', 'n', 'x', 'x', 'x')
    elif condition == "lose":
        message("Whoops!")
        message(f"Looks like {name} is dead.\n")
        ans = prompt("Would you like to try again? (y/n)\n",
                     'y', 'n', 'x', 'x', 'x')
    if ans == 'y':
        message(" ")
        mem = []
        items = []
        name = generate_name(names.titles, names.first_names,
                             names.surnames_1, names.surnames_2)
        ans = prompt("Would you like to skip the intro? (y/n)\n",
                     'y', 'n', 'x', 'x', 'x')
        if ans == 'y':
            room_1()
        elif ans == 'n':
            intro()
    elif ans == 'n':
        message("Ok, thanks for playing!")
        message("GOODBYE!")


mem = []
items = []
name = generate_name(names.titles, names.first_names, names.surnames_1,
                     names.surnames_2)
intro()
