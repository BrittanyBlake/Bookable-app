module GroupsHelper
  def book_group
    render @book.groups if @book.groups.any?
  end
end
