FROM nickblah/lua:5.1-luarocks-centos
RUN yum -y update \
  && yum -y install gcc
RUN luarocks install busted \
  && luarocks install LuaCov
VOLUME ["/data"]
ENTRYPOINT [ "busted", "--directory=data", "." ]
