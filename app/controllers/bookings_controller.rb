class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit , :update]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @tour = Tour.find(booking_params[:tour_id])
    @booking_waitlisted = Booking.new(booking_params)
    if (@tour.seats.to_i >= booking_params[:seats_booked].to_i)
      seats = @tour.seats.to_i - booking_params[:seats_booked].to_i
      @tour.seats = seats
      @tour.save
      @booking.status = 1
    else
      if (booking_params[:preference] == "Book available seats" && @tour.seats.to_i > 0)
        @booking.seats_booked = @tour.seats
        seats = 0
        @tour.seats = seats
        @tour.save
        @booking.status = 1
      elsif (booking_params[:preference] == "Book Available seats and add remaining to waitlist")
        @booking.seats_booked = @tour.seats
        @tour.seats = 0
        @tour.save
        @booking.status = 1

      #   to handle waitlist seats
        @booking_waitlisted.seats_booked = @booking_waitlisted.seats_booked - @booking.seats_booked
        @booking_waitlisted.status = 0
        @booking_waitlisted.save
      elsif (booking_params[:preference] == "Book only if all seats are available")
        @booking.status = 0
      end
    end
    respond_to do |format|
        if  @booking.save
          format.html { redirect_to bookings_url, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update

    # if booking_params[:seats_booked].to_i < @booking.seats_booked.to_i
      tp = params.fetch(:booking).permit(:customer_id,:tour_id,:seats_booked,:preference)
      seats = @booking.seats_booked.to_i - booking_params[:seats_booked].to_i
      @tour = Tour.find(@booking.tour_id)
      @tour.seats = @tour.seats + booking_params[:seats_booked].to_i
      @tour.save
     tp[:seats_booked] = seats

      @tour = Tour.find(@booking.tour_id)

      # booking_db = Booking.order("created_at ASC").find(params[:tour_id])
      booking_db = Booking.all.sort_by {|booking| booking.created_at }
      booking_db.each do |booking|
        if booking.seats_booked <= @tour.seats && booking.status == 0
          @tour.seats = @tour.seats - booking.seats_booked
          booking.status = 1
          booking.save
          @tour.save
          WaitListConfirmationMailer.notify_user(booking.customer).deliver_now
        end
      end


      # format.html { redirect_to @booking, notice: 'cannot delete more seats than booked' }
      # format.json { render :edit, status: :ok, location: @booking }
    # end


    respond_to do |format|
      if @booking.update(tp)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  # def partial_delete
  #   # @booking = Booking.all
  #   @booking = Booking.find(params[:booking_id])
  #
  #   if (@booking.seats_booked  )
  #
  #   end
  # end



  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:booking_id])
    if @booking.status == 1
      @tour = Tour.find(params[:tour_id])
      puts params
      seats = @tour.seats.to_i + @booking.seats_booked.to_i
      @tour.seats = seats
      @tour.save

      @tour = Tour.find(params[:tour_id])

        # booking_db = Booking.order("created_at ASC").find(params[:tour_id])
      booking_db = Booking.all.sort_by {|booking| booking.created_at }
      booking_db.each do |booking|
          if booking.seats_booked <= @tour.seats && booking.status == 0
            @tour.seats = @tour.seats - booking.seats_booked
            booking.status = 1
            booking.save
            @tour.save
            WaitListConfirmationMailer.notify_user(booking.customer).deliver_now
          end
        end

    end

    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.fetch(:booking).permit(:customer_id,:tour_id,:seats_booked,:preference)
    end
end
