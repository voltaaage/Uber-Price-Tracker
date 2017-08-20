# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

# Destinations
home = Destination.new(
  address: '699 John St',
  city: 'Seattle',
  state: 'WA'
)
home.user = admin
home.save!

work = Destination.new(
  address: '307 3rd Ave S',
  city: 'Seattle',
  state: 'WA'
)
work.user = admin
work.save!

cap_cider = Destination.new(
  address: '818 E Pike St',
  city: 'Seattle',
  state: 'WA'
)
cap_cider.user = admin
cap_cider.save!
