# Rails Sales Taxes Kata

## Solution Rails Application
To run this app, run the following commands in the app directory:

`bundle install`

`rails db:create`

`rails db:migrate`

`rails server`

Run the specs with the `rspec` command.

Navigate to `http://localhost:3000` to view the app.

Use the `choose file` button to upload your basket txt file. 
Previously generated receipts will be accessible from the home page after upload.

## Introduction

You should provide sufficient evidence that your solution is complete by,
as a minimum, indicating that it works correctly against the supplied test data.

## PROBLEM

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt.
Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items, I receive a receipt that lists the name of all the items and their price (including tax),
finishing with the total cost of the items and the total amounts of sales taxes paid.

The rounding rules for sales tax are that for a tax rate of n%, a shelf price
of p contains (np/100 rounded up to the nearest 0.05, ex. 0.5625 => 0.60, 1.649 => 1.65, 1.61 => 1.65)
amount of sales tax.

The application should only ask to the user to upload a file with the content of a basket and print the receipt on a
web page.

### INPUT

The files basket_1.txt, basket_2.txt, and basket_3.txt are the three input files for the application.

Write a Rails application that prints out the receipt details for the three baskets provided.

### EXPECTED OUTPUT

You can format the output in any way you like. Make sure that the results are correct,
and all the fields are included.

basket_1.txt:

- 1 book : 12.49
- 1 music CD: 16.49
- 1 chocolate bar: 0.85
- Sales Taxes: 1.50
- Total: 29.83

basket_2.txt:

- 1 imported box of chocolates: 10.50
- 1 imported bottle of perfume: 54.65
- Sales Taxes: 7.65
- Total: 65.15

basket_3.txt:

- 1 imported bottle of perfume: 32.19
- 1 bottle of perfume: 20.89
- 1 packet of headache pills: 9.75
- 1 imported box of chocolates: 11.85
- Sales Taxes: 6.70
- Total: 74.68
