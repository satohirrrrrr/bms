class Api::BooksController < ApplicationController

  # GET /books
  def index
    @books = Book.all if params[:q].blank?
    @books = Book.where('name like ?', "%#{params[:q]}%") if params[:q].present?
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      render :show, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render :show, status: :ok
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private 
  # Never trust parameters form the scary internet, only allow the white lit through.
  def book_params
    params.fetch(:book, {}). permit(
      :name
    )
  end
end