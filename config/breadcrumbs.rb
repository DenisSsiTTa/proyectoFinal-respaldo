crumb :root do
  link "Inicio", root_path
end

crumb :groups do
  link "Cursos", groups_path
end

crumb :group do |group|
  link group.nombre, group_path(group)
  parent :groups
end

crumb :registrations do
  link "Alumnos", registrations_path
end

crumb :registrations do
   #"action"=>"lista_alumnos", "id"=>"4"
  if keyword = params[:id].presence && params[:action] == "lista_alumnos"
    grupo = Group.find_by_id(keyword)
    link grupo.nombre, groups_path(keyword)
    parent :groups
  else
    link "Alumnos", registrations_path
  end
end

crumb :registration do |registration|  
  link registration.alumno_name, registration_path(registration)
  parent :registrations
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).