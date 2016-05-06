# GooglePlayReviews

Fetch App reviews from Google Play.

[![Gem Version](https://badge.fury.io/rb/google_play_reviews.svg)](https://badge.fury.io/rb/google_play_reviews)

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
        -l, --host-language [VALUE]      Host language: use 'en' as default
        -s, --sort-order [VALUE]         Sort order: 'newest'(default), 'rating' or 'helpfulness'
        -p, --page [VALUE]               Page number (start from 0)
        -v, --version                    Display the current version

For example:

    $ google_play_reviews -l ja -s helpfulness -p 2 com.google.android.googlequicksearchbox
    ------------------------------
    review_id: gp:AOqpTOH34XsWVlMNiEIo7jarmgFNXbcyMz46Q5zgPaPvhrynruzQ-l98_3lOp10xMSJdkQxgK59F427eGnjCNA
    author_name: ウルフハウンド
    author_url: https://play.google.com/store/people/details?id=103315480914346702702
    author_image_url: https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=w48-c-h48
    review_body: おかしい ブクマしたラベルに名前がつかない。編集でなんどつけても消える
    rating: 2
    review_date_string: 2015年3月4日
    review_url: https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox&reviewId=Z3A6QU9xcFRPSDM0WHNXVmxNTmlFSW83amFybWdGTlhiY3lNejQ2UTV6Z1BhUHZocnlucnV6US1sOThfM2xPcDEweE1TSmRrUXhnSzU5RjQyN2VHbmpDTkE
    ------------------------------
    review_id: gp:AOqpTOFNTB4yhD3mw8mXSu6KBhFofPHrYhI2yoEWfuQTalPKG-4JO_5ZSnYW2nE3jJS7t0RtU1pzrsgwpnzVsQ
    author_name: 西上香奈
    author_url: https://play.google.com/store/people/details?id=116289340209306231792
    author_image_url: https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=w48-c-h48
    review_body: 何これ⁉ ググれないじゃん！早く直してよ！
    rating: 1
    review_date_string: 2015年3月6日
    review_url: https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox&reviewId=Z3A6QU9xcFRPRk5UQjR5aEQzbXc4bVhTdTZLQmhGb2ZQSHJZaEkyeW9FV2Z1UVRhbFBLRy00Sk9fNVpTbllXMm5FM2pKUzd0MFJ0VTFwenJzZ3dwbnpWc1E
    ------------------------------
    ...

Or use it in ruby projects:

```ruby
GooglePlayReviews.fetch(app_id, options)
# Options:
#   :sort_order (:newest, :rating, :helpfulness)
#   :page (start from 0)
```

This will return the review entries. See [lib/google_play_reviews/entry.rb](lib/google_play_reviews/entry.rb)
