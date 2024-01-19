FROM peaceiris/mdbook:v0.4.15

COPY book.toml .
COPY custom.css .
COPY documentation/ documentation/
