# GooglePlayReviews

Fetch App reviews from Google Play.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_play_reviews'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_play_reviews

## Usage

Console command:

    google_play_reviews [options] APP_ID
        -s, --sort-order [VALUE]         Sort order: 'newest'(default), 'rating' or 'helpfulness'
        -p, --page [VALUE]               Page number (start from 0)
        -v, --version                    Display the current version

Or use it in ruby projects:

```ruby
GooglePlayReviews.fetch(app_id, options)
# Options:
#   :sort_order (:newest, :rating, :helpfulness)
#   :page (start from 0)
```
