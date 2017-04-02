module Admin
  class PagesController < ApplicationController

    before_action :find_page, only: [ :show, :edit, :update, :destroy ]

    def home
    end

    def index
      @pages = Page.all.order("created_at DESC")
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.create(page_params)

      if @page.save
        flash[:notice] = "Page created successfully"
        redirect_to pages_path
      else
        flash[:notice] = "Could not create page"
        render "new"
      end
    end

    def show
    end

    def edit
    end

    def update

      if @page.update(page_params)
        flash[:notice] = "Page updated successfully"
        redirect_to @page
      else
        flash[:notice] = "Could not create page"
        render "new"
      end

    end

    def destroy
      @page.delete
      flash[:notice] = "Deleted successfully"
      redirect_to pages_path
    end

    private
      def page_params
        params.require(:page).permit(:title, :body, :slug)
      end

      def find_page
        @page = Page.find(params[:id])
      end

  end
end