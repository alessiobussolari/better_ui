# BetterUI API Documentation

## General Components

### bui_accordion
**Default Signature:** `bui_accordion(multiple: false, theme: :default, variant: :bordered, size: :md, **html_options)`

**Parameters:**
- `multiple`: Boolean - Allow multiple panels open simultaneously
- `theme`: Symbol - Color theme (`:default`, `:white`, `:blue`, `:red`, `:green`, `:yellow`, `:violet`, `:orange`, `:rose`)
- `variant`: Symbol - Style variant (`:minimal`, `:bordered`, `:separated`)
- `size`: Symbol - Component size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `**html_options`: Hash - Additional HTML attributes

### bui_alert
**Default Signature:** `bui_alert(title: nil, message: nil, theme: :white, icon: nil, icon_position: :left, dismissible: false, rounded: :md, importance: :md, html_content: false, classes: nil, **html_options)`

**Parameters:**
- `title`: String - Alert title
- `message`: String - Alert message
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `icon`: String - Icon name (optional)
- `icon_position`: Symbol - Icon position (`:left`, `:right`)
- `dismissible`: Boolean - Show close button
- `rounded`: Symbol - Border radius (`:none`, `:sm`, `:md`, `:lg`, `:full`)
- `importance`: Symbol - Importance level (`:high`, `:md`, `:low`)
- `html_content`: Boolean - Allow HTML content in message
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_avatar
**Default Signature:** `bui_avatar(name: nil, src: nil, size: :md, shape: :circle, status: nil, status_position: :bottom_right, theme: :white, style: :filled, classes: nil, id: nil, **html_options)`

