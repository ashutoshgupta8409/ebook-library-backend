# Ebook Library - Ruby on Rails Backend

A Ruby on Rails REST API backend for the Ebook Library application. This API allows users to upload, retrieve, download, search, and delete PDF ebooks using Active Storage for file management.

---

## Features

- Upload PDF ebooks
- Retrieve all ebooks
- Search ebooks by title or author
- Download uploaded PDF files
- Delete ebooks
- Active Storage integration for file uploads
- PostgreSQL database

---

## Tech Stack

- Ruby 3.x
- Ruby on Rails 8
- PostgreSQL
- Active Storage
- REST API

---

## Prerequisites

Before running the project, ensure you have the following installed:

- Ruby 3.x
- Rails 8
- PostgreSQL
- Bundler
- Git

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/ashutoshgupta8409/ebook-library-backend.git
```

### 2. Navigate to the project

```bash
cd ebook-library-backend
```

### 3. Install dependencies

```bash
bundle install
```

### 4. Configure the database

Update the database configuration in:

```
config/database.yml
```

Create the database:

```bash
rails db:create
```

Run migrations:

```bash
rails db:migrate
```


### 5. Seed the database (Optional)

Load sample ebook data into the database:

```bash
rails db:seed
```

### 6. Configure Active Storage

Install Active Storage (if not already installed):

```bash
rails active_storage:install
rails db:migrate
```

### 7. Start the Rails server

```bash
rails server
```

The server will be available at:

```
http://localhost:3000
```

Form Data:

```
ebook[title]
ebook[author]
ebook[description]
ebook[file]
```

---

## Project Structure

```
app/
├── controllers/
├── models/
├── serializers/
├── views/
└── services/

config/
db/
storage/
```

---

## Flutter Frontend

The Flutter application for this project is available at:

**https://github.com/ashutoshgupta8409/ebook-library-flutter**

