source 'https://supermarket.chef.io'

metadata

cookbook "java"
cookbook "apt"
cookbook "windows"
cookbook "homebrew"

group :integration do
  cookbook 'mytest', path: './test/cookbooks/mytest'
end
