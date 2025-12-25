ZIP_NAME := install.zip

all: zip

zip:
	@echo "Gerando $(ZIP_NAME) ..."
	@rm -f $(ZIP_NAME)
	@zip -r $(ZIP_NAME) . -x "$(ZIP_NAME)"
	@echo "Arquivo $(ZIP_NAME) criado com sucesso."

clean:
	@rm -f $(ZIP_NAME)
