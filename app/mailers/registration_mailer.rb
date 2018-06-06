class RegistrationMailer < ApplicationMailer
      default from: 'contacto@cursosonline.cl'

  def confirm_registration_email(registration)
    @registration = Registration.find(registration.id)
    
    @url  = "http://cursosonline.herokuapp.com/registrations/#{@registration.id}/"
    mail(to: @registration.mather_email, subject: 'Cursos Online. Inscripción 2018')
  end
end