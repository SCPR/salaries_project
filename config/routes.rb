SalariesProject::Application.routes.draw do
  match "/list/:slug" => "application#list", as: :department
  match "/list"       => "application#list", as: :list
  
  root to: "application#home"
end