**Parameters:**
- `name`: String - Name for initials (if no `src`)
- `src`: String - URL of avatar image
- `size`: Symbol - Avatar size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `shape`: Symbol - Avatar shape (`:circle`, `:square`, `:rounded`)
- `status`: Symbol - Online status indicator (`:online`, `:offline`, `:busy`, `:away`)
- `status_position`: Symbol - Status indicator position (`:bottom_right`, `:bottom_left`, `:top_right`, `:top_left`)
- `theme`: Symbol - Color theme for placeholder (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `style`: Symbol - Avatar style (`:filled`, `:outline`, `:light`)
- `classes`: String - Additional CSS classes
- `id`: String - HTML element ID
- `**html_options`: Hash - Additional HTML attributes

### bui_badge
**Default Signature:** `bui_badge(label: nil, theme: :default, size: :md, shape: :rounded, style: :filled, variant: nil, icon: nil, icon_position: :left, classes: nil, id: nil, **html_options)`

**Parameters:**
- `label`: String - Badge text
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`, `:gray`)
- `size`: Symbol - Badge size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `shape`: Symbol - Badge shape (`:square`, `:rounded`)
- `style`: Symbol - Badge style (`:filled`, `:outline`)
- `variant`: Symbol, nil - Badge variant (`:notification`, `:counter`, `:dot`, `nil`)
- `icon`: String - Icon name (optional)
- `icon_position`: Symbol - Icon position (`:left`, `:right`)
- `classes`: String - Additional CSS classes
- `id`: String - HTML element ID
- `**html_options`: Hash - Additional HTML attributes

### bui_breadcrumb
**Default Signature:** `bui_breadcrumb(items: [], separator: :chevron, theme: :white, size: :md, classes: nil, **html_options)`

**Parameters:**
- `items`: Array - Breadcrumb items (e.g., `[{label: 'Home', url: '/'}, {label: 'About'}]`)
- `separator`: Symbol - Separator symbol (`:slash`, `:chevron`, `:arrow`, `:dot`, `:pipe`), default `:chevron`
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Breadcrumb size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_button
**Default Signature:** `bui_button(text: nil, theme: :white, size: :md, full_width: false, disabled: false, icon: nil, icon_position: :left, href: nil, method: nil, data: {}, classes: nil, id: nil, rounded: :md, button_type: :button, **html_options)`

**Parameters:**
- `text`: String - Button text
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Button size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `full_width`: Boolean - Full width button
- `disabled`: Boolean - Disabled state
- `icon`: String - Icon name (optional)
- `icon_position`: Symbol - Icon position (`:left`, `:right`)
- `href`: String - Link URL (creates anchor tag)
- `method`: Symbol - HTTP method for link (e.g., `:post`, `:delete`)
- `data`: Hash - Data attributes
- `classes`: String - Additional CSS classes
- `id`: String - Element ID
- `rounded`: Symbol - Border radius (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `button_type`: Symbol - Button type (`:button`, `:submit`, `:reset`)
- `**html_options`: Hash - Additional HTML attributes

### bui_container
**Default Signature:** `bui_container(html_content: nil, fluid: false, size: :lg, padding: :md, theme: :white, border: false, **html_options)`

**Parameters:**
- `html_content`: String - HTML content (optional)
- `fluid`: Boolean - Full width container
- `size`: Symbol - Container size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:fluid`), default `:lg`
- `padding`: Symbol - Internal padding (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `border`: Boolean - Show border
- `**html_options`: Hash - Additional HTML attributes

### bui_divider
**Default Signature:** `bui_divider(theme: :white, orientation: :horizontal, style: :solid, size: :md, label: nil, height: nil, classes: nil, **html_options)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `orientation`: Symbol - Orientation (`:horizontal`, `:vertical`)
- `style`: Symbol - Line style (`:solid`, `:dashed`, `:dotted`, `:double`)
- `size`: Symbol - Divider thickness (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `label`: String - Text label (optional, only for horizontal)
- `height`: String - Height for vertical divider (e.g., "100px")
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_dropdown
**Default Signature:** `bui_dropdown(trigger:, position: :bottom, theme: :default, size: :md, rounded: :md, animation: :fade, fullwidth: false, show_chevron: true, selectable: false, classes: nil, **html_options)`

**Parameters:**
- `trigger`: String - HTML content for the dropdown trigger
- `position`: Symbol - Dropdown menu position (`:bottom`, `:top`, `:left`, `:right`)
- `theme`: Symbol - Color theme for trigger (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Trigger size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `animation`: Symbol - Animation type (`:fade`, `:slide`, `:none`)
- `fullwidth`: Boolean - Make trigger full width
- `show_chevron`: Boolean - Show chevron icon on trigger
- `selectable`: Boolean - Enable selectable items (for single/multi-select behavior)
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_field
**Default Signature:** `bui_field(text:, name:, required: false, error: nil, help_text: nil, id: nil)`

**Parameters:**
- `text`: String - Label text for the field
- `name`: String - Name attribute for the input
- `required`: Boolean - Show required indicator
- `error`: String - Error message
- `help_text`: String - Help text
- `id`: String - HTML ID for the label's `for` attribute

### bui_grid
**Default Signature:** `bui_grid(cols: {sm: 1}, gap: {sm: :md}, rows: nil, started: nil, ended: nil, row_started: nil, row_ended: nil, mx: nil, my: {sm: 4}, theme: :default, padding: :none, rounded: :none, justify: :start, align: :start, **html_options)`

**Parameters:**
- `cols`: Hash - Responsive columns configuration (e.g., `{sm: 1, md: 2, lg: 3}`)
- `gap`: Hash - Responsive gap configuration (e.g., `{sm: :md, lg: :lg}`)
- `rows`: Hash - Responsive rows configuration (optional)
- `started`: Hash - Grid column start position (optional)
- `ended`: Hash - Grid column end position (optional)
- `row_started`: Hash - Grid row start position (optional)
- `row_ended`: Hash - Grid row end position (optional)
- `mx`: Hash - Responsive horizontal margin (optional)
- `my`: Hash - Responsive vertical margin (optional)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `padding`: Symbol - Internal padding (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `justify`: Symbol - Horizontal alignment (`:start`, `:center`, `:end`, `:stretch`)
- `align`: Symbol - Vertical alignment (`:start`, `:center`, `:end`, `:stretch`)
- `**html_options`: Hash - Additional HTML attributes

### bui_heading
**Default Signature:** `bui_heading( '' ,level: 2, theme: :default, align: :left, size: :md, style: :normal, icon: nil, subtitle: nil, with_divider: false, **html_options)`

**Parameters:**
- `level`: Integer - Heading level (1-6)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `align`: Symbol - Text alignment (`:left`, `:center`, `:right`)
- `size`: Symbol - Heading size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `style`: Symbol - Font style (`:normal`, `:bold`, `:italic`, `:underline`)
- `icon`: String - Icon name (optional)
- `subtitle`: String - Subtitle text (optional)
- `with_divider`: Boolean - Show divider below heading
- `**html_options`: Hash - Additional HTML attributes

### bui_icon
**Default Signature:** `bui_icon(name:, style: :solid, size: :md, theme: :default, spin: false, pulse: false, border: false, fixed_width: false, rotation: nil, flip: nil, classes: nil, id: nil, href: nil, method: nil, target: nil, **html_options)`

**Parameters:**
- `name`: String - Icon name (required)
- `style`: Symbol - Icon style (`:solid`, `:regular`, `:brands`)
- `size`: Symbol - Icon size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `spin`: Boolean - Continuous rotation animation
- `pulse`: Boolean - Pulse animation
- `border`: Boolean - Show border around icon
- `fixed_width`: Boolean - Fixed width for alignment
- `rotation`: Integer - Rotation in degrees (0, 90, 180, 270)
- `flip`: Symbol - Flip type (`:horizontal`, `:vertical`, `:both`)
- `classes`: String - Additional CSS classes
- `id`: String - HTML ID
- `href`: String - URL for the icon (makes it a link)
- `method`: Symbol - HTTP method for link (e.g., `:post`, `:delete`)
- `target`: String - Link target (e.g., `_blank`)
- `**html_options`: Hash - Additional HTML attributes

### bui_input_checkbox
**Default Signature:** `bui_input_checkbox(name:, value: "1", checked: false, required: false, disabled: false, indeterminate: false, label: nil, label_position: :right, theme: :default, size: :md, rounded: :md, classes: '', form: nil, **options)`

**Parameters:**
- `name`: String - Checkbox name (required)
- `value`: String - Checkbox value
- `checked`: Boolean - Checked state
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `indeterminate`: Boolean - Indeterminate state (requires Stimulus controller)
- `label`: String, nil - Label text
- `label_position`: Symbol - Label position (`:left`, `:right`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Checkbox size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `classes`: String - Additional CSS classes
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `**options`: Hash - Additional HTML attributes

### bui_input_pin
**Default Signature:** `bui_input_pin(name:, value: '', length: 6, placeholder: '•', required: false, disabled: false, theme: :default, size: :md, rounded: :md, form: nil, classes: '', **options)`

**Parameters:**
- `name`: String - Pin input name (required)
- `value`: String - Initial value
- `length`: Integer - Number of pin digits (4-8)
- `placeholder`: String - Placeholder character
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Pin input size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_radio
**Default Signature:** `bui_input_radio(name:, value:, checked: false, required: false, disabled: false, label: nil, label_position: :right, theme: :default, size: :md, rounded: :full, classes: '', form: nil, **options)`

**Parameters:**
- `name`: String - Radio name (required)
- `value`: String - Radio value (required)
- `checked`: Boolean - Checked state
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `label`: String, nil - Label text
- `label_position`: Symbol - Label position (`:left`, `:right`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Radio size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `classes`: String - Additional CSS classes
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `**options`: Hash - Additional HTML attributes

### bui_input_rating
**Default Signature:** `bui_input_rating(name: nil, value: 0, max_stars: 5, readonly: false, half_stars: true, theme: :default, size: :md, show_value: false, form: nil, classes: '', **options)`

**Parameters:**
- `name`: String, nil - Rating name (required if not readonly)
- `value`: Float, Integer - Current rating value (0.0 - max_stars)
- `max_stars`: Integer - Maximum number of stars (default: 5)
- `readonly`: Boolean - Readonly state
- `half_stars`: Boolean - Support half stars
- `theme`: Symbol - Color theme (`:default`, `:yellow`, `:orange`, `:red`, `:pink`, `:purple`, `:blue`, `:green`, `:gray`)
- `size`: Symbol - Rating size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `show_value`: Boolean - Show numeric value next to stars
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_select
**Default Signature:** `bui_input_select(name:, options:, selected: nil, required: false, disabled: false, multiple: false, searchable: true, theme: :default, size: :md, rounded: :md, placeholder: nil, search_placeholder: nil, max_height: "300px", form: nil, classes: '', **html_options)`

**Parameters:**
- `name`: String - Select name (required)
- `options`: Array<Hash> - Array of options `[{value: 'value', label: 'label'}, ...]`
- `selected`: String, Array, nil - Selected value(s)
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `multiple`: Boolean - Allow multiple selections
- `searchable`: Boolean - Enable search functionality
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Select size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `placeholder`: String - Placeholder text for the trigger
- `search_placeholder`: String - Placeholder text for the search input
- `max_height`: String - Maximum height of the dropdown (e.g., "300px")
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_input_text
**Default Signature:** `bui_input_text(name:, value: nil, placeholder: nil, required: false, disabled: false, type: :text, theme: :default, size: :md, rounded: :md, classes: '', form: nil, **options)`

**Parameters:**
- `name`: String - Input name (required)
- `value`: String - Input value
- `placeholder`: String - Placeholder text
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `type`: Symbol - Input type (`:text`, `:password`, `:email`, `:tel`, `:url`, `:number`, `:search`, `:date`, `:time`, `:datetime_local`, `:month`, `:week`, `:color`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Input size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `classes`: String - Additional CSS classes
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `**options`: Hash - Additional HTML attributes

### bui_input_textarea
**Default Signature:** `bui_input_textarea(name:, value: nil, placeholder: nil, required: false, disabled: false, rows: 3, theme: :default, size: :md, rounded: :md, classes: '', form: nil, **options)`

**Parameters:**
- `name`: String - Textarea name (required)
- `value`: String - Textarea value
- `placeholder`: String - Placeholder text
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `rows`: Integer - Number of rows
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Textarea size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `classes`: String - Additional CSS classes
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `**options`: Hash - Additional HTML attributes

### bui_input_toggle
**Default Signature:** `bui_input_toggle(name:, value: '1', checked: false, required: false, disabled: false, label: nil, label_position: :right, theme: :default, size: :md, form: nil, classes: '', **options)`

**Parameters:**
- `name`: String - Toggle name (required)
- `value`: String - Value when active
- `checked`: Boolean - Checked state
- `required`: Boolean - Required field
- `disabled`: Boolean - Disabled state
- `label`: String, nil - Label text
- `label_position`: Symbol - Label position (`:left`, `:right`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Toggle size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `form`: ActionView::Helpers::FormBuilder, nil - Rails form builder
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_link
**Default Signature:** `bui_link('', href: nil, theme: :white, orientation: :horizontal, style: :default, size: :md, icon: nil, active: false, disabled: false, data: {}, method: nil, target: nil, **html_options)`

**Parameters:**
- `label`: String - Link text (required)
- `href`: String - Destination URL (nil for plain text)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `orientation`: Symbol - Orientation (`:horizontal`, `:vertical`)
- `style`: Symbol - Style (`:default`, `:underline`, `:bold`, `:text`)
- `size`: Symbol - Link size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `icon`: String - Icon name (optional)
- `active`: Boolean - Active state
- `disabled`: Boolean - Disabled state
- `data`: Hash - Data attributes
- `method`: Symbol - HTTP method for link (for Turbo)
- `target`: String - Link target (e.g., `_blank`)
- `**html_options`: Hash - Additional HTML attributes

### bui_modal
**Default Signature:** `bui_modal(close_on_backdrop: true, close_on_escape: true, lock_scroll: true, classes: nil, **html_options)`

**Parameters:**
- `close_on_backdrop`: Boolean - Close modal when clicking backdrop
- `close_on_escape`: Boolean - Close modal with Escape key
- `lock_scroll`: Boolean - Lock body scroll when modal is open
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_pagination
**Default Signature:** `bui_pagination(current_page:, total_pages:, path:, theme: :default, size: :md, window: 2, show_info: false, per_page: nil, classes: '', **options)`

**Parameters:**
- `current_page`: Integer - Current page number (required)
- `total_pages`: Integer - Total number of pages (required)
- `path`: String - Base path for pagination links (required)
- `theme`: Symbol - Color theme (`:default`, `:blue`, `:red`, `:green`, `:yellow`, `:violet`, `:orange`, `:rose`, `:white`)
- `size`: Symbol - Pagination size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `window`: Integer - Number of pages to show around current page
- `show_info`: Boolean - Show page info (e.g., "Showing X-Y of Z results")
- `per_page`: Integer, nil - Items per page (required if `show_info` is true)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_panel
**Default Signature:** `bui_panel(title: nil, body: nil, header: nil, footer: nil, theme: :white, style: :default, padding: :md, rounded: :sm, size: :auto, **html_options)`

**Parameters:**
- `title`: String - Panel title (optional)
- `body`: String - Panel body content (optional)
- `header`: String - Custom header content (optional)
- `footer`: String - Footer content (optional)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `style`: Symbol - Panel style (`:default`, `:flat`, `:raised`, `:bordered`)
- `padding`: Symbol - Internal padding (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `size`: Symbol - Panel size (`:auto`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`)
- `**html_options`: Hash - Additional HTML attributes

