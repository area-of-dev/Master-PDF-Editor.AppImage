SOURCE="https://code-industry.net/public/master-pdf-editor-5.4.38-qt5-all.amd64.tar.gz"
DESTINATION="build.tar.gz"
OUTPUT="Master-PDF-Editor.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	cp -r master-pdf-editor-5/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -rf master-pdf-editor-5
	rm -f $(DESTINATION)
	rm -rf AppDir/opt

