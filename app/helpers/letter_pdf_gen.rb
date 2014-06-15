require 'prawn'

# Create a class which takes as argument the text, header, footer

def generate_pdf(from, to, content, footer, regarding, output_file)
  def header(pdf, from, to, regarding)
      from(pdf, from)
      to(pdf, to)
      reg(pdf, regarding)
  end

  def from(pdf, from)
      generate_bb(pdf, -40, from, 350, 140, 50, 0)
      generate_bb(pdf, -40, from, 350, 140, 50, 0)
  end

  def to(pdf, to)
      generate_bb(pdf, -40, to, 30, 170, 50, 0 )

  end
  def reg(pdf, regarding)
      generate_bb(pdf, -30, regarding, 30, 170, 50, 0 )
  end

  def body(pdf, content)
    generate_bb(pdf, 10, content, 30,470, 400, 0)
  end

  def footer(pdf, footer)
      generate_bb(pdf, -20, footer , 30, 470, 50, 0 )
  end

  def generate_bb(pdf, cursor_offset, text, left, width, height, stroke_opacity)
      y_position = pdf.cursor + cursor_offset
      pdf.bounding_box([left, y_position], :width => width, :height => height) do
          pdf.transparent(stroke_opacity) { stroke_bounds }
          text text, :align=>:justify
      end
  end
     Prawn::Document.generate(output_file, :page_size =>'A4') do
         # cursor = 40
         header(self, from, to, regarding)
         body(self, content)
         footer(self, footer)
     end

end

# from commandline
if(__FILE__ == $0)
  generate_pdf("Mr. Kent Steer\n406B Altona Nort, 3011\nPhone:0413627643", "Mr. Kent Steer\n406B Altona Nort, 3011\nPhone:0413627643", "Dear Minister,\n\n" + ("The quick brown fox jumps over the lazy dog.  The quick brown fox jumps over the lazy dog." *25), "Sincerely Yours,\nErmyas Abebe", "RE: Pot holes in Altona North", ARGV[0])
end
