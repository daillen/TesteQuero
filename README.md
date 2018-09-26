# TesteQuero

# How to run
- You must have ruby installed with rails 5 and bundle gems
- You also need a mysql client running
- Inside the root directory run "bundle install"
- There must be an user named "billinho" with a password "password" in the mysql database
- Create the databases "rails db:create"
- Run the migrations "rails db:migrate"
- Run the migrations for the test environment "rails db:migrate RAILS_ENV=test"
- To start the server "rails server"

# Specs
All tests were made using BDD with the gem RSpec-rails, they cover a great 
deal of the functionalities such as models, requests, services and mailers.

I've decided not to implement tests for the controllers because the requests 
specs already confirm if the controller did its job or not for they are the 
endpoints of the application.

- *To run the tests run "rspec"*

# Models 
The only change I made regarding to the models was the addition of email to 
alunos. That was necessary to allow the mailer to send the aluno an email 
after the matricula was made.

# Routes
There are a total of 11 routes in this application, 3 for alunos, 3 for 
instituicoes, 3 for matriculas and 2 for faturas.

They are:

- GET "/alunos" -> lists all alunos
- GET "/alunos/:id" -> show aluno that has the given id
- POST "/alunos" -> create a new aluno given a JSON

- GET "/instituicaos" -> lists all instituicoes
- GET "/instituicaos/:id" -> show instituicao that has the given id
- POST "/instituicaos" -> create a new instituicao given a JSON

- GET "/matriculas" -> lists all matriculas
- GET "/matriculas/:id" -> show matricula that has the given id
- POST "/matriculas" -> create a new matricula given a JSON

- GET "/faturas" -> lists all faturas
- GET "/faturas/:id" -> show fatura that has the given id

# Controllers
Each controller except for the faturas one, have 2 GET and 1 POST actions, they are: 
- *index* to show all models of that type, for example, AlunosController#index shows all alunos that are in the database.
- *show* to show a model that has the given id
- *create* to create a new model given a JSON

The FaturasController only have the index and show actions for the faturas are 
created by the MatriculasController

I separated the logic of building the faturas from the MatriculasController 
and put it inside FaturaService to make the controller smaller and easier to 
maintain. Also this way I can test the FaturaService more easily.


# Regarding currency
When the division of the total cost of the matricula to the faturas has more 
than 2 decimal places I've decided to always round the 2nd decimal digit up, 
so that the total sum of the faturas is never less than the original value.

For example, if the total cost of the matricula is R$1237 and the number of
matriculas is 24 the division of 1237 and 24 results in an repeating 
decimal 51.5416666..., this will be rounded to 51.55 and the resulting sum 
of the faturas will be R$1237.20.
 
# Regarding vencimentos
When the day chosen in the matricula is greater than the final day of a 
month, its final day will be chosen instead.

For example, the matricula is made in 2018-02-09 and the day chosen is 31, 
then the first vencimento will be 2018-02-28 for 28 is the last day of 
february.

