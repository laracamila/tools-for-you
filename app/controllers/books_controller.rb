class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
    @tool = Tool.find(params[:tool_id])
    @book.user_id = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @tool = Tool.find(params[:tool_id])
    @book.tool = @tool
    authorize @book
    if @book.save
      redirect_to tool_path(@tool), notice: ". Your reservation was sent to the owner, you will be contacted soon."
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
