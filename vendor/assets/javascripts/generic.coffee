class @Theme
  @colors: { darkGreen: "#779148", red: "#C75D5D", green: "#96c877", blue: "#6e97aa", orange: "#ff9f01", gray: "#6B787F", lightBlue: "#D4E5DE"}

$ ->

  $('.icheck').iCheck
    checkboxClass: 'icheckbox_flat-aero'
    radioClass: 'iradio_flat-aero'

  $.uniform.defaults.fileButtonHtml = '+'
  $.uniform.defaults.selectAutoWidth = false

  #top sidebar (secondary) sparkline
  $(".sparkline").each ->

    color  = $(@).attr("data-color") || "red"
    height = "18px"

    if $(@).hasClass("big")
      barWidth = "5px"
      barSpacing = "2px"
      height = "30px"

    $(@).sparkline("html", {type: "bar", barColor: Theme.colors[color], height: height, barWidth: barWidth, barSpacing: barSpacing, zeroAxis: false})

  #tooltips
  $('.tip, [rel=tooltip]').tooltip(gravity: 'n', fade: true, html:true)

  #used for progressbars, setting their width to the specific width set by data-percent attr
  $("[data-percent]").each -> $(@).css(width: "#{$(@).attr("data-percent")}%")

  #activate the datepicker
  $('.datepicker').datepicker
    todayBtn: true

  #tag inputs
  $('.tags').tagsInput(width:'100%');

  #validation engine
  $("form.validatable").validationEngine
    promptPosition: "topLeft",

  #initializing the select2 plugin for select boxes
  $(".chzn-select").select2()

  $('.textarea-html5').wysihtml5
    "font-styles": true
    "emphasis": true
    "lists": true
    "html": false
    "link": true
    "image": true
    "color": false
    stylesheets: false


  $.extend( $.fn.dataTableExt.oStdClasses,
    "sWrapper": "dataTables_wrapper form-inline")

  #initialize the data tables
  $(".dTable").dataTable(
    bJQueryUI: false
    bAutoWidth: false
    sPaginationType: "full_numbers"
    sDom: "<\"table-header\"fl>t<\"table-footer\"ip>"
  )

  $(".dTable-small").dataTable(
    iDisplayLength: 5
    bJQueryUI: false
    bAutoWidth: false
    sPaginationType: "full_numbers"
    sDom: "<\"table-header\"fl>t<\"table-footer\"ip>"
  )

  #uniform js (only file fields) - note: for dataTables to work, it needs to happen after
  $("select.uniform, input:file, .dataTables_length select").uniform()

  #example for the animated progressbars - don't use in production
  $(".core-animate-bars .box-toolbar a").click (e) ->
    e.preventDefault()
    $(@).closest(".core-animate-bars").find(".progress .tip").each ->
      randomNumber = Math.floor(Math.random() * 80) + 20
      percent = "#{randomNumber}%"
      $(@).attr("title", percent).attr("data-percent", randomNumber).attr("data-original-title", percent).css(width: percent)

  #creating a normal jquery ui slider
  $(".normal-slider").slider()

  #creating some ranged ui sliders - don't use in production
  #this example uses a custom RangedUi class which is built upon the html structure proposed in the theme for the sliders.
  # feel free to modify if you have a different structure
  $(".ranged-slider-ui.normal").slider
    range: true
    min: 0
    max: 300
    values: [40, 250]

  $(".ranged-slider-ui.only-min").slider
    range: "min"
    min: 0
    max: 300
    value: 40

  $(".ranged-slider-ui.only-max").slider
    range: "max"
    min: 0
    max: 300
    value: 240

  $(".ranged-slider-ui.step").slider
    range: "min"
    min: 20
    max: 120
    value: 40
    step: 20
    slide: (event,ui) ->
      $(".upload-max-size").html("#{ui.value} MB")

  $(".ranged-slider-ui.vertical-bars span").each ->
    val = parseInt($(@).text(), 10)
    $(@).empty().slider
      value: val
      range: "min",
      animate: true,
      orientation: "vertical"

  #initialize ibuttons
  $(".iButton-icons").iButton
    labelOn: "<i class='icon-ok'></i>"
    labelOff: "<i class='icon-remove'></i>"
    handleWidth: 30

  $(".iButton-enabled").iButton
    labelOn: "ENABLED"
    labelOff: "DISABLED"
    handleWidth: 30

  $(".iButton").iButton()

  #there's a problem with invisible-first ibuttons, in tabbable bootstrap, the size isnt calculated right, so we treat them differently
  $(".iButton-icons-tab").each ->
    if $(@).is(":visible")
      $(@).iButton
        labelOn: "<i class='icon-ok'></i>"
        labelOff: "<i class='icon-remove'></i>"
        handleWidth: 30

  $('[data-toggle="tab"]').on 'shown', (e) ->
    id = $(e.target).attr("href")

    $(id).find(".iButton-icons-tab").iButton
      labelOn: "<i class='icon-ok'></i>"
      labelOff: "<i class='icon-remove'></i>"
      handleWidth: 30



  #initialize photo gallery
  $('#thumbs a').touchTouch();

  $(".toggle-primary-sidebar").click (e) ->
    #this is very important if you have sparkline graphs that are in a container with display:none. when the container is visible we're calling this:
    $.sparkline_display_visible()

