# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.


all: clean

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/mpe5
	apprepo --destination=$(PWD)/build appdir boilerplate libqt5printsupport5 libqt5svg5 libqt5pdfwidgets5 libqt5core5a \
												libqt5gui5 libqt5network5

	wget --output-document=$(PWD)/build/build.tar.gz https://code-industry.net/public/master-pdf-editor-5.8.06-qt5.x86_64.tar.gz
	tar -zxvf $(PWD)/build/build.tar.gz  -C $(PWD)/build/Boilerplate.AppDir/	

	cp --force --recursive $(PWD)/build/Boilerplate.AppDir/master-pdf-editor*/* $(PWD)/build/Boilerplate.AppDir/mpe5
	rm -rf $(PWD)/build/Boilerplate.AppDir/master-pdf-editor*

	rm -f $(PWD)/build/Boilerplate.AppDir/mpe5/*.desktop 		|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe5/*.png 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe5/*.svg 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe5/*.jpg 		  	|| true

	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}:$${APPDIR}/mpe5' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'ls -lah $${APPDIR}/mpe5/masterpdfeditor*.sh > /dev/null 2>&1 && exec $${APPDIR}/mpe5/masterpdfeditor*.sh "$${@}"' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'ls -lah $${APPDIR}/mpe5/masterpdfeditor*    > /dev/null 2>&1 && exec $${APPDIR}/mpe5/masterpdfeditor*    "$${@}"' >> $(PWD)/build/Boilerplate.AppDir/AppRun


	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop 		|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.jpg 		  	|| true

	cp --force $(PWD)/AppDir/*.svg 		  	$(PWD)/build/Boilerplate.AppDir 			|| true
	cp --force $(PWD)/AppDir/*.desktop 		$(PWD)/build/Boilerplate.AppDir 			|| true
	cp --force $(PWD)/AppDir/*.png 		  	$(PWD)/build/Boilerplate.AppDir 			|| true

	chmod +x $(PWD)/build/Boilerplate.AppDir/AppRun

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/MasterPDFEditor.AppImage
	chmod +x $(PWD)/MasterPDFEditor.AppImage

clean: 
	rm --recursive --force $(PWD)/build