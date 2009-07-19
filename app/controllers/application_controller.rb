# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password   
  
  def list_errors(errors, skip_attrib = false)
    error_message = "<ul>"
    if skip_attrib
      errors.each do |attribute, message|
        error_message << "<li>#{message}</li>"
      end
    else
      errors.each do |attribute, message|
        # if message starts w/ upper case, suppress prefix. this gives us better control
        # over default rails activerecord error messages
        # inspired by http://henrik.nyh.se/2007/12/full-error-messages-without-prepended-attribute-name
        prefix = (attribute == "base" || message =~ /[[:upper:]]/) ? "" : attribute.humanize + ' '
        error_message << "<li>#{prefix}#{message}</li>"
      end
    end
    error_message << "</ul>"
  end
  
  protected
    def get_start_date
      logger.info "#{params[:s_year]}, #{params[:s_month]}, #{params[:s_day]}"
      @start_date = "#{params[:s_year]}-#{params[:s_month]}-#{params[:s_day]}".to_date
      logger.info "Start date = #{@start_date}"
       # Date.new(params[:s_year], params[:s_month], params[:s_day])   
    end
  
    def get_end_date 
      logger.info "#{params[:e_year]}, #{params[:e_month]}, #{params[:e_day]}"
      @end_date = "#{params[:e_year]}-#{params[:e_month]}-#{params[:e_day]}".to_date
      logger.info "End date = #{@end_date}"
      # @end_date = Date.new(params[:e_year], params[:e_month], params[:e_day])   
    end
  
end
