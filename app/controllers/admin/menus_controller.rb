module Admin
  class Admin::MenusController < ApplicationController

    before_action :find_menu, only: [ :show, :edit, :update, :destroy ]

    def index
      @menus = Menu.all.order("created_at DESC")
    end

    def new
      @menu = Menu.new
      10.times { @menu.menu_items.build }
    end

    def create
      @menu = Menu.create(menu_params)

      if @menu.save
        flash[:notice] = "Menu created successfully"
        redirect_to admin_menus_path
      else
        flash[:notice] = "Could not create menu"
        render "new"
      end
    end

    def show
    end

    def edit
      10.times { @menu.menu_items.build }
    end

    def update

      if @menu.update(menu_params)
        flash[:notice] = "Menu updated successfully"
        redirect_to admin_menu_path(@menu)
      else
        flash[:notice] = "Could not create menu"
        render "new"
      end

    end

    def destroy
      @menu.delete
      flash[:notice] = "Deleted successfully"
      redirect_to admin_menus_path
    end

    private
      def menu_params
        params.require(:menu).permit(:name, :menu_items_attributes => [:title, :url, :id])
      end

      def find_menu
        @menu = Menu.find(params[:id])
      end
  end
end