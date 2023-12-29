import os
import requests
import json
parts = ['chest', 'cardio', 'back', 'lower%20arms', 'lower%20legs', 'neck',
         'shoulders', 'upper%20arms','upper%20legs', 'waist']
url = 'https://exercisedb.p.rapidapi.com/exercises/bodyPart/'
names = ['chest', 'cardio', 'back', 'lower arms', 'lower legs',
         'neck', 'shoulders', 'upper arms', 'upper legs', 'waist']
querystring = {"limit":"100"}
headers = {
    "X-RapidAPI-Key": "b881f6ff6cmsha0aa9b600787d60p1dd874jsn0a516986ca32",
	"X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
}
result = {}
for i in range(len(parts)):
    response = requests.get(url+parts[i], headers=headers, params=querystring)
    result[names[i]] = response.json()
    print(response.json())

save_file = open("partExercises.json", "w")
json.dump(result, save_file, indent=6)
save_file.close()    