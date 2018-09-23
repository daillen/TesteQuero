class InstituicaosController < ApplicationController
  def index
    render json: Instituicao.all
  end

  def show
    @instituicao = Instituicao.find(params[:id])
    render json: @instituicao, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {
        error: e.to_s
    }, status: :not_found
  end

  def create
    new_instituicao = JSON.parse(request.body.read)
    @instituicao = Instituicao.new(nome: new_instituicao["nome"],
                                   cnpj: new_instituicao["cnpj"],
                                   tipo: new_instituicao["tipo"])
    if @instituicao.valid?
      @instituicao.save
      render json: @instituicao, status: :ok
    else
      render json: {
          error: "Given instituicao is not a valid one!"
      }, status: :not_acceptable
    end
  end
end
