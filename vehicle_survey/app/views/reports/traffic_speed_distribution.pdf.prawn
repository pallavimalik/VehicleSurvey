pdf.text "<b>Traffic Speed Distribution (m/sec)</b>", :inline_format => true, :align => :center, size: 25
pdf.move_down 15
pdf.text "<b>Morning vs Evening</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15

n = @speed_report[:vehicle_morn_vs_eve][:Northbound].map{|key|  key.first }
table_data = [['Day','Average Speed in Morning(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_report[:vehicle_morn_vs_eve][:Southbound].map{|key|  key.first }
table_data = [['Day','Average Speed in Morning(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
n = @speed_report[:vehicle_morn_vs_eve][:Northbound].map{|key|  key.last }
table_data = [['Day','Average Speed in Evening(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_report[:vehicle_morn_vs_eve][:Southbound].map{|key|  key.last }
table_data = [['Day','Average Speed in Evening(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Average Speed Per Hour</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_report[:vehicle_speed_per_hr][:Northbound]
table_data = [['Day','Average Speed(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_report[:vehicle_speed_per_hr][:Southbound]
table_data = [['Day','Average Speed(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 50
pdf.text "<b>Average Speed Per Half Hour</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_report[:vehicle_speed_per_half_hr][:Northbound]
table_data = [['Day','Average Speed(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_report[:vehicle_speed_per_half_hr][:Southbound]
table_data = [['Day','Average Speed(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Average Speed Per 20 minutes</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_report[:vehicle_speed_per_twenty_min][:Northbound]
table_data = [['Day','Average Speed(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_report[:vehicle_speed_per_twenty_min][:Southbound]
table_data = [['Day','Average Speed(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Average Speed Per 15 minutes</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_report[:vehicle_speed_per_fifteen_min][:Northbound]
table_data = [['Day','Average Speed(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_report[:vehicle_speed_per_fifteen_min][:Southbound]
table_data = [['Day','Average Speed(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element.join(" , ")]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Average Speed Per Day</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_per_day_report[:morn_vs_eve_speed_per_day][:Northbound]
table_data = [['Day','Average Speed Morn vs Eve(Northbound) ']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_per_day_report[:morn_vs_eve_speed_per_day][:Southbound]
table_data = [['Day','Average Speed  Morn vs Eve(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 15
n = @speed_per_day_report[:hour_speed_per_day][:Northbound]
table_data = [['Day','Average Speed per Hour(Northbound) ']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_per_day_report[:hour_speed_per_day][:Southbound]
table_data = [['Day','Average Speed  per Hour(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Average Speed Per Day</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_per_day_report[:half_hour_speed_per_day][:Northbound]
table_data = [['Day','Average Speed per Half Hour(Northbound) ']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_per_day_report[:half_hour_speed_per_day][:Southbound]
table_data = [['Day','Average Speed  per Half Hour(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 15
n = @speed_per_day_report[:twenty_min_speed_per_day][:Northbound]
table_data = [['Day','Average Speed per 20 min(Northbound) ']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_per_day_report[:twenty_min_speed_per_day][:Southbound]
table_data = [['Day','Average Speed  per 20 min(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Average Speed Per Day</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @speed_per_day_report[:fifteen_min_speed_per_day][:Northbound]
table_data = [['Day','Average Speed per 15 min(Northbound) ']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @speed_per_day_report[:fifteen_min_speed_per_day][:Southbound]
table_data = [['Day','Average Speed  per 15 min(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

