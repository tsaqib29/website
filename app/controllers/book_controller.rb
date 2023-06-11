class BookController < ApplicationController
    before_action :user_signed_in?
    helper_method :current_user
  
    def index
        @book = Book.all
    end
    
    def show
      @book = Book.find_by(id: params[:id])
    end
    
    def new
      @book = Book.new
    end

    def detail
      @book = Book.find_by(id: params[:id])
    end
    
    def create
      @book = Book.new(title: params[:judul], author: params[:pengarang], isbn: params[:isbn], description: params[:deskripsi], category_id: params[:kategori])      
        if @book.save
          flash[:pesan] = "Data Berhasil Disimpan !"
          redirect_to("/book/index")
        else
          render action: 'input'
        end
      end  
      
    
      def edit
        @book = Book.find_by(id: params[:id])
      end
    
      def update
        @book = Book.find_by(id: params[:id])
        @book.title = params[:judul]
        @book.author = params[:pengarang]
        @book.isbn = params[:isbn]
        @book.description = params[:deskripsi]
        @book.category_id = params[:category_id]
        
        if @book.valid?
          @book.save
          flash[:pesan] = "Data Berhasil Disimpan !"
          redirect_to("/book/index")
        else
          render action: 'input'
        end
        
        
        if @book.save
          flash[:pesan] = "Data Berhasil Diupdate !"
        return
          redirect_to("/book/index")
        else
          flash[:pesan] = "Data Gagal Diupdate !"
          redirect_to("/book/edit/#{@book.id}")
        end
      end
    
      def destroy
        @book = Book.find_by(id: params[:id])
        @book.destroy
        flash[:pesan] = "Data Berhasil Dihapus !"
        redirect_to("/book/index")
      end
end