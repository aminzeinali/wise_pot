module Api
  module V2
    class PlantersController < ApplicationController

      respond_to :json

      def index
      end

      def show
        respond_with Planter.find(params[:id])
      end

      def create
        respond_with Planter.create(params[:planter])
      end

      def update
        respond_with Planter.update(params[:id], params[:planter])
      end

      def destroy
        respond_with Planter.destroy(params[:id])
      end
    end
  end
end