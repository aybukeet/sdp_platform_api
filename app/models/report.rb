class Report < ApplicationRecord
  enum :format, { pdf: 0, word: 1, html: 2, excel: 3 }

  belongs_to :analysis

  validates :title, presence: true
  validates :format, presence: true
end