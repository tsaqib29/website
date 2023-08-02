class BookController < ApplicationController
    before_action :user_signed_in?
    helper_method :current_user
 
    # -------------------------Index------------------------------
    def index
      if params[:search].blank?
        @book = Book.paginate(:page => params[:page], per_page: 5)
      else
        @parameter = params[:search].downcase
        @book = Book.where("lower(title) LIKE ?", "%#{@parameter}%").paginate(:page => params[:page], per_page: 5)
      end
    end

    # -------------------------Show------------------------------
    def show
      @book = Book.find_by(id: params[:id])
    end

    # -------------------------Detail------------------------------
    def detail
      @book = Book.find_by(id: params[:id])
    end

# -------------------------Search------------------------------
    def search
      
    end

    # -------------------------New------------------------------
    def new
      @book = Book.new
    end
    
    def create
      @book = Book.new(title: params[:title], author: params[:author], isbn: params[:isbn], description: params[:description], category_id: params[:category])      
        if @book.save
          flash[:pesan] = "Data Berhasil Disimpan !"
          redirect_to("/book/index")
        else
          render action: 'new'
        end
    end  
      
# -------------------------Edit------------------------------   
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

        if @book.save
          flash[:pesan] = "Data Berhasil Diupdate !"  
          redirect_to("/book/index")
        else
          render action: 'edit'
        end
      end
    
# -------------------------Destroy------------------------------
      def destroy
        @book = Book.find_by(id: params[:id])
        @book.destroy
        flash[:pesan] = "Data Berhasil Dihapus !"
        redirect_to("/book/index")
      end
end