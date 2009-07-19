ActionController::Routing::Routes.draw do |map|
  map.root({
    :controller => 'campgrounds',
    :action => 'index'
  }) 
  map.login 'login', :controller => "admin", :action => "login"
  map.login 'logout', :controller => "admin", :action => "logout" 
  map.resources :reservations
  map.resources :campsites
  map.resources :campgrounds
  map.index_campsite('/campgrounds/:campground_name/campsites/', {
          :controller => 'campsites',
          :action => 'index',
          :conditions => {:method=>:get}
    })
  map.resources :campgrounds, :has_many => [:reservations, :campsites]
  map.list_reservations '/campgrounds/:campground_id/reservations/start/:s_year/:s_month/:s_day/end/:e_year/:e_month/:e_day/', :controller => 'reservations', :action => 'index'
  map.new_reservation '/campsite/:campsite_id/reservation/new/start/:s_year/:s_month/:s_day/end/:e_year/:e_month/:e_day/', :controller => 'reservations', :action => 'new', :conditions => {:method => :post}

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
