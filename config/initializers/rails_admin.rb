RailsAdmin.config do |config|

  ### Popular gems integration

  authenticate_or_request_with_http_basic('Login required') do |username, password|
    username == ENV['ts_admin_username'] &&
    password == ENV['ts_admin_password']
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
