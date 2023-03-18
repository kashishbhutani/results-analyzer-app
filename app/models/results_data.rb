class ResultsData < ApplicationRecord
  validates_presence_of :subject, :marks, :timestamp
end
