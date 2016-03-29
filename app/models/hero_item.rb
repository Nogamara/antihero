class HeroItem < ActiveRecord::Base
    include ApplicationHelper

    belongs_to :hero
    before_save :sanitize
    before_save :clean_link
    before_save :set_updated

    def sanitize
        it = ITEM_TYPES_KEYS
        self.item_type = it[-1] unless it.include?(self.item_type)
        is = ITEM_STATUSES_KEYS
        self.status = is[-1] unless is.include?(self.status)
    end

    def clean_link
        if self.ib_id and self.ib_id.start_with?(IB_BASE_URL)
            self.ib_id.sub!(IB_BASE_URL, '')
        end
        if self.current_ib_id and self.current_ib_id.start_with?(IB_BASE_URL)
            self.current_ib_id.sub!(IB_BASE_URL, '')
        end
    end

    def set_updated
        now = Time.now
        self.updated_at = now
        h = Hero.find(self.hero_id)
        h.updated_at = now
        h.save
    end
end
