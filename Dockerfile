FROM continuumio/miniconda3

WORKDIR /spectral_filt_topo
ENV PATH /opt/conda/envs/base/bin:$PATH

RUN conda update conda \
    && conda update --all \
    && conda config --add channels conda-forge \
    && conda config --add channels default

RUN conda create --name sft python=3.8

RUN echo "source activate sft" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

RUN conda install -n sft jupyter matplotlib numpy ipympl numexpr scipy shapely pyproj
RUN conda install -n sft -c conda-forge gdal
RUN conda install -n sft -c conda-forge python-pdal
RUN pip install geopandas 

RUN conda clean --all

CMD ["/bin/bash"]
