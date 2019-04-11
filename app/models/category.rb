class Category < ActiveRecord::Base
    has_many :report_categories
    has_many :reports, through: :report_categories
end
