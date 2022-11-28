import requests
name = 'mew'
url = f'https://pokeapi.co/api/v2/pokemon/{name}'
response = requests.get(url)
data=response.json()
name = data["name"]
base_exp = data["base_experience"]
ability = data["abilities"][0]["ability"]["name"]
sprite_url = data["sprites"]["front_shiny"]
attack_base = data["stats"][1]["base_stat"]
hp_base = data["stats"][0]["base_stat"]
def_base = data["stats"][2]["base_stat"]
print(name,ability,base_exp,sprite_url,attack_base,hp_base,def_base)
print(response.ok)


            