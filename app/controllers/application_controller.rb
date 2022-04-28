class ApplicationController < ActionController::Base

  def dashboard
    render({:template=>"initial_templates/dashboard.html.erb"})
  end

end
