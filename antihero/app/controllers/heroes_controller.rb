class HeroesController < ApplicationController
    def index
        @heroes = Hero.all
    end

    def show
        @hero = Hero.find(params[:id])
    end

    def new
    end

    def create
        #render plain: params[:hero].inspect
        @hero = Hero.new(hero_params)

        @hero.save
        redirect_to @hero
    end

    private
        def hero_params
            params.require(:hero).permit(:name, :spec_name, :spec_url)
        end
end
