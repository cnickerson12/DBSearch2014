namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Investor].each(&:delete_all)
    
    Investor.populate 50 do |investor|
      investor.fund = Faker::Company.name
      investor.fund_size = [300,500,400,100]
      investor.contact = Faker::Name.name
      investor.email = Faker::Internet.email
      
    end

  end
end