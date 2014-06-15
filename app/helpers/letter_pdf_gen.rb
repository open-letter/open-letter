require 'prawn'
require 'date'

# Create a class which takes as argument the text, header, footer

def generate_pdf(from, to, content, footer, regarding, output_file)
  def header(pdf, from, to, regarding)
      from(pdf, from)
      to(pdf, to)
      reg(pdf, regarding)
  end

  def from(pdf, from)
      generate_bb(pdf, -40, from, 350, 140, 50, 0)
      generate_bb(pdf, -10, Date.today().strftime("%A %B %d %Y"), 350, 140, 50, 0)
  end

  def to(pdf, to)
      generate_bb(pdf, -5, to, 30, 170, 50, 0 )
  end
  def reg(pdf, regarding)
      # generate_bb(pdf, -30, regarding, 30 , 170, 50, 0 )
      # TODO: figure out a way to pass the style of a text and refactor this out to generate_bb
      y_position = pdf.cursor - 30
      pdf.bounding_box([30, y_position], :width => 170, :height => 50) do
          pdf.transparent(0) { stroke_bounds }
          text regarding, :align=>:left, :style => :bold
      end
  end

  def body(pdf, content)
      generate_bb(pdf, 10, content, 30,470, 300, 0)
  end

  def footer(pdf, footer)
      generate_bb(pdf, -20, footer , 30, 470, 50, 0 )
  end

  def generate_bb(pdf, cursor_offset, text, left, width, height, stroke_opacity)
      y_position = pdf.cursor + cursor_offset
      pdf.bounding_box([left, y_position], :width => width, :height => height) do
          pdf.transparent(stroke_opacity) { stroke_bounds }
          text text, :align=>:left
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
    generate_pdf("Mr. Kent Steer\n406B Altona Nort, 3011\nPhone: 0413627643", "Mr. Kent Steer\n406B Altona Nort, 3011\nPhone: 0413627643", "Dear Minister,\n\n" + ("The quick brown fox jumps over the lazy dog.  The quick brown fox jumps over the lazy dog." *15), "Sincerely Yours,\nErmyas Abebe", "RE: Pot holes in Altona North", ARGV[0])
end

