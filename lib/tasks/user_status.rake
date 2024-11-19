namespace :user do
  desc "Update offline status for inactive users"
  task update_offline_status: :environment do
    User.update_offline_status
    puts "Updated offline status for inactive users"
  end
end