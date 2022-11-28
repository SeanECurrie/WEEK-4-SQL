#import the packages we need:
import requests



# using the request package to access data from api/url
response = requests.get(url)

#check and make sure we got a successful response from the API
#response.status_code: 200 = Success, 400 = Failed
#response.ok: True = Success, False = Failed
response.status_code
response.ok

# .json() is a dictionary type
type(response.json())

# We only want the Driver Standings
driver_standings_data = response.json()['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']
# driver_standings_data

# Use a for loop to display all driver full names
driver_standings_data[0]
for driver in driver_standings_data:
    print(driver['Driver']['givenName'], driver['Driver']['familyName'])

    #Making a more flexible function to handle different years and rounds
def get_driver_info_year_round(year, rnd):
    url = f'http://ergast.com/api/f1/{year}/{rnd}/driverStandings.json'
    response = requests.get(url)
    if response.ok:
        data = response.json()['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']
        return get_driver_info(data)
    else:
        return 'That year or round is invalid.'

# get_driver_info_year_round(2020, 5)