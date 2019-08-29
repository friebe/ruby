desc "Sendet Kommentare der letzten [x] tage bsp: send_mail[3], default value 2 days"
task :send_mail, [:days] => :environment do |t, args|
    days = args[:days] || 2
    UpdateMailer.create_welcome(days.to_i).deliver_now
  end