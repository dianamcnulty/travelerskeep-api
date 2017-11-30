# Traveler's Keep

## Description
Traveler's Keep is an app to help those with a wanderlust keep the memories of their adventures in organized. The user is presented with a map of places they've seen. When they click on the map they are navigated to a collection of photos and stories from that journey that they uploaded. Users have the option to add more photos and stories, and can create new vacations at any time.

## Project Links

#### Client
- Client Deployed Site: https://dianamcnulty.github.io/travelerskeep-client/
- Client Github Repo: https://github.com/dianamcnulty/travelerskeep-client

#### API
-API Deployed site: https://travelerskeep.herokuapp.com/
-API Heroku Repo: https://dashboard.heroku.com/apps/travelerskeep
-API Github Repo: https://github.com/dianamcnulty/travelerskeep-api/wiki




## Dependencies

Install with `bundle install`.

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)

-   [`aws-sdk`](https://github.com/aws/aws-sdk-ruby)
-   [`paperclip`](https://github.com/thoughtbot/paperclip)

## API

!!!Resourse API info goes here!!!

Scripts are included in [`scripts`](scripts) to test actions.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

### Vacations
| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| GET    | `/vacations`           | `vacations#index`   |
| GET    | `/vacations/:id`       | `vacations#show`    |
| POST   | `/vacations`           | `vacations#create`  |
| PATCH  | `/vacations/:id`       | `vacations#update`  |
| DELETE | `/vacations/:id`       | `vacations#destroy` |

### Stories
| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| GET    | `/stories`             | `stories#index`     |
| GET    | `/stories/:id`         | `stories#show`      |
| POST   | `/stories`             | `stories#create`    |
| PATCH  | `/stories/:id`         | `stories#update`    |
| DELETE | `/stories/:id`         | `stories#destroy`   |

### Photos (patch and delete not yet in use on front end)
| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| GET    | `/photos`              | `photos#index`      |
| GET    | `/photos/:id`          | `photos#show`       |
| POST   | `/photos`              | `photos#create`     |
| PATCH  | `/photos/:id`          | `photos#update`     |
| DELETE | `/photos/:id`          | `photos#destroy`    |

### Countires (read only)
| Verb   | URI Pattern            | Controller#Action   |
|--------|------------------------|---------------------|
| GET    | `/countries`           | `countries#index`   |
| GET    | `/countries/:id`       | `countries#show`    |


## Development Planning

## Future Improvements
- include update and delete functionality for photos. The methods are available, but have not been used with the client, and are therefor untested.
- establish relationship between vacation table to countries via foreign key on the vacation table
- eventually incoroporate sharing capabilities, so user can share photos and stories with other users, especially those listed as 'companions' on the vacation details.

### Planning Documentation

#### ERD
![github image](/documentation/ERD-traverlers-keep.png)

#### Backlog
https://trello.com/b/4VbYwsnP/travelers-keep

### Process

I started with a high level idea that I wanted to store photos that could be organized by location, by allowing the user to click on a map. Before the project work time started I spent some time researching how to incorporate maps into a javascript front end app. I found several third party API's and libraries, and experimented with a few of them. I found jVectormap to be the most appropriate for my project because of it's simplicity.
There are some beatiful mapping libraries out there but they have far too many features for my purposes, and I wanted something clean and easy to use.

That being said I did run into some pitfalls incorporating it. I originally wanted to use a front end framework (Angular to be precise) but since this library relies heavily on jquery I suspected that choice would come with some challenges. Before I made a commitment to Angular I created a 'playground' Angular app for myself to see if I could get the map to work with the component structure. Unfortunately, I wasn't able to get it to work. After a day of trying, I was able to get the map to finally display in the window (although it was TINY!), but none of the information was coming though, and the click handlers were broken.

Since my timeline was short I decided to pivot and scrap the framework, which gave me time to incorporate other features on the backend API. (photo storage on AWS S3, a resource for countries to populate my dropdowns, etc.)

Once that decision was made, and after I had wireframes created, and a backlog started. I went ahead with development. I started with the API, scaffolded my resources and made sure they were working on the backend. I started with vacations, and then added photos and stories.
Once those were running on the back end, I created the front end client and wired up my UI to the resources. I probably should have done the work for each resource individually, but instead the work was organized by 'page' in the UI. For example all the requests that were needed for the map view were done first, then for the content view. I didn't do any update calls until last because they had their own templates. In hindsight that may not have been the best approach given the short deadline, and the requirements to have all CRUD actions included in the app. However I was able to get the work done for my highest priority resources. Update and delete for photos was saved for last since it's not as high a priority for me as updating and deleting a vacation or story (the only thing to update is the caption). Those actions will be saved for the next iteration due to the approaching deadline.
