class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
  		  :registerable,
        :recoverable, 
        :rememberable, 
        :trackable, 
        :validatable,
        :confirmable

  #validates_acceptance_of :term_agreement

  scope :public_fields, -> { select(:name, :username, :agegroup, :license_type, :registration_type, :description, :religion, :specialty, :categories, :description, :beginning_of_available_time, :end_of_available_time) }        

    #def old_enough
#      errors.add(:birthday, "must be older than 18") if birthday.to_date < 18.years.ago 
#    end  
# in a process of adding search function
#    def self.search(search)
#      search_condition = "%" + search + "%"
#      find(:all, :conditions => ['description of listener: ?', search_condition, search_condition])
#    end
  protected
    #Test to see if this will skip the confirmation process for now
    def skip_confirmation!
      self.confirmed_at = Time.now
    end

    def confirmation_required?
      false
    end
end
