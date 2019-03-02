# README

## Link to the depolyed app:

https://tranquil-cove-49961.herokuapp.com

## Default Credentials:

## Admin

Email: admin@ncsu.edu

Password: 12345678

## Agent

Email: agent@ncsu.edu

Password: 12345678

## Customer

Email: customer@ncsu.edu

Password: 12345678

## ABOUT

In this application there are three different types of users in the system:

# ADMIN
The Admin is pre-configured with the credentials mentioned above.

The admin account cannot be deleted. The admin will be able to login with the credentials and edit its profile information.

To view the customer details or the agent details the admin must follow the following steps after login:

**Login --> View All Customers**

**Login --> View All Agents**

The admin can view the tours and carry out all the functionalities of the admin as well as the agent. The admin can book tours, bookmark a tour and also destroy a tour which is created by any agent. All of these functionalities can be performed when clicked on *View All Tours*.

**Login --> View All Tours**

The admin can also create a new agent and a new customer by by going on the links *New Agent* and *New Customer*.

# CUSTOMER
Anyone can sign up as a customer using an email and password. A customer can in the later stage edit its profile information too. They can perform the following tasks after signing up:


### Booking

A customer can book only those tours which are *In Future*. The tours which are *Cancelled* or *Completed* cannot be booked. 

A user can also search a tour through **Login --> View All Tours --> Search Tours** 

The tours can be searched based on **Itinerary, Date Range, Price Range** and **Tour Name**. 

The booking task can be performed through **Login --> View All Tours --> Book**

There are three different conditions that are specified while booking seats in a particular tour:

1. Book available seats (Only available seats will be booked and remaining seats would be dropped)

2. Book Available seats and add remaining to waitlist (Available seats will be booked and remaining seats would be added to waitlist)

3. Book only if all seats are available (If specified seats are not available all the seats would be added to waitlist)

The preference of the booking can be set according to the above conditions. 

A customer can also cancel seats of a tour which they have booked. This cancellation can be performed in two ways:

*1) Cancel entire booking*

*2) Cancel seats* This option can be used to update a booking. A *partial cancellation* on the seats can be performed through this option. 

The admin as well as an agent can see the *customer details* of all the people who have *booked* a tour through the following: **Login --> View All Tours/ Show Tours --> Booked customer**


### Bookmark

A customer can bookmark only those tours which are *In Future*. The tours which are *Cancelled* or *Completed* cannot be bookmarked.

The bookmarking task can be performed through **Login --> View All Tours --> Bookmark**

These bookmarked tours can be viewed by both, *Agent* as well as the *Admin*.

The admin as well as an agent can see the *customer details* of all the people who have *bookmarked* a tour through the following: **Login --> View All Tours/ Show Tours --> Bookmarked customer**


### Review

A customer can review only those tours which are *Completed*. The tours which are *Cancelled* or *In Future* cannot be reviewed.

The bookmarking task can be performed through **Login --> View Bookings --> Write Review**

Them review written by a customer can be viewed by an *Agent* as well as an *Admin*. But only the *Customer* and the *Admin* can destroy a review.


# AGENT

Anyone can sign up as an agent using an email and password. An agent can in the later stage edit its profile information too. They can perform the following tasks after signing up:


### Tours

An agent can create a tour which can later be booked by a customer. These tours can be viewed and edited by an agent. The tour can be created through **Login --> Add Tours**. These tours can be edited and even destroyed by an Agent.  

While adding a tour, *Image Uploading* for a tour is also possible. The tours once added can be searched and later booked by a customer. The agent can also make the needful changes on a tour.


## Testing

Testing has been performed on the *Agent* module successfully.



# Extra Credits

The following task has also been performed which is a part of extra credit:

**Send an email when the status of the customer moves from waitlist to booked.**

When a customer has his/her own booking, they can cancel the booking based on their preference. During this process, if another customer which was added in the *waitlist* of the same tour, will be added to the booking list upon successful cancellation of the previous user. If the user gets a booking, i.e, the booking is moved from a *waitlist* to *confirmed* status, then an email will be sent to the customer to the ID with which the customer initially signed up with.

The email will be sent from **rubyminers.tms@gmail.com**.



