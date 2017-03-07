module SimpleIterator
  class Plain
    def initialize(args)
      @next_cb          = args[:next_cb]          || raise('next_cb is required')
      @increment_offset = args[:increment_offset] || raise('increment_offset is required')
      @current_offset   = args[:offset]           || 0
    end

    def next
      res = @next_cb.call(@current_offset)
      @current_offset += @increment_offset
      res
    end

    def index
      if @current_offset > @increment_offset
        (@current_offset / @increment_offset).to_i
      else
        1
      end
    end
  end
end
