# Getting-and-Cleaning-Data-Course-Project

This Repository contains:

* README.md - this file
* Codebook.md - for the tidy data file - data.txt
* run_analysis.R - R script that created the tidy tables and explained below:

##run_analysis.R does the following:

	1. Unzip UCI HAR Dataset.zip located in the source directory.
	
	2. Merge subject data , activity and measurement for both Test and Train using rbind() and combine these tables into one table using cbind().
	
	3. Measurement column names that match the "mean" or "std" pattern is used to extract mean and standard deviation variables from the merged data.
	
	4. Load the activities label table and replace the labels with descriptive name. Labels are converted to lower case and its underscore is replaced with space.
	
	5. The extracted data in 3. is merged with the activities label table by ActivityID variable.
	
	6. Next, the ActivityID variable is removed from the extracted data as there is an existing Activity variable whish is more descriptive present in the table.
	
	7. Using the Aggregate(), the table applys the Mean() on all measurement variables by the Activity and SubjectID.
	
	8. Lastly, the clean data is written to source folder with the name "data.txt".
	
##To run the script:

	1. Clone this repository
	
	2. Download the zip file into your repository directory from this site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	
	3. Open your RStudio and set the working directory to the repository directory.
	
	4. Run run_analysis.R script
	
	5. Script will run and export the tidy data "data.txt" to the repository directory
		