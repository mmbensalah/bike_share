# README

We created this app as a final TDD Rails project for BackEnd Module 2. This README outlines our process, so that future students might use it as resource for their own beginning Rails projects. 

Our app consists of 2 main portions: 
  1. Analysis of San Francisco's bike share data in an interactive format
  2. A rudimentary online store (bike-shop)

Below you will find: 
  1. Tools
  2. Learning Objectives
  3. Challenges
  
 TOOLS: 

  1. Rails version 5.1.6
  2. Ruby version 2.4.1
  3. Text Editor - Atom
  4. Postgresql Database
  5. Waffle.io - Project Management
  5. Gems 
     Test Development:
     
     1. RSPEC - testing suite
     2. Shoulda Matchers - allows for one line test validations
     3. Nyan Cat Formatter - for fun
     4. Factory Bot - generates test data
     5. Faker - generates specific test data for Factory Bot
     6. SimpleCov - checks percentage of code that has been tested
     7. Pry - debugging tool
     8. Database Cleaner - wipes test db after running tests
     9. Launchy - insert "save_and_open_page" in test to see what page looks like
    10. By Star - allows user to query ActiveRecord based on time
    
 LEARNING OBJECTIVES:
 
  1. Use TDD to create a Rails web application
  2. Understand and use MVC 
  3. Build out CRUD functionality
  4. Create User/Admin functionality - implement enums and memoization
  5. Properly utilize namespacing to restrict user access/enable admin access
  6. Use sessions/cookies for "stateful" protocol
  7. Create online shopping cart/checkout
  8. ActiveRecord queries to improve AR knowledge
  
 CHALLENGES:
 
  1. AR relationships 
  2. Feature testing 
      - creating a comprehensive test before working on code
      - not coding ahead of test failures
  3. Heroku - image loading in production
  4. Utilizing enormous CSV files for seed
  5. Active Record queries
    ```def destination_station
        Station.select("stations.*, count(trips.end_station_id) as station_count")
        .where("trips.start_station_id = ?", id)
        .joins("join trips on trips.start_station_id = stations.id")
        .order("station_count desc")
        .limit(1)
        .group("trips.end_station_id, stations.id")
        .first
       end```
       
   
    


