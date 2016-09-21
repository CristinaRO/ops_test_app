class OpsTestApp < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  helpers do
    def h(string)
      ERB::Util.h(string)
    end
  end

  get '/' do
    "Hello World running from #{system('hostname')}"
  end

  get '/todos' do
    @todos = Todo.all
    erb :todos
  end

  post '/todos' do
    Todo.create!(params)
    redirect '/todos'
  end

  post '/todos/:id/delete' do
    Todo.where(id: params[:id]).delete_all
    redirect '/todos'
  end
end
