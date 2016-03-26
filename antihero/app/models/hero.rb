class Hero < ActiveRecord::Base
    has_many :items
    validates :name, presence: true,
                     length: { minimum: 1 }
    before_save :default_user

    def default_user
        if self.user_id.to_i < 1
            self.user_id = 0
        end
    end
end
