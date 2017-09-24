#---
# Excerpted from "Programming Ruby 1.9 and 2.0",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ruby4 for more book information.
#---
require 'csv' 
require_relative 'book_in_stock'

class CsvReader
  def initialize
    @books_in_stock = []
  end
  
  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row|
      @books_in_stock << BookInStock.new(row["ISBN"], row["Price"])
    end
  end  
  def total_value_in_stock   # later we'll see how to use inject to sum a collection
    sum = 0.0        
    @books_in_stock.each {|book| sum += book.price}
    sum
  end  
  
  def number_of_each_isbn
    # ...
  end
end             
