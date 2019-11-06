# Project: Quantified Self

## Visit the app on Heroku:
https://serene-reaches-07094.herokuapp.com/

## Contributors
* [Sejin Kim](https://github.com/froydroyce)

## About the Project  
* Koroibos was a solo project completed within a 48-hour timeframe to mock a technical take home challenge
* The purpose was to build a tested RESTful API with Olympian data imported from a CSV that exposes 6 endpoints that analyzes the data

## Tech Stack
* Ruby on Rails
* ActiveRecord
* PostgreSQL

## Packages Used
* Fast JSON API
* RSpec
* SimpleCOV

## Database Diagram
![schema](https://i.imgur.com/Yt0aNzP.png)

## Local Setup
  ### Instructions:
  1. Clone the GitHub repository
  2. Go to the directory with the new repo  
  3. Run `bundle install`
  4. Setup database:
     a) Run `rails db:{create,migrate}`
     b) Import data with `rails import:csv`
  5. To run the server: `rails s`

  ### Run tests:
  1. Run `rspec`
  2. To run a single test file: `rspec <test directory>`
  3. To generate coverage report: `open coverage/index.html`

## Endpoints

### Olympian Endpoints:

#### 1) User can get all Olympians

***Request:***
```
GET /api/v1/olympians
```

***Response Example:***
```
status: 200

{
    "data": [
        {
            "id": "1",
            "type": "olympian",
            "attributes": {
                "name": "Andreea Aanei",
                "age": 22,
                "sport": "Weightlifting",
                "team": "Romania",
                "total_medals_won": 0
            }
        },
        {
            "id": "2",
            "type": "olympian",
            "attributes": {
                "name": "Nstor Abad Sanjun",
                "age": 23,
                "sport": "Gymnastics",
                "team": "Spain",
                "total_medals_won": 0
            }
        },
        {...}
    ]
}
```

#### 2) User can get the youngest Olympian

***Request:***
```
GET /api/v1/olympians?age=youngest
```

***Response Example:***
```
status: 200

{
    "data": {
        "id": "2190",
        "type": "olympian",
        "attributes": {
            "name": "Ana Iulia Dascl",
            "age": 13,
            "sport": "Swimming",
            "team": "Romania",
            "total_medals_won": 0
        }
    }
}
```

#### 3) User can get the oldest Olympian

***Request:***
```
GET /api/v1/olympians?age=oldest
```

***Response Example:***
```
status: 200

{
    "data": {
        "id": "1321",
        "type": "olympian",
        "attributes": {
            "name": "Julie Brougham",
            "age": 62,
            "sport": "Equestrianism",
            "team": "New Zealand",
            "total_medals_won": 0
        }
    }
}
```

#### 4) User can get Olympian stats

***Request:***
```
GET /api/v1/olympian_stats
```

***Response Example:***
```
status: 200

{
    "data": {
        "id": null,
        "type": "olympian_stats",
        "attributes": {
            "total_competing_olympians": 2850,
            "average_weight": {
                "unit": "kg",
                "male_olympians": 77.9,
                "female_olympians": 61.4
            },
            "average_age": 26.4
        }
    }
}
```

### Event Endpoints:

#### 1) User can events specified to their sport

***Request:***
```
GET /api/v1/events
```

***Response Example:***
```
status: 200

{
    "data": [
        {
            "id": "1",
            "type": "sport",
            "attributes": {
                "name": "Weightlifting",
                "events": [
                    "Weightlifting Women's Super-Heavyweight",
                    "Weightlifting Men's Heavyweight",
                    "Weightlifting Men's Middleweight",
                    "Weightlifting Men's Middle-Heavyweight",
                    "Weightlifting Men's Featherweight",
                    "Weightlifting Women's Flyweight",
                    "Weightlifting Women's Middleweight",
                    "Weightlifting Women's Lightweight",
                    "Weightlifting Men's Lightweight",
                    "Weightlifting Men's Super-Heavyweight",
                    "Weightlifting Men's Light-Heavyweight",
                    "Weightlifting Women's Heavyweight",
                    "Weightlifting Women's Light-Heavyweight",
                    "Weightlifting Men's Bantamweight",
                    "Weightlifting Women's Featherweight"
                ]
            }
        },
        {...}
    ]
}
```

#### 2) User can get a specific event's medalists

***Request:***
```
GET /api/v1/events/:id/medalists
```

***Response Example:***
```
status: 200

{
    "data": {
        "id": null,
        "type": "event_medalist",
        "attributes": {
            "event": "Rowing Men's Coxless Pairs",
            "medalists": [
                {
                    "name": "Giovanni Abagnale",
                    "team": "Italy",
                    "age": 21,
                    "medal": "Bronze"
                },
                {
                    "name": "Hamish Byron Bond",
                    "team": "New Zealand",
                    "age": 30,
                    "medal": "Gold"
                },
                {
                    "name": "Lawrence Brittain",
                    "team": "South Africa",
                    "age": 25,
                    "medal": "Silver"
                },
                {
                    "name": "Marco Di Costanzo",
                    "team": "Italy",
                    "age": 24,
                    "medal": "Bronze"
                }
            ]
        }
    }
}
```

