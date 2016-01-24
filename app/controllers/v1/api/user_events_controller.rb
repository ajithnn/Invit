class V1::Api::UserEventsController < ApplicationController
  before_filter :override_session_if_token

  resource_description do
      short 'UserEvents related Apis'
  end
  
  api :GET, "/user_events.json", "Return Admin control details."
  param :token, String, :desc => "A valid User Token." 
  param :role_id, :number, :desc => "1 - Invitor, 2 - Invitee. Filter only such events"
  description "Returns Json object with details of the admin for the id given."
  formats ['json']
  example " 
    GET v1/api/user_events.json?token=asd123SXD123YJHH
    {
      id:1,
      events:[
      {
        id:1,
        event_date: 2016-04-20 09:45:00 +5:30,
        event_location_name: 'Basavanagudi Bangalore',
        event_location_marker: '12.07778 72.89000',
        event_invite_img: '/public/images/1.jpg',
        event_message: 'You are cordially invited to',
        event_users: [
          {
            id:1,
            name:'Ajith',
            email:'ajithnn20@gmail.com',
            user_message: 'Please do come.'
          },
          {
            id:2,
            name:'Ramya',
            email:'ramyaraghuiyengar@gmail.com',
            user_message: 'Please do come.'
          }
        ]
      },
      {
        id:1,
        event_date: 2016-04-20 09:45:00 +5:30,
        event_location_name: 'Basavanagudi Bangalore',
        event_location_marker: '12.07778 72.89000',
        event_invite_img: '/public/images/1.jpg',
        event_message: 'You are cordially invited to',
        event_users: [
          {
            id:1,
            name:'Ajith',
            email:'ajithnn20@gmail.com',
            user_message: 'Please do come.'
          },
          {
            id:2,
            name:'Ramya',
            email:'ramyaraghuiyengar@gmail.com',
            user_message: 'Please do come.'
          }
        ]
      }
      ]
    }
  "

  def show
    events = UserEvent.where({:user_id => current_user.id})
    if params[:role_id]
      events = events.where({:role_id => params[:role_id]})
    end
    user_resp = build_event_resp(events.pluck(:event_id))
    render :json => {:id => current_user.id, :events => user_resp }
  end

  def index
  end
  
  private
  def build_event_resp(event_ids)
    ret = []
    events = Event.where({:id => event_ids})
    ret = events.map do |ev|
      {
        :id => ev.id,
        :event_date => ev.event_date,
        :event_location_name => ev.location_name,
        :event_location_marker => ev.location_marker,
        :event_invite_img => ev.event_img,
        :event_message => 'You are cordially invited to',
      }
    end
    ret
  end

end
