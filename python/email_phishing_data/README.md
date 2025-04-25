# ABOUT
## Dataset
- The dataset contains 524846 records
- Each record represents a single email received
- Each record is then classified as whether it is spam or not
- The following details are provided in the dataset
  - **num_words** - Total number of words in the email body
  - **num_unique_words** - Count of unique words used
  - **num_stopwords** - Count of common stopwords (e.g., "the", "and", "in")
  - **num_links** - Number of hyperlinks detected
  - **num_unique_domains** - Number of unique domains in links (e.g., "paypal.com")
  - **num_email_addresses** - Count of email addresses found in the text
  - **num_spelling_errors** - Count of misspelled words
  - **num_urgent_keywords** - Number of urgent words (e.g., "urgent", "verify", "update")
  - **label** - Target variable: 0 = Safe Email, 1 = Phishing Email
## Objective
- The objective was to build an **Machine Learning** model to predict whether a given email was `Safe` or `Phishing` based on the parameters provided in the dataset
## Outcome
- An **ML** model was built using `Logistic Regression`
- Its predictive power was **97\%** accurate
