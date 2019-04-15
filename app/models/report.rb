class Report < ActiveRecord::Base
    extend Geocoder::Model::ActiveRecord
    
    has_many :report_categories
    has_many :categories, through: :report_categories
    has_many :notes
    
    def address
        [city, state].join(', ')
    end

    geocoded_by :address
    after_validation :geocode
    after_save :geocode
end