### bui_progress
**Default Signature:** `bui_progress(value: 0, theme: :white, size: :md, label: false, classes: nil, **html_options)`

**Parameters:**
- `value`: Integer - Percentage of completion (0-100)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Progress bar size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `label`: Boolean - Show label with percentage
- `classes`: String - Additional CSS classes for the container
- `**html_options`: Hash - Additional HTML attributes

### bui_spinner
**Default Signature:** `bui_spinner(theme: :default, size: :md, style: :default, label: nil, **html_options)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Spinner size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `style`: Symbol - Spinner style (`:default`, `:outline`)
- `label`: String - Text label (optional)
- `**html_options`: Hash - Additional HTML attributes

### bui_table
**Default Signature:** `bui_table(data: nil, headers: nil, theme: :default, radius: :sm, size: :md, striped: false, hoverable: false, bordered: false, compact: false, minimal: false, **html_options)`

**Parameters:**
- `data`: Array - Table data (optional, for simple tables)
- `headers`: Array - Table headers (optional, for simple tables)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `radius`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `size`: Symbol - Table size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `striped`: Boolean - Striped rows
- `hoverable`: Boolean - Hover effects on rows
- `bordered`: Boolean - Table borders
- `compact`: Boolean - Compact spacing
- `minimal`: Boolean - Minimal styling
- `**html_options`: Hash - Additional HTML attributes

### bui_tabs
**Default Signature:** `bui_tabs(variant: :pills, theme: :default, size: :md, orientation: :horizontal, navigation_classes: '', panels_classes: 'mt-4', **options)`

**Parameters:**
- `variant`: Symbol - Style variant (`:pills`, `:underline`, `:bordered`, `:minimal`)
- `theme`: Symbol - Color theme (`:default`, `:blue`, `:red`, `:green`, `:yellow`, `:violet`, `:orange`, `:rose`, `:white`)
- `size`: Symbol - Tabs size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `orientation`: Symbol - Tabs orientation (`:horizontal`, `:vertical`)
- `navigation_classes`: String - Additional CSS classes for navigation
- `panels_classes`: String - Additional CSS classes for panels
- `**options`: Hash - Additional HTML attributes

### bui_tag
**Default Signature:** `bui_tag(text:, theme: :white, size: :md, style: :filled, **options)`

**Parameters:**
- `text`: String - Tag text (required)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Tag size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `style`: Symbol - Tag style (`:filled`, `:outline`)
- `**options`: Hash - Additional HTML attributes

### bui_text
**Default Signature:** `bui_text( '' , theme: :default, size: :md, align: :left, weight: :normal, style: :normal, classes: '', **html_options)`

**Parameters:**
- `text`: String - Text content (optional, if block is used)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Text size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `align`: Symbol - Text alignment (`:left`, `:center`, `:right`, `:justify`)
- `weight`: Symbol - Font weight (`:thin`, `:light`, `:normal`, `:medium`, `:semibold`, `:bold`, `:extrabold`)
- `style`: Symbol - Font style (`:normal`, `:italic`, `:underline`, `:line_through`)
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_tooltip
**Default Signature:** `bui_tooltip(text: nil, theme: :white, position: :top, size: :md, style: :filled, classes: nil, **html_options)`

**Parameters:**
- `text`: String - Tooltip text (required)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `position`: Symbol - Tooltip position (`:top`, `:right`, `:bottom`, `:left`)
- `size`: Symbol - Tooltip size (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `style`: Symbol - Tooltip style (`:filled`, `:outline`)
- `classes`: String - Additional CSS classes for the container
- `**html_options`: Hash - Additional HTML attributes

## Application Components

### bui_card
**Default Signature:** `bui_card(title:, value:, trend: nil, change: nil, color: :green, theme: :default, size: :md, rounded: :md, shadow: :sm, **html_options)`

**Parameters:**
- `title`: String - The title/label of the metric
- `value`: String - The main value to display
- `trend`: Symbol, nil - The direction of the trend (`:up`, `:down`, `nil`), default `nil`
- `change`: String, nil - The value of the change (e.g., "+12%"), default `nil`
- `color`: Symbol - The color of the trend (`:green`, `:red`, `:blue`, `:yellow`, `:purple`, `:indigo`, `:gray`), default `:green`
- `theme`: Symbol - The card theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`, `:purple`), default `:default`
- `size`: Symbol - The size of the card (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`), default `:md`
- `rounded`: Symbol - The rounding level (`:none`, `:sm`, `:md`, `:lg`, `:full`), default `:md`
- `shadow`: Symbol - The type of shadow (`:none`, `:sm`, `:md`, `:lg`), default `:sm`
- `**html_options`: Hash - Additional HTML attributes to pass to the main div

### bui_main
**Default Signature:** `bui_main(rounded: :sm, shadow: :md, sidebar: true, navbar: true, classes: nil, **html_options)`

**Parameters:**
- `rounded`: Symbol - The rounding level (`:none`, `:sm`, `:md`, `:lg`, `:xl`, `:full`), default `:sm`
- `shadow`: Symbol - The type of shadow (`:none`, `:sm`, `:md`, `:lg`, `:xl`), default `:md`
- `sidebar`: Boolean - Whether to show the sidebar, default `true`
- `navbar`: Boolean - Whether to show the navbar, default `true`
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_navbar
**Default Signature:** `bui_navbar(size: :md, theme: :default, variant: :default, shadow: :sm, border: false, actions: [], with_sidebar: false, sidebar_width: :md, action_button_theme: :default, action_icon_theme: :default, show_avatar: false, show_user_dropdown: false, show_icon_buttons: false, **html_options)`

**Parameters:**
- `size`: Symbol - Navbar size (`:sm`, `:md`, `:lg`), default `:md`
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`), default `:default`
- `variant`: Symbol - Style variant (`:default`, `:solid`, `:transparent`, `:glass`), default `:default`
- `shadow`: Symbol - Type of shadow (`:none`, `:sm`, `:md`, `:lg`), default `:sm`
- `border`: Boolean - Whether to show the bottom border, default `false`
- `actions`: Array - Array of actions/buttons on the right
- `with_sidebar`: Boolean - Whether the navbar is alongside a sidebar, default `false`
- `sidebar_width`: Symbol - Width of the adjacent sidebar (`:sm`, `:md`, `:lg`, `:xl`), default `:md`
- `action_button_theme`: Symbol - Theme for buttons in actions, default `:default`
- `action_icon_theme`: Symbol - Theme for icons in actions, default `:default`
- `show_avatar`: Boolean - Whether to show the avatar, default `false`
- `show_user_dropdown`: Boolean - Whether to show the user dropdown, default `false`
- `show_icon_buttons`: Boolean - Whether to show the icon buttons, default `false`
- `**html_options`: Hash - Additional HTML attributes

