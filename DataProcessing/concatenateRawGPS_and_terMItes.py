import pandas as pd

fileGPS = pd.read_csv('tara_tsg_20181006_20181026_cleaning.csv')
fileTerMITes = pd.read_csv('LOG00045_every10sec.csv')
outputFile= open('tara_tsg_20181006_20181026_gps_terMITes.csv','w')
i=1
offset=7679
outputFile.write('latitude,longitude,DateTime,x,y,z,Temperature,Lux,Humidity,Proximity,Pressure,Altitude,Roll,Pitch')
outputFile.write('\n')
for index, row in fileGPS.iterrows():
    i+=1
    if(i>offset):
        outputFile.write(str(fileTerMITes.iloc[i-offset]['DateTime']))
        outputFile.write(',')
        
        outputFile.write(str(row['lat']))
        outputFile.write(',')
        outputFile.write(str(row['lng']))
        outputFile.write(',')
        #outputFile.write(str(row['time']))
        #outputFile.write(',')
        #outputFile.write(str(row['datestring']))
        #outputFile.write(',')
    
    
        outputFile.write(str(fileTerMITes.iloc[i-offset]['x']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['y']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['z']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Temperature']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Lux']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Humidity']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Proximity']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Pressure']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Altitude']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset]['Roll']))
        outputFile.write(',')
        outputFile.write(str(fileTerMITes.iloc[i-offset ]['Pitch']))
        outputFile.write('\n')
        #else:
        #outputFile.write('NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA,NO_DATA')

outputFile.close
        
    
