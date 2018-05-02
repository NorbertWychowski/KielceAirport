class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:provider] == 'google_oauth2'
      user = Person.from_omniauth(request.env["omniauth.auth"])
      log_in(user)
      redirect_to root_path
    else
      user = Person.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password_digest])
        customer = Customer.find_by(person_id: user.id)
        if customer && !customer.email_confirmed
          flash.now[:danger] = "Konto nie zostało aktywowane"
          render :action => 'new'
        else
          log_in(user)
          redirect_to root_path
        end
      else
        flash.now[:danger] = "Podano nieprawidłowe hasło lub adres email"
        render :action => 'new'
      end
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
