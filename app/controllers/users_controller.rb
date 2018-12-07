class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_current_user, only: [:edit, :update, :destroy, :mypage, :change_password]
  skip_before_action :require_login, only: [:index, :new, :show, :create, :activate]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user.update_attribute :avatar_key, params[:key]
  end

  def mypage
    @page_title = "マイページ"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @uploader = @user.avatar
    # @uploader.success_action_redirect = user_url(@user)
  end

  def change_password
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'ユーザー登録ありがとうございます！ご登録いただいたメールアドレス宛に認証メールを送りました。中に書いてあるURLをクリックして登録を完了させてください。' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'ユーザー認証が完了しました！ログインしてMWG Moviesをお楽しみください')
    else
      not_authenticated
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_current_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :bio, :avatar, :avatar_cache)
    end
end
