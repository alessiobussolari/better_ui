# BetterUI API Documentation

## General Components

### bui_accordion
**Default Signature:** `bui_accordion(multiple: false, theme: :default, variant: :default, size: :md, classes: "", options: {}, &block)`

**Parameters:**
- `multiple`: Boolean - Allow multiple panels open simultaneously
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:primary`, `:secondary`, `:outline`, `:ghost`)
- `size`: Symbol - Component size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `classes`: String - Additional CSS classes
- `options`: Hash - Additional HTML attributes

### bui_alert
**Default Signature:** `bui_alert(text, theme: :default, variant: :default, size: :md, dismissible: false, classes: "", **options)`

**Parameters:**
- `text`: String - Alert message text
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:primary`, `:secondary`, `:outline`, `:ghost`)
- `size`: Symbol - Component size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `dismissible`: Boolean - Show close button
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_avatar
**Default Signature:** `bui_avatar(name = nil, src: nil, shape: :circle, size: :md, status: nil, status_position: :bottom_right, style: :filled, theme: :white, classes: nil, id: nil, **html_options)`

**Parameters:**
- `name`: String - Nome per generare le iniziali (primo parametro posizionale)
- `src`: String - URL dell'immagine avatar
- `shape`: Symbol - Forma dell'avatar (`:circle`, `:square`, `:rounded`)
- `size`: Symbol - Dimensione dell'avatar (`:xxs`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `status`: Symbol - Indicatore di stato online (`:online`, `:offline`, `:busy`, `:away`)
- `status_position`: Symbol - Posizione dell'indicatore di stato (`:bottom_right`, `:bottom_left`, `:top_right`, `:top_left`)
- `style`: Symbol - Stile dell'avatar (`:filled`, `:outline`, `:light`)
- `theme`: Symbol - Tema colore per il placeholder (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Classi CSS aggiuntive
- `id`: String - ID dell'elemento HTML
- `**html_options`: Hash - Attributi HTML aggiuntivi

**Esempi di Utilizzo:**

```erb
<!-- Avatar con immagine -->
<%= bui_avatar("John Doe", src: "/path/to/image.jpg") %>

<!-- Avatar con iniziali -->
<%= bui_avatar("John Doe", theme: :blue, size: :lg) %>

<!-- Avatar con stato online -->
<%= bui_avatar("John Doe", status: :online, status_position: :bottom_right) %>

<!-- Avatar quadrato con stile outline -->
<%= bui_avatar("John Doe", shape: :square, style: :outline, theme: :green) %>

<!-- Avatar con parametri keyword (raccomandato) -->
<%= bui_avatar(
  name: "John Doe",
  src: "/path/to/image.jpg",
  size: :xl,
  shape: :circle,
  status: :online,
  theme: :blue,
  classes: "custom-class",
  id: "user-avatar"
) %>
```

**Note Importanti:**
- Il componente accetta sia un parametro posizionale per `name` che parametri keyword
- Se viene fornito `src`, viene mostrata l'immagine; altrimenti vengono mostrate le iniziali
- Le iniziali vengono generate automaticamente dal nome fornito
- L'indicatore di stato viene mostrato solo se `status` è specificato e valido
- L'attributo `alt` dell'immagine viene impostato automaticamente al valore di `name` o "Avatar"

### bui_badge
**Default Signature:** `bui_badge(text, theme: :default, variant: :default, size: :sm, rounded: :md, classes: "", **options)`

**Parameters:**
- `text`: String - Badge text
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:primary`, `:secondary`, `:outline`, `:ghost`)
- `size`: Symbol - Badge size (`:xs`, `:sm`, `:md`, `:lg`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_button
**Default Signature:** `bui_button(text, theme: :blue, size: :md, variant: :default, full_width: false, disabled: false, icon: nil, href: nil, data: {}, classes: "", id: nil, rounded: :md, button_type: :button)`

**Parameters:**
- `text`: String - Button text
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Button size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `variant`: Symbol - Style variant (`:default`, `:primary`, `:secondary`, `:outline`, `:ghost`, `:link`)
- `full_width`: Boolean - Full width button
- `disabled`: Boolean - Disabled state
- `icon`: String - Icon name
- `href`: String - Link URL (creates anchor tag)
- `data`: Hash - Data attributes
- `classes`: String - Additional CSS classes
- `id`: String - Element ID
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `button_type`: Symbol - Button type (`:button`, `:submit`, `:reset`)

### bui_label
**Default Signature:** `bui_label(text = nil, for: nil, required: false, size: :md, weight: :normal, theme: :default, classes: "", id: nil, **html_options)`

**Parameters:**
- `text`: String - Label text
- `for`: String - ID of associated element
- `required`: Boolean - Show required field indicator
- `size`: Symbol - Text size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `weight`: Symbol - Font weight (`:normal`, `:medium`, `:semibold`, `:bold`)
- `theme`: Symbol - Color theme (`:default`, `:muted`, `:primary`, `:secondary`)
- `classes`: String - Additional CSS classes
- `id`: String - HTML ID
- `**html_options`: Hash - Additional HTML attributes

**Usage Examples:**
```erb
<%= bui_label("Username", for: "username") %>
<%= bui_label("Email", for: "email", required: true) %>
<%= bui_label("Description", size: :lg, weight: :semibold) %>
<%= bui_label("Optional field", theme: :muted) %>
```

**Important Notes:**
- Use the `for` attribute to associate the label with the corresponding field
- The `required: true` indicator automatically adds a red asterisk (*)
- For accessibility, always ensure labels are connected to their respective fields

### bui_divider
**Default Signature:** `bui_divider(theme: :default, variant: :default, classes: "", **options)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:dashed`, `:dotted`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_dropdown
**Default Signature:** `bui_dropdown(theme: :default, size: :md, rounded: :md, position: :bottom, animation: :default, classes: "", **options, &block)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Dropdown size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `position`: Symbol - Dropdown position (`:top`, `:bottom`, `:left`, `:right`)
- `animation`: Symbol - Animation type (`:default`, `:fade`, `:slide`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_dropdown_item
**Default Signature:** `bui_dropdown_item(text, href: nil, classes: "", **options)`

**Parameters:**
- `text`: String - Item text
- `href`: String - Link URL
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_dropdown_divider
**Default Signature:** `bui_dropdown_divider(classes: "", **options)`

**Parameters:**
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_grid
**Default Signature:** `bui_grid(cols: {sm: 1}, gap: {sm: :md}, rows: nil, started: nil, ended: nil, row_started: nil, row_ended: nil, theme: :white, padding: :none, rounded: :none, justify: :start, align: :start, classes: nil, data: {}, id: nil, **html_options, &block)`

**Parameters:**
- `cols`: Hash - Responsive columns configuration (e.g., `{sm: 1, md: 2, lg: 3}`)
- `gap`: Hash - Responsive gap configuration (e.g., `{sm: :md, lg: :lg}`)
- `rows`: Hash - Responsive rows configuration (optional)
- `started`: Hash - Grid start position configuration (optional)
- `ended`: Hash - Grid end position configuration (optional)
- `row_started`: Hash - Row start position configuration (optional)
- `row_ended`: Hash - Row end position configuration (optional)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `padding`: Symbol - Internal padding (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `justify`: Symbol - Horizontal alignment (`:start`, `:center`, `:end`, `:between`, `:around`, `:evenly`)
- `align`: Symbol - Vertical alignment (`:start`, `:center`, `:end`, `:stretch`)
- `classes`: String - Additional CSS classes
- `data`: Hash - Data attributes
- `id`: String - Element ID
- `**html_options`: Hash - Additional HTML attributes

**Usage Examples:**

**Basic Grid:**
```erb
<%= bui_grid(cols: { sm: 1, md: 2, lg: 3 }, gap: { sm: :sm, md: :md }) do %>
  <div>Grid Item 1</div>
  <div>Grid Item 2</div>
  <div>Grid Item 3</div>
<% end %>
```

**Grid with Items (Recommended):**
```erb
<%= bui_grid(cols: { sm: 1, md: 2, lg: 3 }, gap: { sm: :sm, md: :md }) do |grid| %>
  <% grid.with_item(span: { sm: 2, lg: 1 }) do %>
    <div>Featured Item (spans 2 columns)</div>
  <% end %>
  
  <% grid.with_item do %>
    <div>Regular Item</div>
  <% end %>
  
  <% grid.with_item(started: { lg: 2 }, ended: { lg: 4 }) do %>
    <div>Positioned Item</div>
  <% end %>
<% end %>
```

### grid.with_item
**Used within bui_grid block to create grid items with advanced positioning.**

**Parameters:**
- `span`: Hash - Responsive column span configuration
- `row_span`: Hash - Responsive row span configuration
- `started`: Hash - Grid column start position
- `ended`: Hash - Grid column end position
- `row_started`: Hash - Grid row start position
- `row_ended`: Hash - Grid row end position
- `justify_self`: Symbol - Individual item horizontal alignment
- `align_self`: Symbol - Individual item vertical alignment
- `**html_options`: Hash - Additional HTML attributes

**Examples:**
```erb
<!-- Spanning multiple columns -->
<% grid.with_item(span: { sm: 2, lg: 3 }) do %>
  <div>Wide item</div>
<% end %>

<!-- Specific positioning -->
<% grid.with_item(started: { lg: 2 }, ended: { lg: 4 }) do %>
  <div>Positioned from column 2 to 4</div>
<% end %>

<!-- Row spanning -->
<% grid.with_item(row_span: { sm: 2 }) do %>
  <div>Tall item</div>
<% end %>
```

### bui_heading
**Default Signature:** `bui_heading(text, level: 2, theme: :white, align: :left, size: :md, style: :normal, icon: nil, subtitle: nil, with_divider: false, **html_options)`

**Parameters:**
- `text`: String - Heading text
- `level`: Integer - Heading level (1-6)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `align`: Symbol - Text alignment (`:left`, `:center`, `:right`)
- `size`: Symbol - Heading size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `style`: Symbol - Font style (`:normal`, `:italic`)
- `icon`: String - Icon name (optional)
- `subtitle`: String - Subtitle text (optional)
- `with_divider`: Boolean - Show divider below heading
- `**html_options`: Hash - Additional HTML attributes

### bui_icon
**Default Signature:** `bui_icon(name, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Icon name
- `size`: Symbol - Icon size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_link
**Default Signature:** `bui_link(text, href, theme: :blue, variant: :default, classes: "", **options)`

**Parameters:**
- `text`: String - Link text
- `href`: String - Link URL
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:underline`, `:no_underline`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_modal
**Default Signature:** `bui_modal(close_on_backdrop: true, close_on_escape: true, lock_scroll: true, theme: :default, size: :md, rounded: :lg, classes: "", html_options: {}, &block)`

**Parameters:**
- `close_on_backdrop`: Boolean - Close modal when clicking backdrop
- `close_on_escape`: Boolean - Close modal with Escape key
- `lock_scroll`: Boolean - Lock body scroll when modal is open
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Modal size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `classes`: String - Additional CSS classes
- `html_options`: Hash - Additional HTML attributes

### bui_progress
**Default Signature:** `bui_progress(value, max: 100, theme: :blue, size: :md, rounded: :full, classes: "", **options)`

**Parameters:**
- `value`: Numeric - Current progress value
- `max`: Numeric - Maximum progress value
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Progress bar size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_spinner
**Default Signature:** `bui_spinner(size: :md, theme: :blue, classes: "", **options)`

**Parameters:**
- `size`: Symbol - Spinner size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_tag
**Default Signature:** `bui_tag(text, theme: :default, variant: :default, size: :sm, rounded: :md, removable: false, classes: "", **options)`

**Parameters:**
- `text`: String - Tag text
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:outline`, `:ghost`)
- `size`: Symbol - Tag size (`:xs`, `:sm`, `:md`, `:lg`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:full`)
- `removable`: Boolean - Show remove button
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_text
**Default Signature:** `bui_text(text = nil, theme: :default, size: :md, align: :left, weight: :normal, style: :normal, classes: '', **html_options, &block)`

**Parameters:**
- `text`: String - Text content
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Text size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `align`: Symbol - Text alignment (`:left`, `:center`, `:right`, `:justify`)
- `weight`: Symbol - Font weight (`:thin`, `:light`, `:normal`, `:medium`, `:semibold`, `:bold`, `:extrabold`, `:black`)
- `style`: Symbol - Font style (`:normal`, `:italic`)
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_tooltip
**Default Signature:** `bui_tooltip(content, text, position: :top, theme: :default, classes: "", **options)`

**Parameters:**
- `content`: String - Tooltip content
- `text`: String - Trigger text
- `position`: Symbol - Tooltip position (`:top`, `:bottom`, `:left`, `:right`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

## Table Components

### bui_table
**Default Signature:** `bui_table(data: nil, headers: nil, theme: :default, radius: :md, size: :md, striped: false, hoverable: false, bordered: false, compact: false, minimal: false, classes: "", **options, &block)`

**Parameters:**
- `data`: Array - Table data (optional, for simple tables)
- `headers`: Array - Table headers (optional, for simple tables)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `radius`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `size`: Symbol - Table size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `striped`: Boolean - Striped rows
- `hoverable`: Boolean - Hover effects on rows
- `bordered`: Boolean - Table borders
- `compact`: Boolean - Compact spacing
- `minimal`: Boolean - Minimal styling
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

**Table Architecture:**
The table component uses a 4-level structure with `renders_one` and `renders_many`:
- **Table** → **Section** (thead/tbody/tfoot) → **Row** (tr) → **Cell** (th/td)

**Usage Examples:**

**Simple Table with Data:**
```erb
<%= bui_table(
  headers: ["Name", "Email", "Role"],
  data: [
    ["John Doe", "john@example.com", "Admin"],
    ["Jane Smith", "jane@example.com", "User"]
  ],
  theme: :white,
  striped: true,
  hoverable: true
) %>
```

**Advanced Table with Block Structure:**
```erb
<%= bui_table(theme: :white, striped: true, hoverable: true) do |table| %>
  <% table.with_thead do |thead| %>
    <% thead.with_row do |row| %>
      <% row.with_header("Name", sortable: true, sorted: true, sort_direction: :asc) %>
      <% row.with_header("Email", sortable: true) %>
      <% row.with_header("Actions", scope: :col) %>
    <% end %>
  <% end %>
  
  <% table.with_tbody do |tbody| %>
    <% @users.each_with_index do |user, index| %>
      <% tbody.with_row(striped_index: index) do |row| %>
        <% row.with_cell(user.name, align: :left) %>
        <% row.with_cell(user.email, align: :left) %>
        <% row.with_cell do %>
          <%= bui_button("Edit", size: :sm, theme: :blue) %>
          <%= bui_button("Delete", size: :sm, theme: :red) %>
        <% end %>
      <% end %>
    <% end %>
  <% end %>
  
  <% table.with_tfoot do |tfoot| %>
    <% tfoot.with_row do |row| %>
      <% row.with_cell("Total: #{@users.count} users", colspan: 3, align: :center) %>
    <% end %>
  <% end %>
<% end %>
```

**Sub-component Parameters:**

**table.with_thead/with_tbody/with_tfoot:**
- `theme`: Symbol - Section theme
- `striped`: Boolean - Striped rows (tbody only)
- `hoverable`: Boolean - Hover effects (tbody only)

**section.with_row:**
- `theme`: Symbol - Row theme
- `highlighted`: Boolean - Highlight row
- `striped_index`: Integer - Index for striped calculation

**row.with_header (th):**
- `theme`: Symbol - Header theme
- `sortable`: Boolean - Show sort indicator
- `sorted`: Boolean - Currently sorted
- `sort_direction`: Symbol - Sort direction (`:asc`, `:desc`)
- `scope`: Symbol - Header scope (`:col`, `:row`)
- `align`: Symbol - Text alignment (`:left`, `:center`, `:right`)

**row.with_cell (td):**
- `theme`: Symbol - Cell theme
- `align`: Symbol - Text alignment (`:left`, `:center`, `:right`)
- `compact`: Boolean - Compact spacing
- `colspan`: Integer - Column span
- `rowspan`: Integer - Row span

### bui_pagination
**Default Signature:** `bui_pagination(current_page: 1, total_pages: 1, theme: :default, size: :md, classes: "", **options)`

**Parameters:**
- `current_page`: Integer - Current page number
- `total_pages`: Integer - Total number of pages
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Pagination size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

## Tabs Components

### bui_tabs
**Default Signature:** `bui_tabs(theme: :default, variant: :default, size: :md, classes: "", **options, &block)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:pills`, `:underline`)
- `size`: Symbol - Tabs size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_tab
**Default Signature:** `bui_tab(text, active: false, classes: "", **options)`

**Parameters:**
- `text`: String - Tab text
- `active`: Boolean - Active state
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_tab_panel
**Default Signature:** `bui_tab_panel(content = nil, active: false, classes: "", **options, &block)`

**Parameters:**
- `content`: String - Panel content
- `active`: Boolean - Active state
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

## Form Components

### bui_field
**Default Signature:** `bui_field(label: nil, hint: nil, error: nil, required: false, classes: "", **options, &block)`

**Parameters:**
- `label`: String - Field label
- `hint`: String - Help text
- `error`: String - Error message
- `required`: Boolean - Required field indicator
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_text
**Default Signature:** `bui_input_text(name, value: nil, placeholder: nil, disabled: false, readonly: false, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Input name attribute
- `value`: String - Input value
- `placeholder`: String - Placeholder text
- `disabled`: Boolean - Disabled state
- `readonly`: Boolean - Readonly state
- `size`: Symbol - Input size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_email
**Default Signature:** `bui_input_email(name, value: nil, placeholder: nil, disabled: false, readonly: false, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Input name attribute
- `value`: String - Input value
- `placeholder`: String - Placeholder text
- `disabled`: Boolean - Disabled state
- `readonly`: Boolean - Readonly state
- `size`: Symbol - Input size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_password
**Default Signature:** `bui_input_password(name, value: nil, placeholder: nil, disabled: false, readonly: false, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Input name attribute
- `value`: String - Input value
- `placeholder`: String - Placeholder text
- `disabled`: Boolean - Disabled state
- `readonly`: Boolean - Readonly state
- `size`: Symbol - Input size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_number
**Default Signature:** `bui_input_number(name, value: nil, min: nil, max: nil, step: nil, placeholder: nil, disabled: false, readonly: false, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Input name attribute
- `value`: Numeric - Input value
- `min`: Numeric - Minimum value
- `max`: Numeric - Maximum value
- `step`: Numeric - Step increment
- `placeholder`: String - Placeholder text
- `disabled`: Boolean - Disabled state
- `readonly`: Boolean - Readonly state
- `size`: Symbol - Input size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_textarea
**Default Signature:** `bui_input_textarea(name, value: nil, placeholder: nil, rows: 4, disabled: false, readonly: false, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Input name attribute
- `value`: String - Input value
- `placeholder`: String - Placeholder text
- `rows`: Integer - Number of rows
- `disabled`: Boolean - Disabled state
- `readonly`: Boolean - Readonly state
- `size`: Symbol - Input size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_select
**Default Signature:** `bui_input_select(name, options, selected: nil, placeholder: nil, disabled: false, size: :md, theme: :default, classes: "", **html_options)`

**Parameters:**
- `name`: String - Select name attribute
- `options`: Array/Hash - Select options
- `selected`: String - Selected value
- `placeholder`: String - Placeholder text
- `disabled`: Boolean - Disabled state
- `size`: Symbol - Select size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_input_checkbox
**Default Signature:** `bui_input_checkbox(name, value: "1", checked: false, disabled: false, size: :md, theme: :blue, classes: "", **options)`

**Parameters:**
- `name`: String - Checkbox name attribute
- `value`: String - Checkbox value
- `checked`: Boolean - Checked state
- `disabled`: Boolean - Disabled state
- `size`: Symbol - Checkbox size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_radio
**Default Signature:** `bui_input_radio(name, value, checked: false, disabled: false, size: :md, theme: :blue, classes: "", **options)`

**Parameters:**
- `name`: String - Radio name attribute
- `value`: String - Radio value
- `checked`: Boolean - Checked state
- `disabled`: Boolean - Disabled state
- `size`: Symbol - Radio size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_radio_group
**Default Signature:** `bui_input_radio_group(name, options, selected: nil, size: :md, theme: :blue, classes: "", **html_options)`

**Parameters:**
- `name`: String - Radio group name
- `options`: Array/Hash - Radio options
- `selected`: String - Selected value
- `size`: Symbol - Radio size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**html_options`: Hash - Additional HTML attributes

### bui_input_toggle
**Default Signature:** `bui_input_toggle(name, checked: false, disabled: false, size: :md, theme: :blue, classes: "", **options)`

**Parameters:**
- `name`: String - Toggle name attribute
- `checked`: Boolean - Checked state
- `disabled`: Boolean - Disabled state
- `size`: Symbol - Toggle size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_rating
**Default Signature:** `bui_input_rating(name, value: 0, max: 5, size: :md, theme: :yellow, classes: "", **options)`

**Parameters:**
- `name`: String - Rating name attribute
- `value`: Integer - Current rating value
- `max`: Integer - Maximum rating value
- `size`: Symbol - Rating size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_input_pin
**Default Signature:** `bui_input_pin(name, length: 4, size: :md, theme: :default, classes: "", **options)`

**Parameters:**
- `name`: String - Pin input name attribute
- `length`: Integer - Number of pin digits
- `size`: Symbol - Pin input size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

## Application Components

### bui_card
**Default Signature:** `bui_card(theme: :white, variant: :default, size: :md, padding: :md, rounded: :lg, classes: "", **options, &block)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:outlined`, `:elevated`, `:ghost`)
- `size`: Symbol - Card size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `padding`: Symbol - Internal padding (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_container
**Default Signature:** `bui_container(size: :default, classes: "", **options, &block)`

**Parameters:**
- `size`: Symbol - Container size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`, `:xxl`, `:full`, `:default`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_main
**Default Signature:** `bui_main(classes: "", **options, &block)`

**Parameters:**
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_panel
**Default Signature:** `bui_panel(title: nil, body: nil, header: nil, footer: nil, theme: :white, style: :default, padding: :md, rounded: :md, size: :md, **html_options, &block)`

**Parameters:**
- `title`: String - Panel title (optional)
- `body`: String - Panel body content (optional)
- `header`: String - Panel header content (optional)
- `footer`: String - Panel footer content (optional)
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `style`: Symbol - Panel style variant (`:default`, `:bordered`, `:shadow`)
- `padding`: Symbol - Internal padding (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `rounded`: Symbol - Border radius (`:none`, `:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `size`: Symbol - Panel size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `**html_options`: Hash - Additional HTML attributes

## Navigation Components

### bui_breadcrumb
**Default Signature:** `bui_breadcrumb(items, theme: :default, size: :md, separator: "/", classes: "", **options)`

**Parameters:**
- `items`: Array - Breadcrumb items
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `size`: Symbol - Breadcrumb size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `separator`: String - Item separator
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_navbar
**Default Signature:** `bui_navbar(theme: :white, variant: :default, size: :md, classes: "", **options, &block)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:transparent`, `:bordered`)
- `size`: Symbol - Navbar size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

### bui_sidebar
**Default Signature:** `bui_sidebar(theme: :white, variant: :default, size: :md, position: :left, classes: "", **options, &block)`

**Parameters:**
- `theme`: Symbol - Color theme (`:default`, `:white`, `:red`, `:rose`, `:orange`, `:green`, `:blue`, `:yellow`, `:violet`)
- `variant`: Symbol - Style variant (`:default`, `:bordered`, `:elevated`)
- `size`: Symbol - Sidebar size (`:xs`, `:sm`, `:md`, `:lg`, `:xl`)
- `position`: Symbol - Sidebar position (`:left`, `:right`)
- `classes`: String - Additional CSS classes
- `**options`: Hash - Additional HTML attributes

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
- `:xs` - Extra small radius
- `:sm` - Small radius
- `:md` - Medium radius
- `:lg` - Large radius
- `:xl` - Extra large radius
- `:full` - Full radius (circle/pill)

### Common HTML Attributes
- `classes`: String - Additional CSS classes
- `id`: String - Element ID
- `data`: Hash - Data attributes
- `**options`: Hash - Additional HTML attributes