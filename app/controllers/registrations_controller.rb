
class RegistrationsController < ApplicationController
  include RecaptchaVerify
 
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :set_registration, only: [:show, :edit, :update, :destroy, :change_group, :confirm_registration ]

  before_action :check_recaptcha, :only => [:create] 
 
  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all.order('created_at DESC')
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    render layout: "sin_menu" unless user_signed_in? 
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    render layout: "sin_menu" unless user_signed_in? 
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)
    @registration.group_id = sortear_grupo(@registration.alumno_age, @registration.alumno_gender)
    
    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: "Bienvenido a la familia Cursos Online. Ya estás pre-inscripto. No olvides pasar por el club [dirección] de (9) a (18) dentro de las próximas 72 hs para confirmar la inscripción de #{@registration.alumno_name} y abonar la inscripción." }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        if params[:action] == "update" && params[:registration]["group_id"]
          format.html { redirect_to @registration, notice: "El alumno \"#{@registration.alumno_name}\" ha sido movido exitosamente al \"#{@registration.group.nombre}\"." }
          format.json { render :show, status: :ok, location: @registration }
        else          
          format.html { redirect_to @registration, notice: 'Se actualizarón los datos correctamente.' }
          format.json { render :show, status: :ok, location: @registration }
        end
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'El alumno ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  # GET /registrations/1/change_group
  def change_group
  end

  def confirm_registration
    if params[:admission] == "aprobado"
       @registration.update!(status: 2)
       #Le envio el mail de confirmación.
       # Tell the RegistrationMailer to send a notification email after confirm
       #RegistrationMailer.confirm_registration_email(@registration).deliver_now

       redirect_to :back, notice: "Ha sido CONFIRMADA la inscripción de \"#{@registration.alumno_name}\"."
    end

    if params[:admission] == "rechazado"
       @registration.update!(status: 3)
       redirect_to :back, notice: "Ha sido RECHAZADA la inscripción de \"#{@registration.alumno_name}\"."
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(
        :alumno_name, :alumno_age, :alumno_birtday, :alumno_gender, :alumno_dni, :alumno_address,
        :alumno_telephone, :alumno_email, :alumno_school_name, :alumno_grade, :alumno_medical_insurance,
        :alumno_medical_observation, :i_attest, :group_id, :admission)
    end

   def sortear_grupo(age, gender)
    # Define el gurpo al que debe pertenecer el alumno en base a los grupos creados.
    grupos = view_context.grupos_temporada

    grupo = grupos.each do |grupo|
      if age.between?(grupo.initial_age, grupo.maximun_age) && grupo.sexo == gender
        break grupo.id 
      elsif age.between?(grupo.initial_age, grupo.maximun_age) && grupo.sexo == 3
        break grupo.id 
      end
      grupo = nil
    end
    return grupo
  end

  def check_recaptcha
    unless user_signed_in?
      if Rails.env.production?       
        unless verify_recaptcha(params["g-recaptcha-response"])
          redirect_to :back, alert: "Debes completar el campo CAPTCHA anti-robots de spam." and return
          return false
        end
      end
    end
  end
end