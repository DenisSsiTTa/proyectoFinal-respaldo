module GroupsHelper
  def sexo_grupo_a_texto(sexo)
    case sexo
    when 1
      "Varones"
    when 2
      "Mujeres"
    when 3
      "Mixto"
    end
  end
end
