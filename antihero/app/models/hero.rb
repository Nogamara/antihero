class Hero < ActiveRecord::Base
    has_many :items
    validates :name, presence: true,
                     length: { minimum: 1 }
end
