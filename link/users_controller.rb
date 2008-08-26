class UsersController < ApplicationController
  layout 'main'
  before_filter :not_logged_in_required, :only => [:new, :create] 
  before_filter :login_required, :only => [:show, :edit, :update]
  before_filter :check_administrator_role, :only => [:index, :destroy, :enable]
  
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @rent_ranges = RentRange.find :all
    @apt_types = AptType.find :all
    @nhoods = Nhood.find :all

    respond_to do |format|
      format.html { render :layout => "main" }# new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    cookies.delete :auth_token
 
      begin
        
        @user = User.create!(params[:user])
        flash[:notice] = "Thanks for signing up! Please check your email to activate your account before logging in."
        # skip other registration steps
        respond_to do |format|
          format.html { redirect_to listings_url  }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        end
          
      rescue ActiveRecord::RecordInvalid => error
        
        errors = error.record.errors.to_a.collect { |key,value| key = key.capitalize + " " + value } # We have to do this because without it, there is no space and the key field is all lowercase.
        flash[:error] = errors.to_sentence
        redirect_to '/users/new'
        #format.html { render :action => "new", :layout => "main" }
        #format.xml  { render :xml => error.record.errors, :status => :unprocessable_entity }
      end

    
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(current_user)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :layout => "main" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
