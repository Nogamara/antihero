module ApplicationHelper
    def item_statuses
        return [
            ['Missing', 'missing'],
            ['Equipped', 'equipped'],
        ]
    end

    def item_types
        return [
            ['Unique', 'unique'],
            ['Uru-Forged', 'uru-forged'],
            ['Ring', 'ring'],
            ['Legendary', 'legendary'],
            ['Artifact', 'artifact'],
            ['Insignia', 'insignia'],
            ['Medallion', 'medallion'],
            ['Misc', 'misc']
        ]
    end

    def show_item(item)
        show_item_both(item, :item)
    end

    def show_current(item)
        show_item_both(item, :current)
    end

    def show_item_both(item, mod)
        s = ""
        n = nil
        base_url = "http://marvelheroes.info"
        item_types().each do |x|
            if x[1] == item.item_type
                n = x[0]
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

        if ib_id
            if n
                s = '<a href="'+base_url+ib_id+'" title="'+n+'" class="item-type-'+n+'">'+name+'</a>'
            else
                s = '<a href="'+base_url+ib_id+'">'+name+'</a>'
            end
        else
            if n
                s = '<span title="'+n+'" class="item-type-'+n+'">'+name+'</span>'
            else
                s = name
            end
        end
        return s.html_safe
    end
end
