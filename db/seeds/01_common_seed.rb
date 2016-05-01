# USER NOTIFICATION
puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts '** Seeding Common Settings (if required) **'
puts '** Note: Pay heed to following messages **'
sleep(5.seconds.to_i)

# required libraries
require 'securerandom'

# # SEEDING APP SETTINGS # #
# Examples
# puts AppSetting.set_if_nil(key, value)
# puts AppSetting.set_if_nil(key, 'XXX')
# puts AppSetting.set_if_nil('os_currencies', JSON.generate(%w(USD CAD AUD EUR GBP INR)))
# puts AppSetting.set_if_nil('mailer_credentials', JSON.generate({'email1' => 'passpwd1', 'email2' => 'passwd2'}))

#
# puts AppSetting.set_if_nil('facebook_app_id', 'XXX')
# puts AppSetting.set_if_nil('facebook_app_secret', 'XXX')
#
# puts AppSetting.set_if_nil('mailer_address', 'smtp.gmail.com')
# puts AppSetting.set_if_nil('mailer_port', '587')
# puts AppSetting.set_if_nil('mailer_domain', 'www.XXX.com')
# puts AppSetting.set_if_nil('mailer_user_name', 'XXX')
# puts AppSetting.set_if_nil('mailer_password', 'XXX')
# puts AppSetting.set_if_nil('mailer_authentication', 'plain')
# puts AppSetting.set_if_nil('mailer_enable_starttls_auto', 'true')
# puts AppSetting.set_if_nil('mailer_default_url_host', 'www.XXX.com')
# puts AppSetting.set_if_nil('mailer_raise_delivery_errors', 'false')
# puts AppSetting.set_if_nil('mailer_delivery_method', 'smtp')
#
# puts AppSetting.set_if_nil('devise_secret_key', SecureRandom.hex(128))
# puts "\n!!!!!!!!!!Note: devise_secret_key should never be changed.\n\n"
# 
# Seeding AppSettings
puts AppSetting.set_if_nil('site_name', 'WordList')
puts AppSetting.set_if_nil('site_url', 'http://manage-words.herokuapp.com')
puts AppSetting.set_if_nil('database', 'pg')

# Seeding flags
if Flag.count == 0
  Flag.create!(name: 'CL', value: 0, desc: 'Familiar Word (Comfort Level 0)')
  Flag.create!(name: 'CL', value: 1, desc: 'Slightly Comfortable (Comfort Level 1)')
  Flag.create!(name: 'CL', value: 2, desc: 'Comfortable (Comfort Level 2)')
  Flag.create!(name: 'CL', value: 3, desc: 'Highly Comfortable (Comfort Level 3)')
  Flag.create!(name: 'PR', value: 0, desc: 'Check Pronunciation')
  Flag.create!(name: 'PR', value: 1, desc: 'Getting Comfortable with Pronunciation')
  Flag.create!(name: 'GMAT', value: 0, desc: 'Relevant to GMAT')
  Flag.create!(name: 'GRMR', value: 0, desc: 'Relevant to GRAMMAR')
  Flag.create!(name: 'L-DE', value: 0, desc: 'German Word')
  Flag.create!(name: 'L-FR', value: 0, desc: 'French Word')
end

# Seeding dictionaries
if Dictionary.count == 0
  Dictionary.create!(name: 'cambridge', url: 'http://dictionary.cambridge.org/search/british/direct/?q=', separator: '-', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'collins', url: 'http://www.collinsdictionary.com/dictionary/english/', separator: '-', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'merriam_webster', url: 'http://www.merriam-webster.com/dictionary/', separator: '%20', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'google_search', url: 'https://www.google.co.in/webhp?#q=', separator: '+', suffix: '%20meaning', additional_info: nil)
  Dictionary.create!(name: 'macmillan', url: 'http://www.macmillandictionary.com/dictionary/british/', separator: '-', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'longman', url: 'http://www.ldoceonline.com/search/?q=', separator: '%20', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'oxford_learner', url: 'http://www.oxfordlearnersdictionaries.com/definition/english/', separator: '-', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'dictionary_dot_com', url: 'http://dictionary.reference.com/browse/', separator: '+', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'Wordnick', url: 'https://www.wordnik.com/words/', separator: '%20', suffix: nil, additional_info: nil)
  Dictionary.create!(name: 'google_hindi', url: 'https://www.google.co.in/webhp?ie=UTF-8#q=', separator: '%20', suffix: '+meaning+in+hindi', additional_info: nil)
end

# Seeding Important Users
if User.count == 0
  User.create!(:first_name => 'Munish', :last_name => 'Goyal', :type => 'Admin', :email => 'munishapc@gmail.com', :password => 'munishgoyal', :password_confirmation => 'munishgoyal')
  User.create!(:first_name => 'Ritika', :last_name => 'Goyal', :type => 'General', :email => 'ritikamittal9@gmail.com', :password => 'munishgoyal', :password_confirmation => 'munishgoyal')
  User.create!(:first_name => 'Manish', :last_name => 'Arya', :type => 'General', :email => 'coolaryan54@gmail.com', :password => 'rahularya', :password_confirmation => 'rahularya')
  User.create!(:first_name => 'Geetika', :last_name => 'Mittal', :type => 'General', :email => 'mittal.gitika@gmail.com', :password => 'iamdbest', :password_confirmation => 'iamdbest')
end


# LAST LINE: 
puts "\n"+'!!!!!!!!!!Check your app_settings table and look for nil and "XXX" values, and update them.'+"\n"
