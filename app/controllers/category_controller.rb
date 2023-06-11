class CategoryController < ApplicationController
    def index

    end

    def list
        @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(name: params[:name])      
        if @category.save
          flash[:pesan] = "Data Berhasil Disimpan !"
          redirect_to("/category/list")
        else
          render action: 'input'
        end
    end

    def edit
      @categories = Category.find_by(id: params[:id])
    end
  
    def update
      @category = Category.find_by(id: params[:id])
      @category.name = params[:name]
      
      if @category.valid?
        @category.save
        flash[:pesan] = "Data Berhasil Disimpan !"
        redirect_to("/category/list")
      else
        render action: 'input'
      end
      
      
      if @category.save
        flash[:pesan] = "Data Berhasil Diupdate !"
      return
        redirect_to("/category/list")
      else
        flash[:pesan] = "Data Gagal Diupdate !"
        redirect_to("/category/list#{@category.id}")
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to("/category/list")
    end

end