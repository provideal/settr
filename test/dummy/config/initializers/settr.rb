
Settr.setup do |config|
  # access the setting metadata resourceish
  config.resources      = true

  # these change the generated settings editor view code
  config.header_tag     = 'h1'
  config.header_class   = 'my_header_class'
  config.table_class    = 'my_table_class'
  config.link_class     = 'my_link_class'
  config.form_class     = 'my_form_class'

  # Here, you define the available settings. Upon first encounter, they're
  # created in the database and the once-saved value is used, changing the
  # default later doesn't change anything.
  # To actually change the settings once the app is running, use the provided
  # settings editor view
  config.defaults do |setting|
    setting.collection1.group1.price 1.0
    setting.collection1.bool true
    setting.collection1.group1.number 1
    setting.collection1.group2.string 'lorem ipsum'
    setting.collection1.group2.text 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', typ: 'text'
    setting.collection2.group3.select 'first_option', options: ['first_option', 'second_option', 'third_option']
  end
end