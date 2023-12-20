JEKYLL=bundle exec jekyll
JOPTS= #--trace --verbose

serve:
	${JEKYLL} serve ${JOPTS}

deploy:
	${JEKYLL} build ${JOPTS} --destination ../school2024/

draft:
	${JEKYLL} serve ${JOPTS} --draft --future

clean:
	rm -fr _site/
