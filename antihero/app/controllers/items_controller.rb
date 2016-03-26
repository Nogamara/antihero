class ItemsController < ApplicationController
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
        @opts_type = get_opts_item_type()
        @opts_status = get_opts_item_status()
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
end
