pdf.text "<b>Peak Volume Time (24 hours)</b>", :inline_format => true, :align => :center, size: 25
pdf.move_down 15
pdf.text "<b>Morning vs Evening</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15

n = @peak_volume_report[:morn_vs_eve_peak_time_per_day][:Northbound]
table_data = [['Day','Peak Volume Time(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @peak_volume_report[:morn_vs_eve_peak_time_per_day][:Southbound]
table_data = [['Day','Peak Volume Time(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 15
pdf.text "<b>Per Hour</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @peak_volume_report[:hour_peak_time_per_day][:Northbound]
table_data = [['Day','Peak Volume Time(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @peak_volume_report[:hour_peak_time_per_day][:Southbound]
table_data = [['Day','Peak Volume Time(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 15
pdf.text "<b>Per Half Hour</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @peak_volume_report[:half_hour_peak_time_per_day][:Northbound]
table_data = [['Day','Peak Volume Time(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @peak_volume_report[:half_hour_peak_time_per_day][:Southbound]
table_data = [['Day','Peak Volume Time(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.move_down 15
pdf.text "<b>Per 20 minutes</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @peak_volume_report[:twenty_min_peak_time_per_day][:Northbound]
table_data = [['Day','Peak Volume Time(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @peak_volume_report[:twenty_min_peak_time_per_day][:Southbound]
table_data = [['Day','Peak Volume Time(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end

pdf.start_new_page
pdf.text "<b>Per 15 minutes</b>", :inline_format => true, :align => :center, size: 20
pdf.move_down 15
n = @peak_volume_report[:fifteen_min_peak_time_per_day][:Northbound]
table_data = [['Day','Peak Volume Time(Northbound)']]
n.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end
s = @peak_volume_report[:fifteen_min_peak_time_per_day][:Southbound]
table_data = [['Day','Peak Volume Time(Southbound)']]
s.each_with_index do |element,index|
  table_data << [index+1,element]
end
pdf.table(table_data) do |table|
  table.style(table.row(0), :background_color => 'AAAAAA')
  table.row(0).font_style = :bold
  table.header = true
end