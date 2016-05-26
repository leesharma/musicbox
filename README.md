# Demo Basic API Project (Musicbox)

This app has a basic API with two endpoints:

- **`GET /api/v1`** responds with some basic API data
- **`POST /api/v1/feedback`** posts feedback to the database

## Getting Started

Download the app/clone it locally and run `bin/setup` to set it up. To run the
tests, run `rake test`. If those all pass, run `rails server` to start the server.

### POST /api/v1/feedback

Example Data: *(requires message and valid user_id)*
```json
'{
  "feedback" : {
    "message" : "hello world",
    "user_id" : 1
  }
}'
```

Example Response (status 201 created: feedback message and user):
```json
'{
  "message" : "hello world",
  "user" : "foo@example.bar"
}'
```

Example Response (status 422 unprocessable entity: field error messages):
```json
'{
  "user" : ["can't be blank"]
}'
```

## Code Locations

### Code relating to the data model/persistence can be found in:

- **app/models/feedback.rb**
    representing a piece of feedback
- **app/models/user.rb**
    representing a user
- **db/migrate/.**
    three migrations, 1st to create feedback, 2nd to create users, 3rd to add feedback to user

### Code relating to API access:

- **app/controllers/api/v1/static_pages_controller.rb**
    contains `GET /api/v1` endpoint with basic API data
- **app/controllers/api/v1/feedback_controller.rb**
    contains `POST /api/v1/feedback` endpoint to create new feedback
- **config/routes.rb**

### Tests (using minitest and factory_girl)

- Routing Test (do the routes resolve correctly?)
  - `test/integration/api_routing_test.rb`
- Model Tests (do Feedback and User act correctly?)
  - `test/model/feedback_test.rb`
  - `test/model/user_test.rb`
- Functional Tests (do the endpoints all respond correctly?)
  - `test/controller/api/v1/static_pages_controller_test.rb`
  - `test/controller/api/v1/feedback_controller_test.rb`
