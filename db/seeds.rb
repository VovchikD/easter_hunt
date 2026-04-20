Admin.find_or_create_by(email: "admin@mail.com") do |admin|
  admin.password = "1234567890"
end
SystemAdmin.find_or_create_by(email: 'admin@mail.com') do |admin|
  admin.password = "1234567890"
  admin.password_confirmation = "1234567890"
end
