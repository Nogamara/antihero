# antihero application helper
module ApplicationHelper
    def item_statuses
        ITEM_STATUSES
    end

    def item_types
        ITEM_TYPES
    end

  def as_opt
    a = []
    HeroClass.all.each do |hc|
      a.push [hc.name, hc.id]
    end
    a
  end

    def ib_base_url
        IB_BASE_URL
    end

    def shorten(s, len = 0)
        len = 30 unless len > 0
        return s[0..len] + '...' if s.length > len
        s
    end

    def show_item(item)
        show_item_both(item, :item)
    end

    def show_current(item)
        show_item_both(item, :current)
    end

    def show_item_both(item, mod)
        s = ''
        n = nil
        item_types.each do |x|
            if x[1] == item.item_type
                n = x[1]
                break
            end
        end

        if mod == :item
            ib_id = item.ib_id
            name = item.name
        else
            ib_id = item.current_ib_id
            name = item.current
        end

        if ib_id && ib_id != ''
            if n
                s = '<span title="' + n + '" class="item-type item-type-' + n + '">'
                s = s + '<a href="' + ib_base_url + ib_id + '">' + name + '</a></span>'
            else
                s = '<a href="' + ib_base_url + ib_id + '">' + name + '</a>'
            end
        else
            if n && name.length > 0
                s = '<span title="' + n + '" class="item-type item-type-' + n + '">' + name + '</span>'
            else
                s = name
            end
        end
        s.html_safe
    end

    def ago(t)
        now = Time.now.utc.to_i
        diff = now - t.to_i
        if diff > 2_592_000
            return sprintf('%dm ago', (diff / 2_592_000))
        elsif diff > 604_800
            return sprintf('%dw ago', (diff / 604_800))
        elsif diff > 86400
            return sprintf('%dd ago', (diff / 86400))
        elsif diff > 3600
            return sprintf('%dh ago', (diff / 3600))
        elsif diff > 60
            return sprintf('%dm ago', (diff / 60))
        else
            return sprintf('%ds ago', diff)
        end
    end
end
