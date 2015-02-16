pdf.text "<b>Vehicle Count Survey</b>", :inline_format => true, :align => :center, size: 25

pdf.move_down 10
pdf.text "<b>Total Vehicle Count</b> : #{@vehicle_count[:total_vehicle_count]}", inline_format: true, size: 15
pdf.move_down 5

pdf.move_down 5
pdf.text "<b>Total Vehicle Count by Direction</b>", inline_format: true, size: 15
pdf.text "Northbound Vehicles : #{@vehicle_count[:total_vehicle_count_by_dir][:Northbound]}", inline_format: true, size: 13
pdf.text "Southbound Vehicles : #{@vehicle_count[:total_vehicle_count_by_dir][:Southbound]}", inline_format: true, size: 13
pdf.move_down 5

pdf.move_down 5
pdf.text "<b>Total Vehicle Count Morning vs Evening</b>", inline_format: true, size: 15
n = @vehicle_count[:vehicle_count_morn_vs_eve][:Northbound].map{|key|  key.first }
s = @vehicle_count[:vehicle_count_morn_vs_eve][:Southbound].map{|key|  key.first }

table_data_1 = [['Day','Number of vehicles in Morning(Northbound)']]

n.each_with_index do |element,index|
  table_data_1 << [index+1,element]
end

table_data_2 = [['Day','Number of vehicles in Morning(Southbound)']]
s.each_with_index do |element,index|
  table_data_2 << [index+1,element]
end

pdf.table(table_data_1) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.table(table_data_2) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

n = @vehicle_count[:vehicle_count_morn_vs_eve][:Northbound].map{|key|  key.last }
s = @vehicle_count[:vehicle_count_morn_vs_eve][:Southbound].map{|key|  key.last }

table_data_1 = [['Day','Number of vehicles in Evening(Northbound)']]

n.each_with_index do |element,index|
  table_data_1 << [index+1,element]
end

table_data_2 = [['Day','Number of vehicles in Evening(Southbound)']]
s.each_with_index do |element,index|
  table_data_2 << [index+1,element]
end

pdf.table(table_data_1) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.table(table_data_2) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 10
n = @vehicle_count[:average_count_morn_vs_eve][:Northbound]
table_data_3 = [['Day','Average of number of vehicles Morning vs Evening(Northbound)']]
n.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

s = @vehicle_count[:average_count_morn_vs_eve][:Southbound]
table_data_3 = [['Day','Average of number of vehicles Morning vs Evening(Southbound)']]
s.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.text "<b>Total Vehicle Count per Hour</b>", inline_format: true, size: 15
n = @vehicle_count[:vehicle_count_per_hr][:Northbound]
s = @vehicle_count[:vehicle_count_per_hr][:Southbound]
table_data_3 = [['Day','Number of vehicles per hour(Northbound)']]
table_data_4 = [['Day','Number of vehicles per hour(Southbound)']]

n.each_with_index do |element,index|
  table_data_3 << [index+1,element.join(" , ")]
end
s.each_with_index do |element,index|
  table_data_4 << [index+1,element.join(" , ")]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.table(table_data_4) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

n = @vehicle_count[:average_count_per_hr][:Northbound]
pdf.move_down 10
table_data_3 = [['Day','Average of number of vehicles per hour(Northbound)']]
n.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

s = @vehicle_count[:average_count_per_hr][:Southbound]
table_data_3 = [['Day','Average of number of vehicles per hour(Southbound)']]
s.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 20
pdf.text "<b>Total Vehicle Count per Half Hour</b>", inline_format: true, size: 15
n = @vehicle_count[:vehicle_count_per_half_hr][:Northbound]
s = @vehicle_count[:vehicle_count_per_half_hr][:Southbound]
table_data_3 = [['Day','Number of vehicles per half hour(Northbound)']]
table_data_4 = [['Day','Number of vehicles per half hour(Southbound)']]

n.each_with_index do |element,index|
  table_data_3 << [index+1,element.join(" , ")]
end
s.each_with_index do |element,index|
  table_data_4 << [index+1,element.join(" , ")]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.table(table_data_4) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 10
n = @vehicle_count[:average_count_per_half_hr][:Northbound]
table_data_3 = [['Day','Average of number of vehicles per half hour(Northbound)']]
n.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

s = @vehicle_count[:average_count_per_half_hr][:Southbound]
table_data_3 = [['Day','Average of number of vehicles per half hour(Southbound)']]
s.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 20
pdf.text "<b>Total Vehicle Count per 20 min</b>", inline_format: true, size: 15
n = @vehicle_count[:vehicle_count_per_twenty_min][:Northbound]
s = @vehicle_count[:vehicle_count_per_twenty_min][:Southbound]
table_data_3 = [['Day','Number of vehicles per 20 min(Northbound)']]
table_data_4 = [['Day','Number of vehicles per 20 min(Southbound)']]

n.each_with_index do |element,index|
  table_data_3 << [index+1,element.join(" , ")]
end
s.each_with_index do |element,index|
  table_data_4 << [index+1,element.join(" , ")]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.table(table_data_4) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 10
n = @vehicle_count[:average_count_per_twenty_min][:Northbound]
table_data_3 = [['Day','Average of number of vehicles per 20 min(Northbound)']]
n.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

s = @vehicle_count[:average_count_per_twenty_min][:Southbound]
table_data_3 = [['Day','Average of number of vehicles per 20 min(Southbound)']]
s.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 20
pdf.text "<b>Total Vehicle Count per 15 min</b>", inline_format: true, size: 15
n = @vehicle_count[:vehicle_count_per_fifteen_min][:Northbound]
s = @vehicle_count[:vehicle_count_per_fifteen_min][:Southbound]
table_data_3 = [['Day','Number of vehicles per 15 min(Northbound)']]
table_data_4 = [['Day','Number of vehicles per 15 min(Southbound)']]

n.each_with_index do |element,index|
  table_data_3 << [index+1,element.join(" , ")]
end
s.each_with_index do |element,index|
  table_data_4 << [index+1,element.join(" , ")]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.table(table_data_4) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 10
n = @vehicle_count[:average_count_per_fifteen_min][:Northbound]
table_data_3 = [['Day','Average of number of vehicles per 15 min(Northbound)']]
n.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

s = @vehicle_count[:average_count_per_fifteen_min][:Southbound]
table_data_3 = [['Day','Average of number of vehicles per 15 min(Southbound)']]
s.each_with_index do |element,index|
  table_data_3 << [index+1,element]
end

pdf.table(table_data_3) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end