<h3 align="center">Read Tab Files for Company Sales</h3>

<p align="center"> Nuuvem web development test
    <br> 
</p>

## 📝 Table of Contents
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Built Using](#built_using)
- [Authors](#authors)

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You will need to have ruby 3.0.1 and MySQL server installed on your machine to run the project. You can install it following this [tutorial](https://gorails.com/setup/ubuntu/20.04):
 - https://gorails.com/setup/ubuntu/20.04

After doing all the setup of your machine. Enter the project folder and run:
```
bundle install
```
And
```
yarn install
```

Then configure your database file to connect to the database. 
Create a file called `database.yml` and copy the entire contents of the `database.example.yml` file into the file you just created, changing the information according to your credentials.

After all these steps, you need to create your database and tables. To do this, run the command:

```
rails db:create db:migrate
```

### Running project

Finished the step-by-step how to configure your machine, the project dependencies and create the database, there is only one thing left... Run the project!

Use

```
rails s
```

And everything should have gone well, so we have our project running on the server and we can already access the [local url](http://localhost:3000/).


## 🔧 Running the tests <a name = "tests"></a>

To run the tests is very simple, just run the command below:

```
rspec
```

## 🎈 Usage <a name="usage"></a>

The system is very simple and interactive. When accessing the home page you will need to create or sign in to an account. After that, you will have access to your user's dashboard.
On the first page of the dashboard we have the option to upload the `.tab` file. Once the upload is done, we have a notification that shows the total amount of sales that were on file.
We also have a navbar that can take you to the page that shows a table with all the company's sales and the total amount collected.

## ⛏️ Built Using <a name = "built_using"></a>

- [Mysql](https://www.mongodb.com/) - Database
- [Webpack](https://expressjs.com/) - JS Bundler
- [Ruby on Rails](https://vuejs.org/) - Web Framework

## ✍️ Authors <a name = "authors"></a>

- [@riulsudario](https://github.com/riulsudario)

