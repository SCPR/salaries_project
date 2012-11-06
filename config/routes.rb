SalariesProject::Application.routes.draw do
  match "/list/:slug" => "main#list", as: :department
  match "/list"       => "main#list", as: :list
  
  root to: "main#home"
end
