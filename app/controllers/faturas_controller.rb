class FaturasController < ApplicationController
  def index
    render json: Fatura.all
  end

  def show
    @fatura = Fatura.find(params[:id])
    render json: @fatura, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {
        error: e.to_s
    }, status: :not_found
  end
end
