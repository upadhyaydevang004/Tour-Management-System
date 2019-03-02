json.extract! tour, :id, :id, :name, :description, :photo, :price, :booking_deadline, :start_date, :end_date, :start_location, :itinerary, :contact_agent, :seats, :status, :created_at, :updated_at
json.url tour_url(tour, format: :json)
