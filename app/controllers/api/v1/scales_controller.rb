module Api
  module V1
    class ScalesController < BaseController
      before_action :set_scale, only: [:show, :update, :destroy]

      # GET /api/v1/scales
      def index
        @scales = Scale.includes(:user, :scale_items).all
        render_success(@scales)
      end

      # GET /api/v1/scales/:id
      def show
        render_success(@scale.as_json(include: :scale_items))
      end

      # POST /api/v1/scales
      def create
        @scale = Scale.new(scale_params)
        
        if @scale.save
          render_success(@scale, message: 'Scale created successfully', status: :created)
        else
          render_error('Failed to create scale', errors: @scale.errors.full_messages)
        end
      end

      # PATCH/PUT /api/v1/scales/:id
      def update
        if @scale.update(scale_params)
          render_success(@scale, message: 'Scale updated successfully')
        else
          render_error('Failed to update scale', errors: @scale.errors.full_messages)
        end
      end

      # DELETE /api/v1/scales/:id
      def destroy
        @scale.destroy
        render_success(nil, message: 'Scale deleted successfully')
      end

      private

      def set_scale
        @scale = Scale.find(params[:id])
      end

      def scale_params
        params.require(:scale).permit(
          :title,
          :description,
          :version,
          :language,
          :author,
          :publication_year,
          :category,
          :status,
          :user_id,
          metadata: {}
        )
      end
    end
  end
end