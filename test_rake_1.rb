task :default => "foo"

deps = [proc {"bar"}, proc {"xxxx"}, proc{"xxx"}]
rule /^foo$/ => deps

rule /^bar$/ do |t|
   puts t.name
end
