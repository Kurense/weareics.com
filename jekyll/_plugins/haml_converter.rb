require 'haml'

module Jekyll
  class HamlConverter < Converter
    def matches(ext)
      ext =~ /haml/
    end

    def output_ext(ext)
      '.html'
    end

    def convert(content)
      Haml::Engine.new(content).render
    end
  end
end
