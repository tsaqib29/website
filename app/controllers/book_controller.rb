class BookController < ApplicationController
    def index
        @data = Book.all.order(created_at: :desc)
      end
    
      def detail
        @data = Book.find_by(id: params[:id])
      end
    
      def input
        @data = Book.find_by(id: params[:id])
      end
    
      def create
        @data = Book.new(title: params[:judul], author: params[:pengarang], isbn: params[:isbn], description: params[:deskripsi], category_id: params[:kategori])
        
        if @data.save
          flash[:pesan] = "Data Berhasil Disimpan !"
        else
          flash[:pesan] = "Data Tidak Berhasil Disimpan !"
        end
        redirect_to("/book/index")
      end  
    
      def edit
        @data = Book.find_by(id: params[:id])
      end
    
      def update
        @data = Book.find_by(id: params[:id])
        @data.title = params[:judul]
        @data.author = params[:pengarang]
        @data.isbn = params[:isbn]
        @data.description = params[:deskripsi]
        @data.category_id = params[:category_id]
        @data.save
        flash[:pesan] = "Data Berhasil Diupdate !"
        redirect_to("/book/index")
      end
    
      def hapus
        @data = Book.find_by(id: params[:id])
        @data.destroy
        flash[:pesan] = "Data Berhasil Dihapus !"
        redirect_to("/book/index")
      end
end