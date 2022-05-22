require('pg')
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('./db_access.rb')
also_reload('lib/**/*.rb')

get('/') do
  redirect('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  # @projects = Project.all
  redirect to('/projects')
  # erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  # erb(:edit_project)
  erb(:project)
end

get('/projects/:id/edit') do
  @projects = Project.find(params[:id].to_i)
  erb(:edit_project)
end

# patch('/projects/:id/edit') do
patch('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  # @project.update({:title => params[:title]})
  @project.update(params[:title])
  # @projects = Project.all
  # erb(:projects)
  redirect to('/projects')
end

# delete('/projects/:id/edit') do
delete('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  # @projects = Project.all
  # erb(:projects)
  redirect to('/projects')
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save
  erb(:project)
end

get('/projects/:id/volunteers/:volunteer_id') do
  # @volunteer = Volunteer.find(params[:project_id].to_i)
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  # erb(:project)
  erb(:volunteer)
end

patch('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i)
  # volunteer = Volunteer.find(params[:project_id].to_i)
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.update(params[:name], @project.id)
  erb(:project)
end

delete('/projects/:id/volunteers/:volunteer_id') do
  # volunteer = Volunteer.find(params[:project_id].to_i)
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.delete
  @project = Project.find(params[:id].to_i)
  erb(:project)
end