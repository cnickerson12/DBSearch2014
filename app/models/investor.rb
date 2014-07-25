class Investor < ActiveRecord::Base
  attr_accessible :fund, :contact, :email, :type, :fund_size

def self.search(search)
  if search
    where('fund LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
