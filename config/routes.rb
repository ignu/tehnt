ActionController::Routing::Routes.draw do |map|
  map.root({
    :controller => 'campgrounds',
    :action => 'list'
  }) 
  map.resources :reservation
  map.resources :campsites
  map.index_campsite('/campgrounds/:campground_name/campsites/', {
          :controller => 'campsites',
          :action => 'index',
          :conditions => {:method=>:get}
    })
  map.resources :campgrounds, :has_many => [:reservations, :campsites]

  map.list_reservations '/campgrounds/:campground_id/reservations/:year/:month/:day/', :controller => 'reservations', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
