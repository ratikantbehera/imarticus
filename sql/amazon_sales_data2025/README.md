<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/0/06/Amazon_2024.svg" width="16%" height="16%"/>&trade;
</p>

# ABOUT
## Dataset
- The dataset consists of 250 records
- Each record represents the order that took place at [**Amazon**](https://amazon.com)&trade; during the month of February and March 2025 in the US
- The following details are mentioned in the dataset
  - **Order ID**: The order ID of each transaction
  - **Date**: The date at which the transaction took place
  - **Product**: The product that was ordered
  - **Category**: The category to which the product belongs to
  - **Price**: Unit Price of the item
  - **Quantity**: Units of the item ordered
  - **Total Sales**: The total Price of the items i.e $$Price\times Qauntity$$
  - **Customer Name**: The customer who ordered the item
  - **Customer Location**: Where the order is to be delivered
  - **Payment Method**: How did the customer pay i.e. *Debit Card*, *Amazon Pay*, *Credit Card* etc.
  - **Status**: Whether the order was *Completed*, *Cancelled* or is *Pending*
## Insights
- The following insights were generated
  - Partioning the records based on *Status*
  - Proportion of *Orders* based on *Status*
  - Summarizing *Completed* transactions based on
    - *Product*
    - *Category*
    - *Customer*
    - *Payment Method*
    - *Location*
## Script
The aforementioned insights were generated using the code in the script file
