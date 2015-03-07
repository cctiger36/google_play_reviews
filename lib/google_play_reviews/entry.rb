module GooglePlayReviews
  class Entry
    attr_accessor :review_id, :author_name, :author_url, :author_image_url,
      :review_body, :rating, :review_date_string, :review_url

    def to_s
      instance_variables.map do |v|
        "#{v.to_s.sub(/^@/, '')}: #{instance_variable_get(v)}"
      end.join("\n")
    end
  end
end
