class Search < ApplicationRecord
  def search_tours
    num_1 = 1
    num_0 = 0
    tours = Tour.all
    tours = tours.where("lower(itinerary) like ?", "%#{itinerary.downcase}%") if itinerary.present?
    tours = tours.where("lower(name) like ?", "%#{name.downcase}%") if name.present?
    # tours = tours.where("lower(name) like ?", "%#{name.downcase}%") if name.present?
    #
    tours = tours.where("price >= ?", min_price) if min_price.present?
    tours = tours.where("price <= ?", max_price) if max_price.present?

    tours = tours.where("seats > ?",num_0) if seats == num_1

    tours = tours.where("start_date >=?", start_date_from) if start_date_from.present?
    tours = tours.where("start_date <=?", start_date_to) if start_date_to.present?
  end
end
