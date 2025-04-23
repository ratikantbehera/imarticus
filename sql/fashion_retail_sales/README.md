<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/MaxMara-2542.jpg/960px-MaxMara-2542.jpg" width="22%" height="22%"/>
</p>

# ABOUT
## Dataset
- The dataset contains 3400 records of online sales of fashion items
- Each record represents a sales
- The following details are mentioned
  - **ID**: The Transaction id of each sales
  - **Item**: What was sold
  - **Amount**: Total Price of the item sold
  - **Date** of transaction
  - Customer **Rating** (*null* if customer didn't rate)
  - **PaymentMethod**
## Insights
- The following insights were generated
  - Partioning the records based on
    - whether the orders were `completed` or `pending`/`cancelled`
      - by *Customer* and *Item*
  - Extracting the unrated orders
  - *Completed* but *Unrated* orders
  - Summarizing the Revenue based on
    - *PaymentMethod*
    - *Item*
    - *Customer* and *Item*
    - *Year* of transaction
  - *Ratings* per *item*
## Script
The aforementioned insights were generated using the code in the script file
