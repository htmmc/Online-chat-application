class PagesController < ApplicationController
  def listener_search
  	@listeners = User.where(listener: 'true').order(ready: :asc).limit(12)
  end
end
