prawn_document(:page_size => "A5") do |pdf|
  pdf.text @box.name, :size => 60, :align => :center
  pdf.image open("#{request.protocol}#{request.host_with_port}" + @box.qr_code.url), :position => :center
end