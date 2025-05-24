class TestController < ApplicationController
  def spinner
    render inline: <<~HTML
      <!DOCTYPE html>
      <html>
        <head>
          <title>Test Spinner</title>
          <script src="https://cdn.tailwindcss.com"></script>
        </head>
        <body class="p-8 bg-gray-100">
          <h1 class="text-2xl font-bold mb-8">Test Componente Spinner</h1>
          
          <div class="space-y-8">
            <div>
              <h2 class="text-lg font-semibold mb-4">Dimensioni</h2>
              <div class="flex items-center gap-8">
                <div>
                  <p class="mb-2">Small (16px)</p>
                  <%= render BetterUi::General::Spinner::Component.new(size: :small, theme: :blue, label: "Caricamento...") %>
                </div>
                <div>
                  <p class="mb-2">Medium (24px)</p>
                  <%= render BetterUi::General::Spinner::Component.new(size: :medium, theme: :green, label: "Caricamento...") %>
                </div>
                <div>
                  <p class="mb-2">Large (32px)</p>
                  <%= render BetterUi::General::Spinner::Component.new(size: :large, theme: :red, label: "Caricamento...") %>
                </div>
              </div>
            </div>
            
            <div>
              <h2 class="text-lg font-semibold mb-4">Temi</h2>
              <div class="flex items-center gap-4">
                <% [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet].each do |theme| %>
                  <div class="text-center">
                    <p class="mb-2 text-sm"><%= theme %></p>
                    <%= render BetterUi::General::Spinner::Component.new(theme: theme, size: :medium) %>
                  </div>
                <% end %>
              </div>
            </div>
            
            <div>
              <h2 class="text-lg font-semibold mb-4">Con Helper</h2>
              <div class="flex items-center gap-4">
                <%= bui_spinner("Con helper small", size: :small, theme: :violet) %>
                <%= bui_spinner("Con helper medium", size: :medium, theme: :blue) %>
                <%= bui_spinner("Con helper large", size: :large, theme: :green) %>
              </div>
            </div>
          </div>
        </body>
      </html>
    HTML
  end
end
