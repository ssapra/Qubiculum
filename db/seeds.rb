# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Department.destroy_all
Course.destroy_all
Section.destroy_all
Question.destroy_all

1.times do
  department = Department.new(:abrv => "CHEM")
  department.save
  
  5.times do |i|
    course = Course.new(:name => "Comprehensive General Chemistry-I", :number => (i+1)*100, :department_id => department.id)
    course.save

    3.times do |j|
      section = Section.new(:number => j, :course_id => course.id, :professor => "Professor #{j}")
      section.save
  
      2.times do |k|
        question = Question.new(:title => "Why is the sky blue", :section_id => section.id)
        question.save
      end
    end
  end
end
  