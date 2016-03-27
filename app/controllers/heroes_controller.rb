class HeroesController < ApplicationController
    include ApplicationHelper

    def index
        @heroes = Hero.order(:name).all
    end

    def show
        @hero = Hero.find(params[:id])
        @item = @hero.items.build
        @items_missing = @hero.items.where(status: 'missing')
        @items_equipped = @hero.items.where(status: 'equipped')
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
            params.require(:hero).permit(:name, :level, :spec_name, :spec_url,
                                         :hero_class_id)
        end
end
