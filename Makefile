SOURCE="https://code-industry.net/public/master-pdf-editor-5.4.38-qt4.amd64.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="Master-PDF-Editor.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv master-pdf-editor-5/* AppDir/opt/application

	chmod +x AppDir/AppRun

	appimagetool AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -rf master-pdf-editor-5
	rm -f $(DESTINATION)
	rm -rf AppDir/opt

