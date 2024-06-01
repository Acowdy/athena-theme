.POSIX:
.PHONY: clean install userinstall useruninstall

SASSC = sassc
DESTDIR = /
PREFIX = /usr/local
USER_THEMES_DIR = $(HOME)/.themes

all: gtk-3.0/gtk.css gtk-3.0/gtk-dark.css

gtk-3.0/gtk.css: gtk-3.0/gtk.scss gtk-3.0/_*.scss
	$(SASSC) gtk-3.0/gtk.scss gtk-3.0/gtk.css

gtk-3.0/gtk-dark.css: gtk-3.0/gtk-dark.scss gtk-3.0/_*.scss
	$(SASSC) gtk-3.0/gtk-dark.scss gtk-3.0/gtk-dark.css

clean:
	rm gtk-3.0/gtk.css

install:
	echo TODO

userinstall: gtk-3.0/gtk.css gtk-3.0/gtk-dark.css
	mkdir -p $(USER_THEMES_DIR)/Athena
	cp index.theme $(USER_THEMES_DIR)/Athena/index.theme
	mkdir -p $(USER_THEMES_DIR)/Athena/gtk-3.0
	cp gtk-3.0/gtk.css $(USER_THEMES_DIR)/Athena/gtk-3.0/gtk.css
	cp gtk-3.0/gtk-dark.css $(USER_THEMES_DIR)/Athena/gtk-3.0/gtk-dark.css
	cp gtk-3.0/upstream/Adwaita/assets.txt $(USER_THEMES_DIR)/Athena/gtk-3.0/
	cp -R gtk-3.0/upstream/Adwaita/assets $(USER_THEMES_DIR)/Athena/gtk-3.0/
	cp -R $(USER_THEMES_DIR)/Athena $(USER_THEMES_DIR)/Athena-Dark
	cp gtk-3.0/gtk-dark.css $(USER_THEMES_DIR)/Athena-Dark/gtk-3.0/gtk.css
	cp index-dark.theme $(USER_THEMES_DIR)/Athena-Dark/index.theme

useruninstall:
	rm -r $(USER_THEMES_DIR)/Athena
	rm -r $(USER_THEMES_DIR)/Athena-Dark
