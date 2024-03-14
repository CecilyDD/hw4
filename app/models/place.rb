# app/models/place.rb
class Place < ApplicationRecord
  has_many :entries
end

# app/models/entry.rb
class Entry < ApplicationRecord
  belongs_to :place
end
