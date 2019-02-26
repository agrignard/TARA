import pandas as pd

file = pd.read_csv('LOG00045.csv')
outputFile= open('LOG00045_every10sec.csv','w')
i=1
outputFile.write('DateTime,x,y,z,Temperature,Lux,Humidity,Proximity,Pressure,Altitude,Roll,Pitch')
outputFile.write('\n')
for index, row in file.iterrows():
    i+=1
    if((i-3) % 20 == 0):
        outputFile.write(row['DateTime'])
        outputFile.write(',')
        outputFile.write(str(row['x']))
        outputFile.write(',')
        outputFile.write(str(row['y']))
        outputFile.write(',')
        outputFile.write(str(row['z']))
        outputFile.write(',')
        outputFile.write(str(row['Temperature']))
        outputFile.write(',')
        outputFile.write(str(row['Lux']))
        outputFile.write(',')
        outputFile.write(str(row['Humidity']))
        outputFile.write(',')
        outputFile.write(str(row['Proximity']))
        outputFile.write(',')
        outputFile.write(str(row['Pressure']))
        outputFile.write(',')
        outputFile.write(str(row['Altitude']))
        outputFile.write(',')
        outputFile.write(str(row['Roll']))
        outputFile.write(',')
        outputFile.write(str(row['Pitch']))
        outputFile.write('\n')
outputFile.close
        
    
