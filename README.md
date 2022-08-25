# Good Night APP

## Intro:
Implement a “good night” application to let users track when do they go to bed and when do they wake up.

## Features:
Require Restful APIS to achieve the following:

1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records over the past week for their friends, ordered by the length of their sleep.

```
GET /api/v1/users/:id/friends
GET /api/v1/users/:id/friends/:friend_id
GET /api/v1/users
GET /api/v1/users/:id
POST /api/v1/sleep_records
PATCH /api/v1/sleep_records
POST /api/v1/friendships
DELETE api/v1/friendships
```

![](https://drive.google.com/u/2/uc?id=1si2RojlBFRwopMhzcISZcQgUCL1Iaybe&export=download)
DB tables

![](https://drive.google.com/u/2/uc?id=1z63TlB1743tidIDA445DosWLUSapWrAU&export=download)
大圖詳見： https://drive.google.com/file/d/1z63TlB1743tidIDA445DosWLUSapWrAU/view?usp=sharing

##  Getting Started

1. Clone the project
2. Run `bundle install`
3. Run `bin/rails db:create`
4. Run `bin/rails db:migrate`
5. Run `rails db:seed` to create 10 users
6. Run `rails s` to start server
7. You can see all users' id and name at http://localhost:3000/api/v1/users
8. You can see specific user's sleep record at http://localhost:3000/api/v1/users/:id
9. If you want to colck in (satrt sleeping), you can use Postman to send a POST request to http://localhost:3000/api/v1/sleep_records  request body: `user_id` `1`

![](https://drive.google.com/u/2/uc?id=10RDHAhy9i7Ps9UmqUdnjjV8dj-Aoe5bV&export=download)
9. If you wake up and want to stop timing, simply send a PATCH request to  http://localhost:3000/api/v1/sleep_records  request body: `user_id` `1`

![](https://drive.google.com/u/2/uc?id=1zQZ5swM2SULVJ9VnjfQTd0VC5K0GMkNm&export=download)

10. Time to make friend with other user. POST http://localhost:3000/api/v1/friendships request body: `user_id` `1` `friend_id` `3`

![](https://drive.google.com/u/2/uc?id=1qqYIc0sfam8VDQwy5FFkKwAvyTrp9gYP&export=download)

11. Check friend data. GET /api/v1/users/1/friends/3
12. If you want to unfriend another user, send a DELETE request to http://localhost:3000/api/v1/friendships request body: `user_id` `1` `friend_id` `3`

![](https://drive.google.com/u/2/uc?id=1o8kpLlFGx1at87LQ1FSnyqM0DVuHx666&export=download)
