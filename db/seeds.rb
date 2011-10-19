# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

begin
  
  print "Feeding sample data to the Markov chain generator"
  require Rails.root.join('tmp/markov')
  chain = Markov::Chain.new
  Rails.root.join("tmp/products.txt").open.each_line do |line|
    chain << line
    print "."
  end
  puts " done!\n\n"
  
  print "Creating 1,000 products"
  1000.times do
    Product.create(
      name:         chain.generate,
      description:  chain.generate
    )
    print "."
  end
  Sunspot.commit
  puts " done!\n\n"

rescue LoadError
  
  puts "Sorry! The rake db:seed task currently uses some dodgy code that @nz\ndidn't want to commit"
  
end
