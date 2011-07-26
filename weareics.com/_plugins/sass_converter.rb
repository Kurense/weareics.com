require 'sass'

module Jekyll
  class SassConverter < Converter
    def matches(ext)
      ext =~ /sass/
    end

    def output_ext(ext)
      '.css'
    end

    def convert(content)
      Sass::Engine.new(content).render
    end
  end
end
