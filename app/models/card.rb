class Card < ApplicationRecord
  belongs_to :user, optional: true

  enum year: { "2030": 1, "2029": 2, "2028": 3, "2027": 4, "2026": 5, "2025": 6, "2024": 7, "2023": 8, "2022": 9, "2021": 10, },_prefix: true
  enum month: { "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 11, "12": 12,},_prefix: true
end
