module WordsHelper
  def current_filters(filters)
    if filters.empty?
      'All'
    else
      filters.join(' | ')
    end
  end

  def current_order(order)
    if order.blank?
      'General'
    else
      order
    end
  end

  def words_index_fragment_name(user_id, filters, order)
    name = Array.new
    name << "USERID-#{user_id}"
    name << "FILTERS-#{current_filters(filters).split(' ').join('-')}"
    name << "ORDER-#{current_order(order)}"
    name << "COUNT-#{Word.count}"
    name << "MAX-UPDATED-AT-#{Word.maximum(:updated_at).getutc}"
    return name.join('__')
  end
end
