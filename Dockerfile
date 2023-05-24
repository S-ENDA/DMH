FROM peaceiris/mdbook:v0.4.15

COPY book.toml .
COPY documentation/ documentation/
