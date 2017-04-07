module Admin
  class Admin::TypesController < ApplicationController

    before_action :find_type, only: [ :show, :edit, :update, :destroy ]

    def index
      @types = Type.all.order("created_at DESC")
    end

    def new
      @type = Type.new
      3.times { @type.field_definitions.build }
    end

    def create
      @type = Type.create(type_params)

      if @type.save
        flash[:notice] = "Type created successfully"
        redirect_to admin_types_path
      else
        flash[:notice] = "Could not create type"
        render "new"
      end
    end

    def show
    end

    def edit

    end

    def update

      if @type.update(type_params)
        flash[:notice] = "Type updated successfully"
        redirect_to admin_types_path
      else
        flash[:notice] = "Could not create type"
        render "new"
      end

    end

    def destroy
      @type.delete
      flash[:notice] = "Deleted successfully"
      redirect_to admin_types_path
    end

    private
      def type_params
        params.require(:type).permit(:name, :field_definitions_attributes => [ :key, :id ])
      end

      def find_type
        @type = Type.find(params[:id])
      end
  end
end