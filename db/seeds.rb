require 'nokogiri'
require 'open-uri'

Department.destroy_all
Course.destroy_all
Section.destroy_all
Question.destroy_all

puts "Rebuilding database..."

# doc2 =  Nokogiri::HTML(open('http://timeschedules.uchicago.edu/'))
# 
# doc2.css('dt a').each do |link|

doc2 =  Nokogiri::HTML(open('http://timeschedules.uchicago.edu/'))

doc2.css('dt a').each do |link|

  if link.content[0..3] != "Esse"
    department = Department.create(:abrv => link.content.split("(")[1].split(")")[0], 
                                   :name => link.content.split("(")[0])
                                   
    response = Nokogiri::HTML(open("http://timeschedules.uchicago.edu/view.php?dept=#{department.abrv}&term=452"))
    response.xpath( '//span[@class="smallredt"]/ancestor::a/ancestor::td/ancestor::tr').each do |r|
      course_name = r.xpath('./td[1]/a/span').text.strip
      m = /\A(?<department>[A-Z]{4}).\/.(?<number>\d{5}).\-.(?<section>\w{2})\z/x.match(course_name)
      if m && m[:number][0].to_i < 3  
        length = r.xpath('./td[2]/span').text.strip.length
        if r.xpath('./td[2]/span').text.strip != "CANCELLED"
          if r.xpath('./td[2]/span').text.strip[length-2] == "-"
            name = r.xpath('./td[2]/span').text.strip[0..length-3]
          else
            name = r.xpath('./td[2]/span').text.strip
          end
          
          course = Course.create(:name => name, :department_id => department.id, :number => m[:number].to_i) 
        
          2.times do |k|
            question = Question.create(:title => "Why is the sky blue", :course_id => course.id) if course
          end
        end
      end
    
    end
  end
end

puts 
puts "Finished rebuilding!"  