require 'screencap'
require 'uuidtools'

class Screenshot
  def snap(webpage)
    Screencap::Fetcher.new(webpage)
      .fetch(
        :output => "public/#{output_image}",
        :div => 'body',
        :width => 800
      )
    output_image
  end

  def output_image
    @output_image ||= begin
      uuid = UUIDTools::UUID.random_create
      "img/pages/#{uuid}.png"
    end
  end
end
