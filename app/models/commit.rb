class Commit < ApplicationRecord
  attribute :tags, :string, array: true, default: []
end