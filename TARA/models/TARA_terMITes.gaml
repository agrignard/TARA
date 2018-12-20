/***
* Name: TARA
* Author: Arno
* Description: 
* Tags: Tag1, Tag2, TagN
***/

model TARA

global {
	
	init {
		shape<-square(1);
		//create iris agents from the CSV file (use of the header of the CSV file), the attributes of the agents are initialized from the CSV files: 
		//we set the header facet to true to directly read the values corresponding to the right column. If the header was set to false, we could use the index of the columns to initialize the agent attributes
		//create terMITesData from:csv_file( "../includes/18_10_2018_10min.csv",true) with:
		create terMITesData from:csv_file( "../includes/19_10_2018_17_to_18_1h.csv",true) with:
			[   DateTime::float(get("DateTime")), 
				Accelerometer::float(get("Accelerometer")), 
				x::float(get("x")),
				y::float(get("y")),
				z::float(get("z")),
				Temperature::float(get("Temperature")),
				Lux::float(get("Lux")), 
				Humidity::float(get("Humidity")),
				Proximity::float(get("Proximity")),
				Pressure::float(get("Pressure"))- 102000 ,
				Altitude::float(get("Altitude")),
				Roll::float(get("Roll")),
				Pitch::float(get("Pitch"))
			];	
	}
}

species terMITesData{
	
	float x;
	float y;
	float z;
	
	float DateTime;
	float Accelerometer;
	float Temperature;
	float Lux;
	float Humidity;
	float Proximity;
	float Pressure;
	float Altitude;
	float Roll;
	float Pitch;
	aspect default{
		draw box(0.01,0.02,0.005) at:{x,y,-z-9} rotate:Pitch color:rgb((Altitude+80)*100,(Roll-170)*10,(Pitch+10)*10);
		
	}
	
}

experiment main type: gui{
	output {
		/*display map type:opengl background:#black draw_env:true{
			species terMITesData;
		}*/
		
		display "Environment" type: java2D synchronized: true
		{			
			chart "Temperature, Humidity" type: series x_label: "#points to draw at each step"

			{
				data "Temperature" value: terMITesData collect (each.Temperature) color: # red marker: false style: line;
				data "Humidity" value: terMITesData collect (each.Humidity) color: # green marker: false style: line;
				
			}
		}
		
		
		display "Pressure" type: java2D synchronized: true
		{	
			chart "Pressure" type: series 

			{
				data "Pressure" value: (terMITesData collect (each.Pressure))color: # green marker: false style: line;	
			}
		}
		
		
		display "X,Y,Z" type: java2D synchronized: true
		{
			
			chart "Acceleration" type: series 

			{
				data "X" value: terMITesData collect (each.x) color: # red marker: false style: line;
				data "Y" value: terMITesData collect (each.y) color: # green marker: false style: line;
				data "Z" value: terMITesData collect (each.z) color: # blue marker: false style: line;
			}

		}
		
		
		display "Acceleration" type: java2D synchronized: true
		{
			
			chart "Acceleration" type: series 

			{
				data "Accelerometer" value: terMITesData collect (each.Accelerometer) color: # purple marker: false style: line;
			}

		}
		
		display "Pitch" type: java2D synchronized: true
		{
			chart "Picth" type: series 

			{
				data "Pitch" value: terMITesData collect (each.Pitch) color: # blue marker: false style: line;
			}

		}
		
		display "Roll" type: java2D synchronized: true
		{
			chart "Roll" type: series 

			{
				data "Roll" value: terMITesData collect (each.Roll) color: # red marker: false style: line;
			}

		}
		
	}
	
}