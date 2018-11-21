/**
* Name: Convertion of CSV data to Matrix
* Author:  Patrick Taillandier
* Description: Model which shows how to initialize a matrix by using the content of a CSV File. The model load a CSV File, and write its content in the console. 
* Tags: csv, load_file
*/


model CSVfileloading

global {
	file my_csv_file <- csv_file("../includes/LOG00037.csv",",");

	
	
	matrix data;
	
	init {
		//convert the file into a matrix
		data <- matrix(my_csv_file);
		//loop on the matrix rows (skip the first header line)
		/*loop i from: 1 to: data.rows -1{
			//loop on the matrix columns
			loop j from: 0 to: data.columns -1{
				write "data rows:"+ i +" colums:" + j + " = " + data[j,i];
			}	
		}*/		
	}
}

experiment main type: gui{

output{
	display "X,Y,Z" type: java2D synchronized: true
	{
			
			chart "X,Y,Z" type: series 

			{
				data "X" value: data column_at (2) color: # red marker: false style: line;
				data "Y" value: data column_at (3) color: # green marker: false style: line;
				data "Z" value: data column_at (4) color: # blue marker: false style: line;
			}

	}
	
	
	display "Temperature" type: java2D synchronized: true
	{
			chart "Temperature" type: series 

			{
				data "Temperature" value: data column_at (5) color: # red marker: false style: line;
			}

	}
	
	display "Humidity" type: java2D synchronized: true
	{
			chart "Humidity" type: series 

			{
				data "Humidity" value: data column_at (7) color: # red marker: false style: line;
			}

	}
	
	display "Pressure" type: java2D synchronized: true
	{
			chart "Pressure" type: series 

			{
				data "Humidity" value: data column_at (9) color: # red marker: false style: line;
			}

	}
	
	display "Roll" type: java2D synchronized: true
	{
			chart "Roll" type: series 

			{
				data "Roll" value: data column_at (11) color: # red marker: false style: line;
			}

	}
	
	display "Roll" type: java2D synchronized: true
	{
			chart "Roll" type: series 

			{
				data "Roll" value: data column_at (10) color: # red marker: false style: line;
			}

	}
	
	display "Pitch" type: java2D synchronized: true
	{
			chart "Pitch" type: series 

			{
				data "Pitch" value: data column_at (11) color: # red marker: false style: line;
			}

	}
	
}
}
