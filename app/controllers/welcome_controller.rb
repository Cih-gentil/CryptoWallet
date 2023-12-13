class WelcomeController < ApplicationController
  def index

  cookies[:cookie] = "Cookies"
  @nome = params[:nome]
  @curso = params[:curso]
   end
end
