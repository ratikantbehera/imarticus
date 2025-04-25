# ABOUT
## Dataset
- The dataset contains 1000 records
- Each record contains details about a particular student
- The following details are provided in the dataset
  - **student_id** of the student
  - **age** of the student
  - **gender** of the student
  - **study_hours_per_day**: The amount of hours the student dedicates for studies in a day
  - **social_media_hours**: The amount of hours the student spends his/her time on social media
  - **netflix_hours**: The amount of hours the student spends on netflix or other OTT platforms
  - Does the student engage in a **part_time_job**? `Yes` or `No`
  - The **attendance_percentage** of the student
  - The **sleep_hours** of the student
  - The **diet_quality** of the student: `Poor`, `Fair` or `Good`
  - The **exercise_frequency** of the student
  - **parental_education_level**: The education level of the parent of the student
  - The **internet_quality** available to the student: `Poor`, `Average`, `Good`
  - **mental_health_rating**: The mental health status of the student
  - Does the student engage in **extracurricular_participation**? `Yes` or `No`
  - What was the **exam_score** of the student?
## Objective
- To predict the academic performance i.e. the `exam_score` field, based on the other parameters
## Outcome
- A **Machine Learning** model was built using `Linear Regression`
- The model predicts the marks with a margin of $$\pm$$ `5 marks`
