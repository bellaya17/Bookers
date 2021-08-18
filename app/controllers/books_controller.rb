class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end
  
  
  
  
  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render :edit
    end
    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
    
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end


