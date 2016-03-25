class Hero < ActiveRecord::Base
    has_many :missings
    validates :name, presence: true,
                     length: { minimum: 1 }
end
