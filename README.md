# Rails Sales Taxes Kata
## Description:
This application will let you upload a text file, and will parse the contents to create a receipt with the adjusted prices due to their tax categories.
The input text file will currently need to emulate the following:
```
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```
or in terms of what each element in the string represents:
```
<quantity> <description> at <price>
```
user create functionality is currently limited to orders, but can be easily scaled up from this point.


* Ruby version: Built on Ruby 2.7.2

* Configuration:
  1. git clone
  2. bundle install
  3. rails db:{create,migrate,seed}
  4. rails s
  5. navigate to localhost:3000

* Database creation: Created using psql and sqlite

* How to run the test suite
  1. git clone
  2. bundle install
  3. rails db:{creeate, migrate, seed}
  4. bundle exec rspec

>>>>>>> 22f384c (Update README.md)
