class HeroesController < ApplicationController
    helper_method :show_item

    def index
        @heroes = Hero.all
    end

    def show
        @opts = get_opts()
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

        def get_opts
            return [
                ['Unique', 'unique'],
                ['Uru-Forged', 'uru-forged'],
                ['Ring', 'ring'],
                ['Legendary', 'legendary'],
                ['Artifact', 'artifact'],
                ['Misc', 'misc']
            ]
        end

        def show_item(item)
            s = ""
            n = nil
            get_opts().each do |x|
                if x[1] == item.item_type
                    n = x[0]
                    break
                end
            end
            if n
                s = '<span title="'+n+'" class="item-type-'+n+'">'+item.name+'</span>'
            else
                s = item.name
            end
            return s.html_safe
        end

end
