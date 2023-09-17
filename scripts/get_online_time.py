import urllib.request, json
req = urllib.request.urlopen('http://worldtimeapi.org/api/timezone/America/Sao_Paulo').read()
print(json.loads(req)["datetime"])
