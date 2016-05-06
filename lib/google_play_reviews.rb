require "google_play_reviews/version"
require "google_play_reviews/entry"
require "google_play_reviews/fetcher"

module GooglePlayReviews
  SortOrder = {
    newest: 0,
    rating: 1,
    helpfulness: 4
  }

  class << self
    def fetch(app_id, options = {})
      return unless app_id
      options[:host_language] ||= "en"
      options[:sort_order] ||= SortOrder[:newest]
      options[:page] ||= 0
      Fetcher.new.fetch_entries(app_id, options)
    end

    def invalid_sort_order?(key)
      SortOrder.keys.include?(key)
    end
  end
end
