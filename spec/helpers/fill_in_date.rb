module FillInDate
  def fill_in_date(field, with:)
    date = with.to_date

    select(date.strftime('%Y'), from: field + '_1i')
    select(date.strftime('%B'), from: field + '_2i')
    select(date.strftime('%e').strip, from: field + '_3i')
  end
end
