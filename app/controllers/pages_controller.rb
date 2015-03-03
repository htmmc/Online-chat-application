class PagesController < ApplicationController
  def listener_search
  	@listeners = User.where(listener: 'true').limit(12)
  end

end
