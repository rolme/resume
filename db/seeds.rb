# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require File.expand_path("../../config/config.rb", __FILE__)

def seed_my_resume
  puts "adding user"
  user = User.new(handle: CONFIG[:MY_HANDLE], email: CONFIG[:MY_EMAIL],
                  password: CONFIG[:MY_PASSWORD], password_confirmation: CONFIG[:MY_PASSWORD])
  CV[:SECTIONS].symbolize_keys!
  user.contact_information = ContactInformationFactory.build(config: CV[:SECTIONS][:CONTACT_INFORMATION])
  user.address = AddressFactory.build(config:  CV[:SECTIONS][:ADDRESS])
  user.save!

  cv = Cv.create!(user: user, title: CV[:TITLE], target: CV[:TARGET])

  CV[:SECTIONS].keys.each do |h|
    puts "adding section: #{h}"
    s = Section.create! header: h.downcase
    cv.sections << s
  end
  cv.save!

  puts "adding skillsets"
  skill_section = cv.sections.select{|s| s.header == 'skills'}.first
  SkillsetFactory.build(config: CV[:SECTIONS][:SKILLS]).each do |ss|
    ss.parent = skill_section
    ss.save!
  end

  puts "adding experiences"
  experience_section = cv.sections.select{|s| s.header == 'experience'}.first
  ExperienceSectionFactory.build(config: CV[:SECTIONS][:EXPERIENCE]).each do |es|
    es.parent = experience_section
    es.save!
  end

  puts "adding objective text"
  s = cv.sections.select{|s| s.header == 'objective'}.first
  Item.create!(description: CV[:SECTIONS][:OBJECTIVE], section: s)

  puts "adding education text"
  s = cv.sections.select{|s| s.header == 'education'}.first
  Item.create!(description: CV[:SECTIONS][:EDUCATION], section: s)

end

puts "GENERATING SEED DATA:"

print "admin user... "
User.create!(handle: "admin", email: "roland.parnaso+resume.admin@gmail.com",
             password: CONFIG[:ADMIN_PASSWORD], password_confirmation: CONFIG[:ADMIN_PASSWORD])
puts "DONE\n"

puts "create my resume..."
seed_my_resume
puts "DONE\n"