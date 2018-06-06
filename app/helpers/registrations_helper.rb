module RegistrationsHelper
  def boolean_to_text(boolean)
    if boolean == true
      "Si"
    else
      "No"
    end
  end

  def gender_to_text(gender)
    case gender
      when 1 
        "Varon"
      when 2
        "Mujer"
      else
        ""
    end
  end

  def gender_text_to_number(gender_text)
    case gender_text
    when "Varon" 
      1
    when "Mujer"
      2
    else
      "error"
    end
  end

  def gender_active(gender, posicion)
    if gender == 1 && posicion == 1
        "btn btn-primary fa fa-male active"
      elsif gender == 1 && posicion == 2
        "btn btn-primary fa fa-female"
      elsif gender == 2 && posicion == 2
        "btn btn-primary fa fa-female active"
      else
        "btn btn-primary fa fa-male"
    end
  end
  
  def confirmar_alumno(alumno)
    case alumno.status
      when 1            
          @content = link_to('', confirm_registration_path(alumno.id, :admission => 'aprobado' ), :class => 'btn btn-success btn-xs btn fa fa-check active', :method => :post, data: { confirm: "Esta seguro que desea confirmar y APROBAR el alumno: #{alumno.alumno_name} ?"})
          @content += link_to('', confirm_registration_path(alumno.id, :admission => 'rechazado' ), :class => 'btn btn-danger btn-xs btn fa fa-ban active', :method => :post, data: { confirm: "Esta seguro que desea RECHAZAR la inscripción de: #{alumno.alumno_name} ?"})
      when 2
        content_tag(:p, "Aceptado", class: ["label label-success", "fa fa-check-square-o"])
      when 3
        content_tag(:p, "Rechazado", class: ["label label-danger", "fa fa-ban"])
    end 
  end

  def quien_registra_array
    [['Padre',1], ['Madre',2], ['Tutor',3], ['Familiar',4], ['Otro',5]]
  end

  ### Cursos Temporada.
  def grupos_temporada
    inicio_temporada = Date.new(2018,10,01)
    fin_temporada = Date.new(2018,03,31)
    grupos = Group.where(created_at: inicio_temporada..fin_temporada)
  end

end