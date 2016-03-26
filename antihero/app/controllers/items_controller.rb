class ItemsController < ApplicationController
    include ApplicationHelper

    def create
        @hero = Hero.find(params[:hero_id])
        @item = @hero.items.create(item_params)
        redirect_to hero_path(@hero)
    end

    def show
        @item = Item.find(params[:id])
        @hero = @item.hero
    end

    def edit
        @hero = Hero.find(params[:hero_id])
        @item = Item.find(params[:id])
    end

    def update
        @hero = Hero.find(params[:hero_id])
        @item = Item.find(params[:id])

        if @item.update(item_params)
            redirect_to @hero
        else
            render 'edit'
        end
    end

    private
        def item_params
            params.require(:item).permit(:name, :item_type, :status, :current, :note, :ib_id, :current_ib_id)
        end
end
