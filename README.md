# Uber Price Tracker

## About
Ordering an Uber when you're ready to go home only to find out that the route
between your favorite bar and home is surging right now. We've all been there.
Wouldn't it be nice to know ahead of time what the trend in pricing is for your
commonly traveled routes?

Well now you can! Just sign up and enter in your top 3 traveled destinations.
This app will track the pricing estimates for all the routes between your
destinations and that will give you a better picture of when prices tend to go
up. And if you know that prices tend to go back down in another half hour, then
you know that you can walk right back in the bar and order another drink with
the money you saved!

## Setup

### Rails app
Standard setup

```
rake db:create db:migrate
bundle
rails s
```

### Uber API
Create a `.env` file and enter in your Uber API credentials. Use the
`.env.example` file for reference


