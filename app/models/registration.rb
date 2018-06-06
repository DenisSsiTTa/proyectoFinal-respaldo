class Registration < ActiveRecord::Base
  belongs_to :group

#Datos obligatorios:
  validates :alumno_name, :alumno_age, :alumno_birtday, :alumno_gender, :alumno_dni, :alumno_address, :alumno_telephone, :alumno_email, :alumno_school_name, :alumno_grade, :who_register, :i_attest , presence: { message: "es un dato obligatorio."}

#Datos numericos,
  validates :alumno_age, :alumno_grade, :father_age, :mother_age, numericality: { only_integer: true, greater_than: 2, less_than: 110, message: "debe ser un número entre 2 y 110." }
  validates :alumno_dni, numericality: { only_integer: true, greater_than: 30_000_000, less_than: 100_000_000, message: "debe ser solo números entre 30000000 y 100000000. Sin puntos, ni rayas ni espacios." }
  validates :alumno_telephone, :alumno_school_phone, :father_work_phone , :mother_work_phone, numericality: { only_integer: true, message: "Ingrese solo digitos en el número de teléfono, sin puntos, rayas o espacios." }

#formato email valido
  validates :alumno_email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]{2,}+\.[a-z]{2,3}\Z/i , message: "(dirección de correo electrónico) es inválido."}
  #\A inicio con cadena.
  # [\w+\-.] caracter de palabra, un guio o un punto.
  # @ un arroba
  # [a-z\d\-.] almenos una letra, un guion
  # {2,} minimo 2 caracteres.
  # \. que haya al menos 1 punto "."
  # [a-z]{2,3} que haya entre 2 y 3 letras seguidas: ar, com, etc.
  # /i pueden ser letras mayusculas o minusculas.

#Nombres sin Numeros
  validates :alumno_name, format: { with: /\A(\D+)\z/xi, message: "campo inválido, ingrese solo letras."}

# DNI Unico
  validates :alumno_dni, uniqueness: { case_sensitive: false, message: "ese CI ya está siendo utilizado." }

# Cadena con Letras: debe tener letras, no puede ser solo numeros.
  validates :alumno_address, format: { with: /([a-zA-Z]+)([\d]*)/i , message: "(dirección) es invalido, usted ingresó solo digitos sin letras."}

end
