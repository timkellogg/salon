Hair Salon

Contributors: Tim Kellogg

Setting up database:

                                Table "public.clients"
   Column   |       Type        |                      Modifiers
------------+-------------------+------------------------------------------------------
 id         | integer           | not null default nextval('clients_id_seq'::regclass)
 fname      | character varying |
 lname      | character varying |
 address    | character varying |
 hair_color | character varying |
 phone      | character varying |
 stylist_id | integer           |
Indexes:
    "clients_pkey" PRIMARY KEY, btree (id)


                              Table "public.stylists"
 Column |       Type        |                       Modifiers
--------+-------------------+-------------------------------------------------------
 id     | integer           | not null default nextval('stylists_id_seq'::regclass)
 fname  | character varying |
 lname  | character varying |
 styles | character varying |
Indexes:
    "stylists_pkey" PRIMARY KEY, btree (id)


Running the application:

Download the Repo
cd into the Directory
ruby app.rb to start the server
rspec to test

Technologies Used

RSpec, Capybara, Ruby/Sinatra

Legal
Copyright (c) 2015 Tim Kellogg

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
