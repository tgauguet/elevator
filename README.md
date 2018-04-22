# Je rêve d'une maison's technical test

The goal is to create an elevator
* Each floor have to buttons : up / down
* When a call is created, the elevator goes to the requested floor
* As long as the elevator have calls to go up and that the elevator goes up, it goes up and don't take the calls to go down
* As long es the elevator have calls to go down and that the elevator goes down, it goes down and don't take the calls to go up
* The elevator do not teleport

## Setup

```
git clone https://github.com/tgauguet/elevator.git
cd elevator
rails db:create
rails db:migrate
rails db:seed

rails s
```

## Example

![alt text](https://github.com/tgauguet/elevator/blob/master/app/assets/images/sample.pngr)

## Notes

* Multiple elevators can be used at the same time
* An event occurs when the home page is refreshed
* When peoples goes inside the elevator, calls are made randomly
* When the elevator is empty, it goes down to floor 0

## About

* Ruby version 2.3.1
* Rails version 5.2.0
* PostrgreSQL
* Active Record
