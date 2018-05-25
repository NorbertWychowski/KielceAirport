class CustomersController < ApplicationController
  def new
  end

  def create
    if Person.find_by_email params[:person][:email]
      flash[:danger] = "Do podanego adresu email przypisane jest już konto"
      redirect_to new_customer_path
    elsif params[:person][:password_digest] != params[:person][:password_digest_confirmation]
      flash[:danger] = "Hasła muszą być takie same!"
      redirect_to new_customer_path
    else
      person = Person.new(person_params)
      if person.save
        customer = Customer.new(card_number: params[:customer][:card_number],
                                year: params[:customer][:year],
                                month: params[:customer][:month],
                                cvv: params[:customer][:cvv],
                                confirm_token: SecureRandom.urlsafe_base64.to_s,
                                person_id: person.id)
        if customer.save
          RegistrationMailer.registration_confirmation(person, request, params[:locale]).deliver
          redirect_to registration_confirm_path(person.email)
        end
      end
    end
  end

  def send_activation_email
    person = Person.find(params[:person])
    if person.customer.email_confirmed
      redirect_to root_path
    else
      RegistrationMailer.registration_confirmation(person, request, params[:locale]).deliver
      redirect_to registration_confirm_path(person.email)
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

  def show
    @tab = params[:tab]
    if loggen_in? and !current_user.customer.nil?
      @customer = Person.joins(:customer).select('*, customers.id as customer_id').first
      @tickets = Ticket.joins(:flight, flight: [:airport, :flight_status])
                     .select('tickets.id, flights.flight_identifier as flight_identifier, flights.dep_date as dep_date,' +
                                 ' airports.name as airport, tickets.price as price, flight_statuses.name as status')
                     .where(customer: @customer.customer_id)
    else
      redirect_to root_path
    end
  end

  def update
    customer = Customer.find(params[:id])
    case params[:action]
      when 'update'
        customer.update_data(params)
        redirect_to customer_path(params[:id])
      when 'change_password'
        if !params[:person][:old_password].nil? and customer.person.try(:authenticate, params[:person][:old_password]) and
            params[:person][:password] == params[:person][:password_confirmation]
          customer.update_data(params)
          redirect_to customer_path(params[:id])
        else
          flash[:danger] = "Podano nieprawidłowe hasło lub hasła się różnią. Spróbuj jeszcze raz"
          redirect_to customer_path(params[:id], tab: 'sectionPassword')
        end
      else
        redirect_to customer_path(params[:id])
    end
  end

  def person_params
    params.require(:person).permit(:email, :first_name, :last_name, :password, :password_confirmation, :country, :city, :street)
        .merge(without_password: false)
  end
end

