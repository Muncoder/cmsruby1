module Admin
  class Admin::PagesController < ApplicationController

    before_action :find_page, only: [ :show, :edit, :update, :destroy ]

    def home
    end

    def index
      @pages = Page.all.order("created_at DESC")

    end

    def new
      @page = Page.new type: Type.where(name: params[:type]).first

      @page.type.field_definitions.each do |definition|
        @page.fields.build field_definition: definition
       end
    end

    def create
      @page = Page.create(page_params)

      if @page.save
        Rails.application.reload_routes!
        flash[:notice] = "Page created successfully"
        redirect_to admin_pages_path
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
        Rails.application.reload_routes!
        flash[:notice] = "Page updated successfully"
        redirect_to admin_page_path(@page)
      else
        flash[:notice] = "Could not create page"
        render "new"
      end

    end

    def destroy
      @page.delete
      flash[:notice] = "Deleted successfully"
      redirect_to admin_pages_path
    end

    private
      def page_params
        params.require(:page).permit(:type_id, :title, :body, :slug, :category_id, fields_attributes: [ :field_definition_id, :id, :value ])
      end

      def find_page
        @page = Page.find(params[:id])
      end

  end
end