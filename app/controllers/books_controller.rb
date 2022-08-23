class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    @tool = Tool.find(params[:tool_id])
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to tool_path(@tool)
  end

  def destroy
    @tool = Tool.find(params[:tool_id])
    @book.destroy
    redirect_to tool_path(@tool)
  end

  private

  def book_params
    params.require(:book).permit(:checkin, :checkout, :comment)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
