# Blog App

A simple blogging application built with Ruby on Rails 8. Write articles, manage drafts, and publish content with a clean and minimal interface.

---

## Features

- Create, read, update, and delete articles
- Publish or save articles as drafts
- Index page displays only published articles
- Model validations to protect data integrity
- Clean, minimal CSS styling with no external dependencies

---

## Tech Stack

- **Ruby** 3.2+
- **Rails** 8.0+
- **SQLite3** (default development database)
- **Propshaft** (asset pipeline)
- **ERB** (templating)

---

## Getting Started

### Prerequisites

Make sure you have the following installed on your machine:

- Ruby 3.2 or higher
- Rails 8.0 or higher
- SQLite3

To verify:

```bash
ruby -v
rails -v
```

### Installation

Clone the repository:

```bash
git clone https://github.com/jecode93/build-a-blog-with-ruby-on-rails-8.git
cd build-a-blog-with-ruby-on-rails-8
```

Install dependencies:

```bash
bundle install
```

Set up the database:

```bash
bin/rails db:migrate
```

Start the development server:

```bash
bin/rails server
```

Visit `http://localhost:3000` in your browser.

---

## Usage

Once the server is running:

- The home page lists all published articles
- Click any article title to read the full post
- Use the **New Article** link to create a new post
- Check the **Published** checkbox when creating or editing to make an article visible on the index page
- Articles left unchecked are saved as drafts and remain hidden from the index

---

## Project Structure

```
app/
  controllers/
    articles_controller.rb   # Handles all article actions
  models/
    article.rb               # Validations and published/drafts scopes
  views/
    articles/
      index.html.erb         # Article listing page
      show.html.erb          # Single article page
      new.html.erb           # New article form
      edit.html.erb          # Edit article form
      _form.html.erb         # Shared form partial
      _article.html.erb      # Article display partial
config/
  routes.rb                  # root route and article resources
db/
  schema.rb                  # Database structure
app/assets/stylesheets/
  application.css            # Global styles
```

---

## Article Model

```ruby
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }

  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }
end
```

---

## Routes

```
GET    /articles          articles#index
GET    /articles/:id      articles#show
GET    /articles/new      articles#new
POST   /articles          articles#create
GET    /articles/:id/edit articles#edit
PATCH  /articles/:id      articles#update
DELETE /articles/:id      articles#destroy
```

Root is set to `articles#index`.

---

## Future Improvements

- User authentication with Devise
- Categories and tags for articles
- Pagination with Pagy or Kaminari
- Rich text editing with ActionText
- Deployment to Hetzner, Render or Fly.io

---

## License

This project is open source and available under the [MIT License](LICENSE).