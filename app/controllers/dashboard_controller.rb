class DashboardController < ApplicationController
	before_action :authenticate_user!
	$titulo = 'Administración'
def main
	if user_signed_in?
		
	else
		redirect_to new_user_session_path
	end
end

def unregistred
	redirect_to new_user_session_path
end

end
