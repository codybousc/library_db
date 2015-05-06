class Book
  attr_reader(:book_id, :book_name)

  define_method(:initialize) do |variable|
    @book_name = variable.fetch(:name)
    @book_id = variable.fetch(:id)
  end

  define_singleton_method(:all_books) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      book_name = book.fetch("book_name")
      id = book.fetch("book_id").to_i
      books.push(Book.new(:name => book_name, :id => id))
    end
    books
  end

  define_singleton_method(:ind_book) do

  end

  define_method(:save_book) do
    result = DB.exec("Insert INTO books (book_name) VALUES ('#{@book_name}') RETURNING book_id; ")
    @book_id = result.first().fetch("book_id").to_i()
  end

  define_method(:update_book) do

  end

  define_method(:delete_book) do

  end

  define_method(:==) do

  end

end
