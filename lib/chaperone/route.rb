module Chaperone
  module Route

    attr_accessor :def_block

    def default_block(&block)
      if block_given?
        self.def_block = block
      else
        self.def_block
      end
    end

    def list(*args, &block)
      if (args.length + 1) == class_array.length
        Chaperone::Base.get build_url(*args), &best_block(&block)
      else
        puts "BAD"
      end
    end

    def show(*args, &block)
      if args.length == class_array.length
        Chaperone::Base.get build_url(*args), &best_block(&block)
      else
        puts "BAD"
      end
    end

    def create(*args, &block)
      if args.length == class_array.length
        payload = args.pop
        puts payload
        Chaperone::Base.post build_url(*args), &best_block(&block)
      else
        puts "BAD"
      end
      
    end

    def update(*args, &block)
      if (args.length - 1) == class_array.length
        payload = args.pop
        puts payload
        Chaperone::Base.put build_url(*args), &best_block(&block)
      else
        puts "BAD"
      end
    end

    def delete(*args, &block)
      if args.length == class_array.length
        Chaperone::Base.delete build_url(*args), &best_block(&block)
      else
        puts "BAD"
      end
    end

    private

    def build_url(*args)
      arr = class_array.inject(['']) { |arr, cl|  arr << (cl << 's'); arr << args.shift.to_s; arr }
      arr.join("/")
    end

    def best_block(&block)
      if block_given?
        block
      elsif default_block
        default_block
      else
        Chaperone.config.default_block
      end
      
    end

    def class_array
      self.to_s.downcase.split("::")
    end
  end
end