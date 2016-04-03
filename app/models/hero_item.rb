class HeroItem < ActiveRecord::Base
    include ApplicationHelper

    belongs_to :hero
    before_save :sanitize
    before_save :clean_link
    before_save :set_updated
    before_save :save_base_item

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

  def save_base_item
    add_missing_base_item(self.name, self.item_type, self.ib_id)
    add_missing_base_item(self.current, self.item_type, self.current_ib_id)
  end

  def add_missing_base_item(name, type, ib_id)
    return if name.nil? || name.length < 1
    bx = BaseItem.find_by name: name
    if bx.nil?
      bi = BaseItem.new
      bi.name = name
      bi.item_type = type
      unless ib_id.nil?
        a, b, c, *d = ib_id.split "/"
        unless d.nil?
          bi.ib_extra = d.join "/"
        end
        bi.ib_id = c
      end
      bi.save
    end
  end
end
