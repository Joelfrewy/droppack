Deface::Override.new(
    virtual_path:  'spree/layouts/admin',
    name:          'vendors_main_menu_tabs',
    insert_bottom: '#main-sidebar',
    text:       <<-HTML
                <% if current_spree_user.respond_to?(:has_spree_role?) %>
                  <ul class="nav nav-sidebar">
                    <%= tab plural_resource_name(Spree::Vendor), url: admin_vendors_path, icon: 'money' %>
                  </ul>
                <% end %>
HTML
)