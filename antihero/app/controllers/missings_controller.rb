class MissingsController < ApplicationController
    def create
        @hero = Hero.find(params[:hero_id])
        @missing = @hero.missings.create(missing_item_params)
        redirect_to hero_path(@hero)
    end

    private
        def missing_item_params
            params.require(:missing).permit(:name, :item_type, :current, :note)
        end
end
