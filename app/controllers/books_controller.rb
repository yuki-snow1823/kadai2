class BooksController < ApplicationController

  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id]) 
    # render layout: false 
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)  
    else
      @books = Book.all
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id]) 
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
      else
        render "edit"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
