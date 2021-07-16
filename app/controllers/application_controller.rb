# frozen_string_literal: true

class ApplicationController
  def build_response(body, status: 200)
    [status, { "Content-Type" => "text/html" }, [body]]
  end

  def render_template(name = 'index')
    # This line gets the name of the folder, in this case "profits"
    views_dir = self.class.name.downcase.sub("controller", "")

    # This line gets the name of the folder and the view, for the
    # default case "profits/index.html.erb"
    view_file = File.join(views_dir, "#{name}.html.erb")

    # This line gets the full path of the view, in this case
    # ... app/views/profits/index.html.erb
    file_path = file_path_for(view_file)

    if File.exists?(file_path)
      render_view(file_path)
    else
      view_not_found(view_file)
    end
  end

  def file_path_for(file_name)
    File.expand_path(File.join("../../views", file_name), __FILE__)
  end

  def render_view(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

  def view_not_found(view_file)
    <<~HTML
      <html>
        <head>
          <title>Stocks Profitfy</title>
        </head>
        <body>
          <h1>View #{view_file} not found!</h1>
        </body>
      </html>
    HTML
  end
end
