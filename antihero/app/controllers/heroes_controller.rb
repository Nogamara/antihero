class HeroesController < ApplicationController
    helper_method :show_item
    helper_method :show_current

    def index
        @heroes = Hero.all
    end

    def show
        @opts_type = get_opts_item_type()
        @opts_status = get_opts_item_status()
        @hero = Hero.find(params[:id])
    end

    def new
        @hero = Hero.new
    end

    def edit
        @hero = Hero.find(params[:id])
    end

    def create
        @hero = Hero.new(hero_params)

        if @hero.save
            redirect_to @hero
        else
            render 'new'
        end
    end

    def update
        @hero = Hero.find(params[:id])

        if @hero.update(hero_params)
            redirect_to @hero
        else
            render 'edit'
        end
    end

    private
        def hero_params
            params.require(:hero).permit(:name, :spec_name, :spec_url)
        end

        def get_opts_item_type
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

        def get_opts_item_status
            return [
                ['Missing', 'missing'],
                ['Equipped', 'equipped'],
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
            get_opts_item_type().each do |x|
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
