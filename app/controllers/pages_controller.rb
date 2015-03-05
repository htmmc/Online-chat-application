class PagesController < ApplicationController
  def listener_search
  	@listeners = User.where(listener: 'true').order(ready: :asc).limit(16)
  end
end
