module ActionScrabble
end

PROJECT_ROOT = File.expand_path("../", File.dirname(__FILE__))

Dir.glob("#{PROJECT_ROOT}/lib/**/*.rb").each do |f|
  require f
end

