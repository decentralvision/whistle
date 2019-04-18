class Report < ActiveRecord::Base
    extend Geocoder::Model::ActiveRecord
    belongs_to :user    
end
