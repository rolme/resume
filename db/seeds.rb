# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require File.expand_path("../../config/config.rb", __FILE__)

def seed_my_resume
  user = User.new(handle: CONFIG[:MY_HANDLE], email: CONFIG[:MY_EMAIL],
                  password: CONFIG[:MY_PASSWORD], password_confirmation: CONFIG[:MY_PASSWORD])

  user.contact_information = ContactInformationFactory.build(config: CONFIG)
  user.address = AddressFactory.build(config: CONFIG)
  user.save!

  cv = Cv.create!(user: user, title: CONFIG[:MY_CV_TITLE], target: CONFIG[:MY_CV_TARGET])

  %w[objective summary skills experience education associations references].each do |h|
    s = Section.create! header: h
    cv.sections << s
  end
  cv.save!

  skill_section = Section.find_by_header('skills')
  SkillsetFactory.build(config: CONFIG).each do |ss|
    ss.parent = skill_section
    ss.save!
  end

end

puts "GENERATING SEED DATA:"

print "admin user... "
User.create!(handle: "admin", email: "roland.parnaso+resume.admin@gmail.com",
             password: CONFIG[:ADMIN_PASSWORD], password_confirmation: CONFIG[:ADMIN_PASSWORD])
puts "DONE\n"

print "create my resume..."
seed_my_resume
puts "DONE\n"

=begin
print "subsections..."
%w[skillset].each do |h|
  Section.create! header: header
end
puts "DONE\n"

print "items..."
%w[bullet skill].each do |h|
  Section.create! header: header
end
puts "DONE\n"
=end