#sample_RoR_pt2

pt.1 - CODERS

rails g model coder name:string email:string github_username:string

resources :users do
resources :coders
validates :email, presence: true
end

belongs_to :user
has_many :coders

rails g controller coders new show edit index create update destroy
mysql.server start
bundle exec rake db:migrate
bundle exec rake routes

pt.2 - CODERS LOGIC

class CodersController < ApplicationController

  def show
  end

  def edit
  end

  def index
    @coders = Coder.all
  end

  def new
    @coder = Coder.new
  end

  def create
    if user.coders.new(coder_params).save!
      flash[:notice] = 'Coder was successfully created.'
      redirect_to user_coders_path(user)
    else
      flash[:error] = 'Something has gone wrong.'
      render :new
    end
  end

  def update
    if coder.update(coder_params)
      flash[:notice] = 'Coder was successfully updated.'
      redirect_to user_coders_path(user)
    else
      flash[:notice] = 'Something has gone wrong.'
      render :edit
    end
  end

  def destroy
    if coder.destroy
      redirect_to user_coders_path, notice: 'Coder was successfully destroyed.'
    end
  end

  private

  def coder
    @coder = Coder.find(params[:id])
  end

  def user
    @user = User.find(params[:user_id])
  end

  def coder_params
    params.require(:coder).permit(:name, :email, :github_username)
  end
end

before_action :coder, only: [:show, :edit, :destroy]
before_action :user

  def coder
    @coder = Coder.find(params[:id])
  end

  def user
    @user = User.find(params[:user_id])
  end

<div>
  <%= flash[:notice] %>
  <%= flash[:error] %>
</div>

<br>
<%= link_to '+  New Coder', new_user_coder_path(current_user.id) %>
<br>
<%= link_to 'My Coders', user_coders_path(current_user) %>


pt.3 - CRUD FOR CODERS

#coder>new&edit
<%= form_for([@user, @coder]) do |f| %>
  <%= f.text_field :name, value: @coder.name %>
  <%= f.text_field :email, value: @coder.email %>
  <%= f.text_field :github_username, value: @coder.github_username %>
  <%= f.submit "Submit" %>
<% end %>
#coder>index
<table>
 <thead>
   <tr>
     <th>Name</th>
     <th>Email</th>
     <th>Github username</th>
     <th>Edit</th>
   </tr>
 </thead>

 <tbody>
   <% @coders.each do |coder| %>
     <tr>
       <td><%= coder.name %></td>
       <td><%= coder.email %></td>
       <td><%= coder.github_username %></td>
       <td><%= link_to 'Show', user_coder_path(current_user.id, coder) %><br>
           <%= link_to 'Edit', edit_user_coder_path(current_user.id, coder) %><br>
           <%= link_to 'Delete', user_coder_path(current_user.id, coder), :method => :delete %><br>
     </tr>
   <% end %>
 </tbody>
</table>
#coder>show
<h1>Coders#show</h1>
<%= @coder.name %>
<br>
<%= @coder.email %>
<br>
<%= @coder.github_username %>

pt.4 - RELATIONSHIPS WITH CODERS

rails g migration associate_coders_with_users
add_reference :coders, :user, index: true
@coders = user.coders
bundle exec rake db:migrate
select * from coders;

pt.4 - ADMIN

rails g controller admin show
@users = User.all
bundle exec rake routes
rails g migration add_admin_to_user
add_column :users, :admin, :boolean, default: false
bundle exec rake db:migrate

<table>
 <thead>
   <tr>
     <th>Name</th>
     <th>Email</th>
     <th>Admin?</th>
   </tr>
 </thead>

 <tbody>
   <% @users.each do |user| %>
     <tr>
       <td><%= user.name %></td>
       <td><%= user.email %></td>
       <td><%= user.admin %></td>
     </tr>
   <% end %>
 </tbody>
</table>
<%= link_to "Logout", '/logout' %>

pt.6 - SEEDING

bundle exec rake db:migrate
User.create!(name: "cam", email: "cameron.p.buckingham@gmail.com", password: "cam", admin: true)
#sessions>controller
if user.admin
  redirect_to '/admin'
#seeds > seeds_data/coders.csv
require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/coders.csv"), headers: true) do |row|
  Coder.find_or_create_by(id: row[0], name: row[1], email: row[2], github_username: row[3], user_id: row[4])
end

  id,name,email,github_username,user_id
  12434,"cam","cam@gmail.com","@cpbuckingham",1
  13344,"lindsey","lindsey@gmail.com","@lindsey",1
  1444,"mom","mom@gmail.com","@mom",1
  1513232323,"dad","dad@gmail.com","@dad",1
