class Item < ActiveRecord::Base
    belongs_to :hero
    before_save :clean_link

    def clean_link
        if self.ib_id and self.ib_id.start_with?(IB_BASE_URL)
            self.ib_id.sub!(IB_BASE_URL, "")
        end
        if self.current_ib_id and self.current_ib_id.start_with?(IB_BASE_URL)
            self.current_ib_id.sub!(IB_BASE_URL, "")
        end
    end
end
