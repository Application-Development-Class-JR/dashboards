Rails.application.routes.draw do
  
  get("/", { :controller => "application",:action => "dashboard"})
  get("/forex",{:controller=>"currencies",:action=>"pairs_step1"})
  
  get("/forex/:the_currency", { :controller => "currencies", :action => "pairs_step2" })

  get("/forex/:the_currency/:the_currency_2", { :controller => "currencies", :action => "pairs_step3" })
end
