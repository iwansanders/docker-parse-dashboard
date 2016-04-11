FROM node:latest

ENV PARSE_HOME /src
ADD . $PARSE_HOME
WORKDIR $PARSE_HOME

RUN npm install

ENV PORT 4040
ENV PORTSSL 4041
EXPOSE $PORT
EXPOSE $PORTSSL

#ENV PARSE_SERVER_URL https://api.parse.com/1
#ENV PARSE_APP_ID
#ENV PARSE_MASTER_KEY
#ENV PARSE_JS_KEY
#ENV PARSE_REST_KEY
#ENV PARSE_APP_NAME "My Parse.Com App"
#ENV SERVER_URL http://localhost:1337/parse
#ENV APP_ID
#ENV MASTER_KEY
#ENV APP_NAME "My parse Server App"

# for envsubst
RUN apt-get update && \
    apt-get install -y --no-install-recommends gettext-base && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/*

ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["npm", "run", "dashboard"]
