class HeroItemsController < ApplicationController
    include ApplicationHelper

    def create
        @hero = Hero.find(params[:hero_id])
        @hero_item = @hero.hero_items.create(hero_item_params)
        redirect_to hero_path(@hero)
    end

    def show
        @hero_item = HeroItem.find(params[:id])
        @hero = @hero_item.hero
    end

    def edit
        @hero = Hero.find(params[:hero_id])
        @hero_item = HeroItem.find(params[:id])
    end

    def update
        @hero = Hero.find(params[:hero_id])
        @hero_item = HeroItem.find(params[:id])

        if @hero_item.update(hero_item_params)
            redirect_to @hero
        else
            render 'edit'
        end
    end

    private

        def hero_item_params
            params.require(:hero_item).permit(:name, :item_type, :status,
                                              :current, :note, :ib_id,
                                              :current_ib_id, :level,
                                              :current_level)
        end
end
