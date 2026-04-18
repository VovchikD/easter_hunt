Admin.find_or_create_by(email: "admin@mail.com") do |admin|
  admin.password = "1234567890"
end
