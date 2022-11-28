from image_to_ascii import ImageToAscii 
import requests
import shutil
import urllib.request
from PIL import Image

# imagePath is for path of the image you want to convert to Ascii 
# # outputFile is for the file path of where the generated Ascii art should be stored keep None if you don't want to 
# store it in a .txt file ImageToAscii(imagePath="path/to/file",outputFile="output.txt") `
name = input('What pokemon you wanna see?')
url = f'https://pokeapi.co/api/v2/pokemon/{name}'
response = requests.get(url)
data=response.json()

img_url = data["sprites"]["front_shiny"]


img = Image.open(requests.get(img_url, stream = True).raw)
img.save(f'temp_ascii.png')


ImageToAscii(imagePath='/Users/seancurrie/Documents/Coding-Temple/WEEK-4-SQL/DAY-4/temp_ascii.png')

# ImageToAscii(imagePath="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png")

# import requests # request img from web
# import shutil # save img locally

# url = input('Please enter an image URL (string):') #prompt user for img url
# file_name = input('Save image as (string):') #prompt user for file_name

# res = requests.get(url, stream = True)

# if res.status_code == 200:
#     with open(file_name,'wb') as f:
#         shutil.copyfileobj(res.raw, f)
#     print('Image sucessfully Downloaded: ',file_name)
# else:
#     print('Image Couldn\'t be retrieved')