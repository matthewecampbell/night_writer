class NightReader
  attr_reader          :old_message,
                       :new_message

  def initialize
    @old_message = ARGV[0]
    @new_message = ARGV[1]
  end

  def read
    read_file = @old_message
    File.read(read_file)
  end


  def file_reader
    read_file
  end

  def file_writer
    write_file
  end

end
