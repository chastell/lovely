class BasicWrapper
  getter :text, :width

  def initialize(@text : String, @width = 72)
  end

  def call
    text.tr("\n", " ").strip.gsub(/(.{1,#{width}})( |$\n?)/, "\\1\n")
  end
end
