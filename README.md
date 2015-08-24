# Hair Salon

#### Hair Salon is a web app to help organize clients and stylists, August 23rd, 2015

#### By _**Tim KEllogg**_

## Description 

_Hair salon is designed as a simple web app built through Sinatra and Postgres that provides admins of hair salons an easy way to manage clients and stylists._

## Setup 

##### Database setup:

* CREATE DATABASE hair_salon 
* \c hair_salon
* CREATE TABLE clients (id serial PRIMARY KEY, fname varchar, lname varchar, address varchar, hair_color varchar, phone varchar, stylist_id int);
* CREATE TABLE stylists (id serial PRIMARY KEY, fname varchar, lname varchar, styles varchar);


##### Running the application:

* Download the Repo
* `cd` into the Directory
* `ruby app.rb` to start the server
* `rspec` to test

## Technologies Used

* Testing: RSpec, Capybara, launchy
* Stack: Ruby/Sinatra
* Middleware: Rack
* Database: Postgres
* Front-End: jQuery, Foundation, modernizr

### Legal

Copyright (c) 2015 _**Tim Kellogg**_

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
