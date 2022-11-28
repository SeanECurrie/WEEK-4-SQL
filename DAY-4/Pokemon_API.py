# check out this Pokemon API https://pokeapi.co/
# Use the requests package to connect to this API and get and store data for 5 
# different pokemon.
# Get the pokemons: name, atleast one ability's name, base_experience, and the 
# URL for its sprite (an image that shows up on screen) for the 'front_shiny', attack 
# base_stat, hp base_stat, defense base_stat


# WELCOME USER, GIVE OPTIONS : VIEW DECK, ADD TO DECK, REMOVE FROM DECK, QUIT

# USER ADDS POKEMON NAME AS INPUT

    #NETWORK REQUEST THAT POKEMONS DATA
    #ADDS TO USER DECK

# VIEW DECK : Name , ability, base experience, URL image, attack, hp, def

# TAKE A PEAK : LETS USER SEE AN ACSII IMAGE TAKEN FROM A SPRITE IMAGE IN THE POKEAPI
# DATABASE BY CREATING A TEMP PNG IMAGE




################
import sys
import requests
from prettytable import PrettyTable
from PIL import Image
from image_to_ascii import ImageToAscii 

user_deck = []

def pokemon_startup():
    main_input()

# MAIN MENU INPUT

def main_input():
    while True:
        
        user_input = input('\n---------- Welcome to the Basic Pokemon Deck Creator ----------\n\n Please choose an option:\n[A]dd a Pokemon to your deck\n[V]iew your deck\nTake a [P]eak at a Pokemon\n\nPlease make your choice: ')
        if user_input == 'q':
            sys.exit('\nThanks for stopping by\n')

        elif user_input == 'v':
            view_deck()

        elif user_input == 'p':
            peak_pokemon()
            
            
        elif user_input == 'a':
            add_pokemon()




def add_pokemon():

    while True:
        
        pokemon_name = input('What Pokemon do you want to add?')
        url = f'https://pokeapi.co/api/v2/pokemon/{pokemon_name}'
        response = requests.get(url)
        if response.ok == True:
            print(f"{pokemon_name} has been added to your Deck.")
            data=response.json()
            
            pokemon = {
                'name' : data['name'],
                'base_exp' : data['base_experience'],
                'ability' : data["abilities"][0]["ability"]["name"],
                'attack_base' : data["stats"][1]["base_stat"],
                'hp_base' : data["stats"][0]["base_stat"],
                'def_base' : data["stats"][2]["base_stat"],
                'sprite_url' : data["sprites"]["front_shiny"]

            }

            user_deck.append(pokemon)
            print(user_deck)
            
            
            break
        else:
            print('Pokemon not found.')
            continue
    main_input()

def view_deck():
    view_table = PrettyTable()
    view_table.field_names = ["Name", "Base Exp", "Ability", "Base ATT", "Base HP", "Base DEF", "Sprite URL" ]
    for pokemon in user_deck:
        view_table.add_row([pokemon['name'], pokemon['base_exp'], pokemon['ability'], pokemon['attack_base'], pokemon['hp_base'], pokemon['def_base'], pokemon['sprite_url']]) 
    print(view_table)
    main_input()

def peak_pokemon():
    name = input('What pokemon you wanna see?')
    url = f'https://pokeapi.co/api/v2/pokemon/{name}'
    response = requests.get(url)
    data=response.json()

    img_url = data["sprites"]["front_shiny"]


    img = Image.open(requests.get(img_url, stream = True).raw)
    img.save(f'temp_ascii.png')


    return ImageToAscii(imagePath='./temp_ascii.png')
    

            
       


pokemon_startup()