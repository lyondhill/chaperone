module Chaperone
  module Route

    def list(*args)
      if (args.length + 1) == class_array.length
        build_url(*args)
      else
        puts "BAD"
      end
    end

    def show(*args)
      if args.length == class_array.length
        build_url(*args)
      else
        puts "BAD"
      end
    end

    def create(*args)
      if args.length == class_array.length
        payload = args.pop
        puts payload
        build_url(*args)
      else
        puts "BAD"
      end
      
    end

    def update(*args)
      if (args.length - 1) == class_array.length
        payload = args.pop
        puts payload
        build_url(*args)
      else
        puts "BAD"
      end
    end

    def delete(*args)
      if args.length == class_array.length
        build_url(*args)
      else
        puts "BAD"
      end
    end

    private

    def build_url(*args)
      arr = class_array.inject([]) { |arr, cl|  arr << (cl << 's'); arr << args.shift.to_s; arr }
      puts arr.join("/")
    end

    def class_array
      self.to_s.downcase.split("::")
    end
  end
end