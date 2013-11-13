module CataloguesHelper
  def sortable(column, direction)
    link_to t(".#{column + direction}"), { sort: column, direction: direction}, data: { sort: column, direction: direction }
  end
end
