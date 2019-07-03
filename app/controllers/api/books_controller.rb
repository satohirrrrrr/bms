class Api::BooksController < ApplicationController
  protect_from_forgery :except => [:sync]

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

  # GET /books/new
  def new
  end

  # PATCH/PUT /books/sync
  def sync
    @books = Book.all if params[:q].blank?
    @books = Book.where('name like ?', "%#{params[:q]}%") if params[:q].present?
    Book::GbaSyncronizer.execute(@books.where(is_sync_gba: false))
    render 'index'
  end

  private 
  # Never trust parameters form the scary internet, only allow the white lit through.
  def book_params
    params.fetch(:book, {}). permit(
      :name
    )
  end
end