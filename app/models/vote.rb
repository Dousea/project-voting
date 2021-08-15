class Vote < ApplicationRecord
  belongs_to :candidate, class_name: 'User', inverse_of: :votes
  belongs_to :constituent, class_name: 'User', inverse_of: :vote
end
