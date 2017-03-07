module SimpleIterator
  class File < SimpleIterator::Plain
    def initialize(args)
      increment_lines   = args[:increment_lines]  || raise('increment_lines is required')
      @file_path        = args[:file_path]        || raise('file_path is required')
      @separate         = args[:separate]         || "\t"
      @skip_headers     = args[:skip_headers]     || false
      @line_separate_cb = args[:line_separate_cb] || lambda { |row| row }
      @fh               = ::File.open(@file_path, 'rb:UTF-8:UTF-8', undef: :replace)

      next_cb = lambda { |offset|
        @fh.gets if offset == 0 && @skip_headers

        data = []
        (0 .. increment_lines - 1).each do
          line = @fh.gets
          line.chomp! if !line.nil? && line.length > 0

          break if line.nil?

          row = @line_separate_cb.call(line.split(@separate))

          data.push(row)
        end

        data.length > 0 ? data : nil
      }

      super(
        next_cb:          next_cb,
        increment_offset: increment_lines,
        offset:           0
      )
    end
  end
end
