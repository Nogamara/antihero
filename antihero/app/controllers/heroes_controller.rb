class HeroesController < ApplicationController
    include ApplicationHelper

    def index
        @heroes = Hero.all
    end

    def show
        @hero = Hero.find(params[:id])
        @item = @hero.items.build
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
            params.require(:hero).permit(:name, :level, :spec_name, :spec_url)
        end
end
