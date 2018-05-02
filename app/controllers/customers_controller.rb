class CustomersController < ApplicationController
  def new
  end

  def create
    if Person.find_by_email params[:customer][:email]
      flash[:danger] = "Do podanego adresu email przypisane jest już konto"
      redirect_to register_path
    else
      person = Person.new(email: params[:customer][:email],
                          first_name: params[:customer][:first_name],
                          last_name: params[:customer][:last_name],
                          password_digest: BCrypt::Password.create(params[:customer][:password_digest]),
                          country: params[:customer][:country],
                          city: params[:customer][:city],
                          street: params[:customer][:street])
      if person.save
        customer = Customer.new(card_number: params[:customer][:card_number],
                                year: params[:customer][:year],
                                month: params[:customer][:month],
                                cvv: params[:customer][:cvv],
                                confirm_token: SecureRandom.urlsafe_base64.to_s,
                                person_id: person.id)
        customer.save
        RegistrationMailer.registration_confirmation(ENV['host'] + ":" + request.port.to_s, person).deliver
        flash[:success] = "Witaj na stronie Aplikacji Kielce Airport! Na podany przez Ciebie adres email został wysłany link aktywujący twoje konto"
        redirect_to root_path
      end
    end
  end

  def confirm_email
    user = Customer.find_by_confirm_token(params[:token])

    if user
      user.email_activate
      flash[:success] = "Witaj na stronie Aplikacji Kielce Airport! Twoje konto zostało aktywowane i możesz teraz z niego korzystać"
      log_in(user.person)
    else
      flash[:danger] = "Użytkownik nie istnieje"
    end
    redirect_to root_path
  end
end

