class Hero < ActiveRecord::Base
    has_many :hero_items
    validates :name, presence: true,
                     length: { minimum: 1 }
    before_save :set_default_user
    before_save :set_updated
    before_save :sanitize_color

    def set_default_user
        if self.user_id.to_i < 1
            self.user_id = 0
        end
    end

    def set_updated
        self.updated_at = Time.now
    end

  def sanitize_color
    unless self.color.nil?
      self.color = self.color.strip
      self.color = self.color.downcase.gsub /[^0-9a-f]/, ""
      self.color = self.color[0..5]
    end
  end
end
