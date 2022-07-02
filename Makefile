OUT=out
COMMIT_ID=$(shell git log --pretty=format:'%h' -n 1)
NOW=$(shell date +%Y-%m-%dT%H:%M:%S%z)
PKG_NOTEBOOKS:=$(OUT)/notebooks-$(COMMIT_ID).tar.gz
PKG_DATA:=$(OUT)/data-$(COMMIT_ID).tgz
VERSION_FILE:=$(OUT)/version.txt

.PHONY: all
all: clean $(PKG_DATA) $(PKG_NOTEBOOKS) $(VERSION_FILE)

.PHONY: clean
clean:
	rm -rf $(OUT)

$(OUT):
	mkdir -p $(OUT)

$(VERSION_FILE):
	echo "$(COMMIT_ID)" > $(VERSION_FILE)
	echo "$(NOW)" >> $(VERSION_FILE)

$(PKG_NOTEBOOKS): $(OUT)
	git archive --format=tar HEAD . | gzip -9 > $(PKG_NOTEBOOKS)
	shasum $(PKG_NOTEBOOKS) > $(PKG_NOTEBOOKS).sha1

$(PKG_DATA): $(OUT)
	tar --exclude='./data/.ipynb_checkpoints' -zcvf $(PKG_DATA) data/
	shasum $(PKG_DATA) > $(PKG_DATA).sha1

requirements.txt:
	pip install --upgrade pip wheel
	pip install jupyterlab pandas seaborn scikit-learn "dask[complete]" mimesis pyarrow
	pip freeze > requirements.txt

.PHONY: up
up:
	docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(PWD):/home/jovyan/bigdataupv -ti jupyter/scipy-notebook
