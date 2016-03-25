class ItemsController < ApplicationController
    def create
        @hero = Hero.find(params[:hero_id])
        @item = @hero.items.create(item_params)
        redirect_to hero_path(@hero)
    end

    private
        def item_params
            params.require(:item).permit(:name, :item_type, :current, :note)
        end
end
