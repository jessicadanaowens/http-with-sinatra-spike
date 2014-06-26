require "sinatra/base"

class MyApp < Sinatra::Application

  def initialize
    super
    @dogs = ["Henry", "Sam", "Jilly"]

  end

  get "/" do
    erb :root
  end

  get "/dogs" do
    filter = params[:filter]
    selected_dogs = @dogs
    if filter != nil
      selected_dogs = @dogs.select do |dog| dog.downcase.include?(filter.downcase) end
    end
    erb :dogs, :locals =>{:selected_dogs => selected_dogs} # get me the dogs view file

  end

  get "/dogs/:bla" do
    erb :dog
    end

  run! if app_file == $0
end
