img = Magick::Image::read("app/logo.png").first
img.each_pixel do |pixel, col, row|
  c = [pixel.red, pixel.green, pixel.blue].map { |v| 256 * (v / 65535.0) }
  pixel.opacity == 65535 ? print("  ") : print("  ".bg c)
  puts if col >= img.columns - 1
end

Catpix::print_image "app/logo.png",
  :limit_x => 1.0,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg_fill => true
