class Report < ActiveRecord::Base
    has_many :report_categories
    has_many :categories, through: :report_categories
    has_many :notes
end