### bui_sidebar
**Default Signature:** `bui_sidebar(width: :md, position: :left, theme: :default, shadow: :lg, **html_options)`

**Parameters:**
- `width`: Symbol - Sidebar width (`:sm`, `:md`, `:lg`, `:xl`), default `:md`
- `position`: Symbol - Sidebar position (`:left`, `:right`), default `:left`
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`), default `:default`
- `shadow`: Symbol - Type of shadow (`:none`, `:sm`, `:md`, `:lg`, `:xl`), default `:lg`
- `**html_options`: Hash - Additional HTML attributes

## Universal Parameters

### Standard Color Themes
- `:default` - Default theme
- `:white` - White theme
- `:red` - Red theme
- `:rose` - Rose theme
- `:orange` - Orange theme
- `:green` - Green theme
- `:blue` - Blue theme
- `:yellow` - Yellow theme
- `:violet` - Violet theme

### Standard Sizes
- `:xxs` - Extra extra small
- `:xs` - Extra small
- `:sm` - Small
- `:md` - Medium (default)
- `:lg` - Large
- `:xl` - Extra large
- `:xxl` - Extra extra large

### Standard Variants
- `:default` - Default variant
- `:primary` - Primary variant
- `:secondary` - Secondary variant
- `:tertiary` - Tertiary variant
- `:outline` - Outline variant
- `:ghost` - Ghost variant
- `:link` - Link variant

### Border Radius Options
- `:none` - No border radius
- `:xxs` - Extra extra small radius
- `:xs` - Extra small radius
- `:sm` - Small radius
- `:md` - Medium radius
- `:lg` - Large radius
- `:xl` - Extra large radius
- `:xxl` - Extra extra large radius
- `:full` - Full radius (circle/pill)

### Common HTML Attributes
- `classes`: String - Additional CSS classes
- `id`: String - Element ID
- `data`: Hash - Data attributes
- `**options`: Hash - Additional HTML attributes
