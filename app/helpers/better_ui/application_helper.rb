module BetterUi
  module ApplicationHelper
    # Metodi helper per i componenti UI semplici
    
    # Button component
    def better_ui_button(text, options = {})
      options = BetterUi.configuration.button_defaults.deep_merge(options)
      type = options.delete(:type) || 'primary'
      css_class = "better-ui-button better-ui-button-#{type}"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      button_tag(text, **options.merge(class: css_class))
    end
    
    # Alert component
    def better_ui_alert(message, options = {})
      options = BetterUi.configuration.alert_defaults.deep_merge(options)
      type = options.delete(:type) || 'info'
      css_class = "better-ui-alert better-ui-alert-#{type}"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class) do
        concat content_tag(:div, message, class: 'better-ui-alert-message')
        if options[:dismissible]
          concat content_tag(:button, 'x', class: 'better-ui-alert-close')
        end
      end
    end
    
    # Card component
    def better_ui_card(options = {}, &block)
      options = BetterUi.configuration.card_defaults.deep_merge(options)
      css_class = "better-ui-card"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, **options, &block)
    end
    
    # Card header
    def better_ui_card_header(title, options = {})
      css_class = "better-ui-card-header"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class) do
        content_tag(:h3, title, class: 'better-ui-card-title')
      end
    end
    
    # Card body
    def better_ui_card_body(options = {}, &block)
      css_class = "better-ui-card-body"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, **options, &block)
    end
    
    # Card footer
    def better_ui_card_footer(options = {}, &block)
      css_class = "better-ui-card-footer"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, **options, &block)
    end
    
    # Tabs component
    def better_ui_tabs(options = {}, &block)
      options = BetterUi.configuration.tabs_defaults.deep_merge(options)
      css_class = "better-ui-tabs"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, **options, &block)
    end
    
    # Tab list
    def better_ui_tab_list(options = {}, &block)
      css_class = "better-ui-tab-list"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, role: 'tablist', **options, &block)
    end
    
    # Tab item
    def better_ui_tab_item(text, target, options = {})
      active = options.delete(:active) || false
      css_class = "better-ui-tab-item"
      css_class += " better-ui-tab-active" if active
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:button, text, {
        class: css_class,
        role: 'tab',
        'aria-selected': active,
        'data-target': target,
      }.merge(options))
    end
    
    # Tab content
    def better_ui_tab_content(options = {}, &block)
      css_class = "better-ui-tab-content"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, role: 'tabpanel', **options, &block)
    end
    
    # Modal component
    def better_ui_modal(id, options = {}, &block)
      css_class = "better-ui-modal"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, id: id, class: css_class) do
        concat content_tag(:div, '', class: 'better-ui-modal-background')
        concat content_tag(:div, class: 'better-ui-modal-dialog', &block)
      end
    end
    
    # Modal header
    def better_ui_modal_header(title, options = {})
      css_class = "better-ui-modal-header"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class) do
        concat content_tag(:h5, title, class: 'better-ui-modal-title')
        concat content_tag(:button, '×', type: 'button', class: 'better-ui-modal-close')
      end
    end
    
    # Modal body
    def better_ui_modal_body(options = {}, &block)
      css_class = "better-ui-modal-body"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, **options, &block)
    end
    
    # Modal footer
    def better_ui_modal_footer(options = {}, &block)
      css_class = "better-ui-modal-footer"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      content_tag(:div, class: css_class, **options, &block)
    end
    
    # Trigger button for modal
    def better_ui_modal_trigger(text, modal_id, options = {})
      options = BetterUi.configuration.button_defaults.deep_merge(options)
      type = options.delete(:type) || 'primary'
      css_class = "better-ui-button better-ui-button-#{type}"
      css_class += " #{options.delete(:class)}" if options[:class]
      
      button_tag(text, **options.merge(
        class: css_class,
        type: 'button',
        onclick: "document.getElementById('#{modal_id}').style.display='flex'"
      ))
    end
    
    # Render markdown
    def better_ui_markdown(text)
      return '' if text.blank?
      
      renderer = Redcarpet::Render::HTML.new(
        filter_html: false,
        hard_wrap: true,
        link_attributes: { target: '_blank', rel: 'noopener noreferrer' }
      )
      
      markdown = Redcarpet::Markdown.new(
        renderer,
        autolink: true,
        tables: true,
        fenced_code_blocks: true,
        strikethrough: true,
        superscript: true,
        underline: true,
        highlight: true,
        quote: true,
        footnotes: true
      )
      
      markdown.render(text).html_safe
    end
  end
end
