class AuthController < ApplicationController
    def form_register
        @user = User.new
    end

    def register
        @user = User.new(user_params)
        if @user.save

            redirect_to form_register_path, notice: "Berhasil membuat akun!"
        else
            render :form_register
        end
    end

    def form_login

    end

    def login
        email = params[:email]
        password = params[:password]
        
        user = User.find_by(email: email)
        if user
            if user.authenticate(password)

                # membuat session dengan key = :user_id
                session[:user_id] = user.id
                redirect_to home_index_path, notice: "Selamat datang #{user.name}"
            else
                redirect_to form_login_path, alert: "Password tidak sesuai"
            end
        else
            redirect_to form_login_path, alert: "email tidak ditemukan"
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to form_login_path, notice: "Anda telah logout"
    end

    private
    def user_params
        params.require(:user).permit(:name, :phone, :email, :password)
    end
end
