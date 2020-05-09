# README

It's an simple scrabble-club system to store member's information and provide leader boards to show their top performing players.

Ruby version: Ruby-2.6.1, Rails version: Rails-5.2.4.2, DB: Postgresql

1. Remaining Functionality:

  No functionality in remained as per my understanding.

2. Which type of problem's you've faced during the test.

  As I have tried to complete this application with follows the coding convention of Ruby on Rails, I have also used some design-patterns. I have faced an minor issue("To calculate High-Score of Member").

3. I have used following gems:
  - gem "twitter-bootstrap-rails"
    To apply the bootstrap layout in application.

  - gem 'faker'
    To create the sample the data for the application.

  - Steps that needs to be executed before running this application:

    * clone the application
    * Go in app directory
    * Install the apropriate Ruby version (i.e. ruby-2.6.1) & Rails version (i.e. rails-5.2.4.2
    * Use the above Ruby and Rails versions.
    
    * Create in "database.yml" in "/config" folder.
    
    * put the following environment configuration settings in "database.yml".
      

      default: &default
        adapter: postgresql
        encoding: unicode
        # For details on connection pooling, see Rails configuration guide
        # http://guides.rubyonrails.org/configuring.html#database-pooling
        pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
        username: postgres_username
        password: postgres_password

      development:
        <<: *default
        database: scrabble_club_dev

      test:
        <<: *default
        database: scrabble_club_test

      production:
        <<: *default
        database: scrabble_club_production
        username: scrabble_club
        password: <%= ENV['SCRABBLE_CLUB_DATABASE_PASSWORD'] %>



    * run the following commands in app directory to configure the application

      /scrabble_club$ bundle install
        To install the dependancies

      /scrabble_club$ rake db:create
        To create the Database

      /scrabble_club$ rake db:migrate
        To create the tables in the DB

      /scrabble_club$ rake db:seed
        To install the sample Database in the DB

      /scrabble_club$ rails s
        To run the rails server on local environment

    * Open the Browser the following URL:
      http://localhost:3000/


4. Features that I have implemented:

  - Member Leaderboard:
    To show top 10 average scorer that have played atleast 10 matches.

  - Edit Member:
    To Edit the Member information (like. first_name, last_name, contact_number)

  - Member profile's Screen:
    * Number of Wins
    * Number of Losses
    * Their Average
    * Their highest score, when and where it was scored, and against whom

  - Create Matches
    * We can create this feature from backend(rails console or using dummy data)
