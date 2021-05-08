FROM python:3

RUN apt-get update && \
    apt-get install -y chromium && \
    CHROMEVER=$(chromium --product-version | grep -o "[^\.]*\.[^\.]*\.[^\.]*") && \
    DRIVERVER=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROMEVER") && \
    wget -O /tmp/driver.zip https://chromedriver.storage.googleapis.com/$DRIVERVER/chromedriver_linux64.zip && \
    unzip /tmp/driver.zip && \
    rm /tmp/driver.zip && \
    mv chromedriver /bin/chromedriver && \
    rm -rf /var/lib/apt/lists/*