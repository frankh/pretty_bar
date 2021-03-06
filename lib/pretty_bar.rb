class PrettyBar
  VERSION = "0.0.1"

  class ColorString < String
    def black;          "\033[30m#{self}\033[0m" end
    def red;            "\033[31m#{self}\033[0m" end
    def green;          "\033[32m#{self}\033[0m" end
    def  brown;         "\033[33m#{self}\033[0m" end
    def blue;           "\033[34m#{self}\033[0m" end
    def magenta;        "\033[35m#{self}\033[0m" end
    def cyan;           "\033[36m#{self}\033[0m" end
    def gray;           "\033[37m#{self}\033[0m" end
    def bg_black;       "\033[40m#{self}\0330m"  end
    def bg_red;         "\033[41m#{self}\033[0m" end
    def bg_green;       "\033[42m#{self}\033[0m" end
    def bg_brown;       "\033[43m#{self}\033[0m" end
    def bg_blue;        "\033[44m#{self}\033[0m" end
    def bg_magenta;     "\033[45m#{self}\033[0m" end
    def bg_cyan;        "\033[46m#{self}\033[0m" end
    def bg_gray;        "\033[47m#{self}\033[0m" end
    def bold;           "\033[1m#{self}\033[22m" end
    def reverse_color;  "\033[7m#{self}\033[27m" end
  end

  def color(str)
    ColorString.new(str)
  end

  def initialize(count=100)
    @count = count
    @success = 0
    @fails = 0
    @len = 60

    print_progress
  end

  def add_success!
    @success += 1
    print_progress
  end

  def add_fail!
    @fails += 1
    print_progress
  end

  def print_progress
    success_len = ((@success.to_f / @count) * @len).to_i
    fail_len = ((@fails.to_f / @count) * @len).to_i
    blank_len = @len - success_len - fail_len

    print "|" + color("#" * success_len).green + color("#" * fail_len).red + " " * blank_len + "|"
    print " #{@success+@fails}/#{@count} (#{@fails} fails)"
    # \r means next line will overwrite this one
    print "\r"
  end
end