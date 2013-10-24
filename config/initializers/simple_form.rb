# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  #  config.wrappers :bootstrap, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.use :label
  #   b.wrapper :tag => 'div', :class => 'controls' do |ba|
  #     ba.use :input
  #     ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
  #     ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
  #   end
  # end

  # config.wrappers :prepend, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.use :label
  #   b.wrapper :tag => 'div', :class => 'controls' do |input|
  #     input.wrapper :tag => 'div', :class => 'input-prepend' do |prepend|
  #       prepend.use :input
  #     end
  #     input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
  #     input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
  #   end
  # end

  # config.wrappers :append, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.use :label
  #   b.wrapper :tag => 'div', :class => 'controls' do |input|
  #     input.wrapper :tag => 'div', :class => 'input-append' do |append|
  #       append.use :input
  #     end
  #     input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
  #     input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
  #   end
  # end
  config.wrappers :placeholder, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|

    config.boolean_style = :inline

    b.use :html5
    b.use :placeholder
    b.wrapper :tag => 'div', :class => 'form-group ' do |input|
      input.wrapper :tag => 'div', :class => 'col-lg-12' do |append|
        append.use :input
      end
      input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
      input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end

    b.wrapper :button do |component|
      component.optional :button,  wrap_with: { :tag => 'div', :class =>"btn btn-blue" }
    end

  end

  config.wrappers :default, :tag => 'div', :class => "control-group", :error_class => 'error' do |b|

    config.boolean_style = :inline

    b.use :html5
    b.use :placeholder
    b.wrapper :tag => 'div', :class => 'form-group ' do |input|
      input.use :label, :class => 'control-label col-lg-3'
      input.wrapper :tag => 'div', :class => 'col-lg-9' do |append|
        append.use :input
      end
      input.use :hint,  :wrap_with => { :tag => 'span', :class => 'help-block' }
      input.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end

    b.wrapper :button do |component|
      component.optional :button,  wrap_with: { :tag => 'div', :class =>"btn btn-blue" }
    end

  end



  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default

  # Define the way to render check boxes / radio buttons with labels.
  # Defaults to :nested for bootstrap config.
  #   :inline => input + label
  #   :nested => label > input
  config.boolean_style = :inline

  # Default class for buttons
  config.button_class = 'btn btn-blue'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # Use :to_sentence to list all errors for each field.
  # config.error_method = :first

  # Default tag used for error notification helper.
  config.error_notification_tag = :div

  # CSS class to add for error notification helper.
  config.error_notification_class = 'alert alert-error'

  # ID to add for error notification helper.
  # config.error_notification_id = nil

  # Series of attempts to detect a default label method for collection.
  # config.collection_label_methods = [ :to_label, :name, :title, :to_s ]

  # Series of attempts to detect a default value method for collection.
  # config.collection_value_methods = [ :id, :to_s ]

  # You can wrap a collection of radio/check boxes in a pre-defined tag, defaulting to none.
  # config.collection_wrapper_tag = nil

  # You can define the class to use on all collection wrappers. Defaulting to none.
  # config.collection_wrapper_class = nil

  # You can wrap each item in a collection of radio/check boxes with a tag,
  # defaulting to :span. Please note that when using :boolean_style = :nested,
  # SimpleForm will force this option to be a label.
  # config.item_wrapper_tag = :span

  # You can define a class to use in all item wrappers. Defaulting to none.
  # config.item_wrapper_class = nil

  # How the label text should be generated altogether with the required text.
  # config.label_text = lambda { |label, required| "#{required} #{label}" }

  # You can define the class to use on all labels. Default is nil.
  config.label_class = 'control-label'

  # You can define the class to use on all forms. Default is simple_form.
  config.form_class = 'form-horizontal fill-up validateable'

  # You can define which elements should obtain additional classes
  # config.generate_additional_classes_for = [:wrapper, :label, :input]

  # Whether attributes are required by default (or not). Default is true.
  # config.required_by_default = true

  # Tell browsers whether to use default HTML5 validations (novalidate option).
  # Default is enabled.
  config.browser_validations = false

  # Collection of methods to detect if a file type was given.
  # config.file_methods = [ :mounted_as, :file?, :public_filename ]

  # Custom mappings for input types. This should be a hash containing a regexp
  # to match as key, and the input type that will be used when the field name
  # matches the regexp as value.
  # config.input_mappings = { /count/ => :integer }

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  # config.wrapper_mappings = { :string => :prepend }

  # Default priority for time_zone inputs.
  # config.time_zone_priority = nil

  # Default priority for country inputs.
  # config.country_priority = nil

  # Default size for text inputs.
  # config.default_input_size = 50

  # When false, do not use translations for labels.
  # config.translate_labels = true

  # Automatically discover new inputs in Rails' autoload path.
  # config.inputs_discovery = true

  # Cache SimpleForm inputs discovery
  # config.cache_discovery = !Rails.env.development?
end
