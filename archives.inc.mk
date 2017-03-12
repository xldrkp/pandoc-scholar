# Generate Archives for distribution
# ==================================

archives: dist/pandoc-scholar.zip dist/pandoc-scholar.tar.gz

dist/pandoc-scholar: \
		scholarly-metadata \
		LICENSE README.md \
		Makefile pandoc-options.inc.mk scholarly-metadata.inc.mk \
		example jats templates writers
	rm -rf $@
	mkdir -p $@
	cp -av $^ $@

dist/pandoc-scholar.tar.gz: dist/pandoc-scholar
	rm -f $@
	tar zvcf $@ -C $(dir $<) $(notdir $<)

dist/pandoc-scholar.zip: dist/pandoc-scholar
	rm -f $@
	(cd $(dir $<) && zip -r $(notdir $@) $(notdir $<))

clean-archives:
	rm -rf dist

dist-clean: clean-setup clean-archives

.PHONY: archives clean-archives dist-clean
