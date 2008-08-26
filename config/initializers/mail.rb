    # Email settings
   ActionMailer::Base.delivery_method = :smtp
   ActionMailer::Base.smtp_settings = {
   :address => "smtp.speedyrails.com",
   :port => 25,
   :domain => "freedomofrent.com",
   :authentication => :login,
   :user_name => "freedomofrent",
   :password => "6QtybX4HLw"  
   }

