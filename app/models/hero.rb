class Hero < ActiveRecord::Base
    has_many :items
    validates :name, presence: true,
                     length: { minimum: 1 }
    before_save :set_default_user
    before_save :set_updated

    def set_default_user
        if self.user_id.to_i < 1
            self.user_id = 0
        end
    end

    def set_updated
        self.updated_at = Time.now
    end
end
