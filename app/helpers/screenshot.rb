require 'screencap'
require 'uuidtools'

class Screenshot
  def snap(webpage)
    Screencap::Fetcher.new(webpage)
      .fetch(
        :output => file_path,
        :div => 'body',
        :width => 800
      )
    web_path
  end

  def file_path
    @file_path ||= begin
      "#{application_path}public/img/pages/#{uuid}.png"
    end
  end

  def web_path
    "/img/pages/#{uuid}.png"
  end

  def uuid
    @uuid ||= UUIDTools::UUID.random_create
  end

  def application_path
    File.expand_path($PROGRAM_NAME).gsub($PROGRAM_NAME,"")
  end
end
