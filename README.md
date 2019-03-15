# ClassFinder

## App Description

 Will give students access to directions from any given location to a class on campus



## 1. User Stories (Required and Optional)

**Required Must-have Stories**

 * User has the ability to put the name of a building as well as the class number.
 * Displays directions to the specified classroom.
 * 

**Optional Nice-to-have Stories**

 * Ability to use AR to visualize directions.
 * Save classrooms for easy access.

## 2. Screen Archetypes

 * Will start off asking for an input of a class and building
 * Will then display written/visual directions on a map.
   * Give you an estimated journey time. 
  

## 3. Navigation

**Tab Navigation** (Tab to Screen)

 ```* [User search]```
 ```* [Map]```

**Flow Navigation** (Screen to Screen)

 * Classroom search screen
   * Detailed written directions
   * Visual directions
   
## Schema 

#### Existing API Endpoints
##### An API Of Ice And Fire
- Base URL - [http://www.anapioficeandfire.com/api](http://www.anapioficeandfire.com/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /characters | get all characters
    `GET`    | /characters/?name=name | return specific character by name
    `GET`    | /houses   | get all houses
    `GET`    | /houses/?name=name | return specific house by name
